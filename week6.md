# Week 6

# Objectives

1. SOLID 
- BDD
- Backbone
- Backbone Views
- Backbone Models

---

# Discussion Topics and Homework

- Monday
    + Example TDD/BDD repo from today: https://github.com/TIY-Houston-Front-End-Engineering/BDD-discussion-Person-Arrays-Regex
    + **Homework**
        * Complete the [BDD Arrays assignment](https://github.com/matthiasak/js-assignments/blob/master/tdd-mocha-chai-1/README.md)
- Tuesday
    + **Homework**
        * Complete the [Backbone.Events & Views assignment](https://github.com/matthiasak/js-assignments/tree/master/backbone-events-views-1)

---

- SOLID

    > paraphrased from http://en.wikipedia.org/wiki/SOLID_%28object-oriented_design%29
    
    1. (S)ingle responsibility principle - write small functions that expect the same input types and return the same output types.
    2. (O)pen/closed principle - use IIFEs around our code, and expose only what we want for modification; our constructors/prototypes should be open for extension, but not open for modification.
    3. (L)iskov subsitution principle - instances of constructors should be replaceable by instances a sub-class and the program's behavior should still be the same. Example: Cat is a subclass of Animal; Animals and Cats can both speak().
    4. (I)nterface segregation principle - creating multiple small interfaces/classes is more flexible and modular than creating one large class.
    5. (D)ependency inversion principle - This goes along with #3 above. by declaring your code to use APIs provided by an interface (a constructor higher on the chain). For example, if a program could use a Cat or Dog, etc.. then use methods defined on the Animal prototype because Cat and Dog would be interchangeable.

- BDD

    **Walkthrough of BDD: http://chaijs.com/api/bdd/**

    > **Disclaimer**: Behavior Driven Development and Test Driven Development are typically included under the same moniker, and really don't differ too much. We will specifically focus on BDD. But seriously, they are almost exactly the same thing save a function or two's names.

    BDD is a weird, backwards way of programming. It is slower to do this, but writing tests for your code **before** writing the complete implementation of your code makes you think about SOLID design and your APIs - it forces you to invoke your code first (thinking about how it will be used by someone else), and then write the code to make the test pass.

    **So how do we use our code before it's written? Won't that throw errors?**

    **Yes!** That is exactly the point of this next section:

    BDD is implemented using a process typically termed "Red, Green, Refactor":

    1. `RED`: You write a single test, make the test fail (i.e. a Constructor `Cat()` doesn't exist yet),
    2. `GREEN`: Then you make that test pass (i.e. create a Constructor `Cat()`),
    3. `REFACTOR`: Repeat with a new function.

    **Why is this awesome on big projects?**

    Code breaks. _All the time._

    - Someone uses your API wrong (didn't RTFM)
    - Someone edits your code
    - Your code's dependencies changed (like lodash going from `v2.4.1` to `v3.0.0`)

    Tests tell you with certainty that your code STILL WORKS, instead of having to manually crawl through a site to see if nothing is broken.

    **Testing framework**

    Testing frameworks are wrappers around simple things like `console.assert()`. They take a file and run a series of tests, and tell you if those tests fail or succeed.

    There are many testing frameworks, but we are using the most popular for JS and Node: Mocha and Chai.

    - Mocha (http://mochajs.org/) provides the 'test runner': it loads js files and tests them
    - Chai (http://chaijs.com/) provides the 'testing functions' that tell Mocha if a test failed or succeeded

    Chai has "chains" - methods that help us define what something should be in English:

    - to
    - be
    - been
    - is
    - that
    - and
    - has
    - have
    - with
    - at
    - of
    - same
    - a

    Writing tests for code starts with calling some expected behavior, and then telling the test suite to expect some particular output or behavior.

    ```js
    var foo;
    // do something with foo, then...

    // demo of the ways we can test foo
    expect(foo).to.be.a('string');
    expect(foo).to.equal('bar');
    expect(foo).to.have.length(3);
    expect(tea).to.have.property('flavors').with.length(3)
    ```

- Backbone

    **... an MVC (Model-View-Controller) JavaScript Library**

    Backbone is an MVC structure:

    1. M stands for Model. Models handle `$.get`/`$.post`/etc communication with a resource on a REST API (such as `/listings/:id` on Etsy). They also have
        - built-in events that trigger when data changes on a model instance
        - built-in validation that throws an error if data is invalid
    2. V stands for View. Views handle a single container element (such as a `<div class="container"></div>`) and everything that happens inside that container, such as:
        - built-in method to handle DOM event handlers (`click`s, `keypress`es, etc)
        - built-in method to `render` templates to the DOM

    3. C stands for Controller. For Backbone, a Controller is actually the Router, which we have covered significantly already. :-)

    Backbone also comes with:

    1. Router logic (i.e. Backbone.Router), so that specific functions can be invoked when the URL changes.
    - Router history logic (i.e. Backbone.History), so that the correct route occurs when the user uses the browser back or forward button. Remember, this is a single page application; traditional URLs are not used.
    - Syncing logic (i.e. Backbone.Sync), which aids in the reading and saving of data to the server.
    - An Event (i.e. Backbone.Event) system that facilitates the
    communication between models, views, and collections through the use of custom events and event listeners.
    - A functional JavaScript library (i.e. Underscore.js or Lo-Dash.js).

- Backbone is just a namespace

    30k foot view of Backbone:

    ```js
    (function(){
        var root = this;
        Backbone.VERSION = '1.0.0';
        Backbone.Events = {/*events functions to mixed into any object*/};
        Backbone.Model = function() {/*model constructor*/};
        Backbone.Collection = function() {/*collection constructor*/};
        Backbone.Router = function() {/*router constructor*/};
        Backbone.History = function() {/*history constructor*/};
        Backbone.sync = function() {/*sync function*/};
        Backbone.View = function() {/*view constructor*/};

    }).call(this);
    ```
    
- A quick chat about `Backbone.Router.extend`, `Backbone.View.extend`, `Backbone.Model.extend`

    All the above are **constructors**, we can use them to create new instances:

    ```js
    var toothbrush = new Backbone.Model({ listing_id: 1234561, title: "My toothbrush", description: "so amaze.", price: 1337 })

    var toothbrush_view = new Backbone.View({ el: ".menu" })

    /// and so forth
    ```

    Lodash's extend method takes all properties from the objects, and bundles them up into a single object, giving precedence to right-most arguments.

    ```js
    _.extend(
        { name: 'fred' },
        { employer: 'slate' },
        { years: 15 }
        // ...
    );
    // → { name: 'fred', employer: 'slate', years: 15 }
    
    _.extend(
        { name: 'fred' },
        { employer: 'slate' },
        { years: 15, employer: 'TIY' }
        // ...
    );
    // → { name: 'fred', employer: 'TIY', years: 15 }
    ```

    Backbone.Router.extend creates a new constructor function, whose constructor extends from the Backbone.Router constructor.

    ```js
    Backbone.Router.extend = function(proto){
        var newConstructor = function(){};
        newConstructor.prototype = _.extend({}, Backbone.Router.prototype, proto);
        return newConstructor;
    }

    var EtsyRouter = Backbone.Router.extend({ /* ... */ })
    var myRouter = new EtsyRouter();
    ```

- A Quick Refresher on PubSub
    
    jQuery PubSub just uses jQuery as a mediator (the global object with events) and stores events from all publishers/subscribers on `o`:

    ```js
    ;(function(){
        var o = $({});
        $.subscribe = function() { o.on.apply(o, arguments) }
        $.unsubscribe = function() { o.off.apply(o, arguments) }
        $.publish = function() { o.trigger.apply(o, arguments) }
    });
    ```

    Using:

    ```js
    // in A.js
    $.subscribe("saidHello", function(){ console.log("hiya back!") })

    // in B.js
    $.publish("saidHello"); // code from A.js logs "hiya back!"
    ```

- Backbone.Events

    The Backbone.Events object contains methods that facilitate the observer design pattern and a variation of the observer pattern called pub/sub.

    Backbone's View, Model, and Collection constructors all extend from Backbone.Events:

    ```js
    _.extend(Model.prototype, Backbone.Events);
    _.extend(Router.prototype, Backbone.Events);
    _.extend(Collection.prototype, Backbone.Events);
    _.extend(View.prototype, Backbone.Events);
    ```

    Recently we looked at jQuery as a pub/sub provider. We'll use the built-in event system instead, now that Backbone comes with that feature.

    Guess what global variable has events on it, similar to `$.publish()/$.subscribe()`? The global `Backbone` namespace itself also extends from `Backbone.Events`:

    ```js
    _.extend(Backbone, Backbone.Events);
    ```

    So we can use our Backbone pubsub as such:

    ```js
    //add a custom event to the Backbone object
    Backbone.on('sayHi', function () {
        console.log('Hi');
    });

    //create an eavesdropper object and extend the object with Backbone.Events
    var eavesdropper = _.extend({}, Backbone.Events);

    //Set eavesdropper to listen for custom sayHi event attached to Backbone object
    eavesdropper.listenTo(Backbone, 'sayHi', function () {
        console.log('I heard that');
    });

    //Trigger/Invoke the sayHi custom event
    Backbone.trigger('sayHi'); //logs 'Hi' and 'I heard that'
    ```

    **Note**: any object can extend `Backbone.Events`, like above. Also, we can use any event name, as shown above.

- Backbone events and namespaces

    Namespacing. It's a thing for Backbone events.

    ```js
    var A = _.extend({}, Backbone.Events);

    A.on("test", function(){ console.log("test") });
    A.on("test:hello", function(){ console.log("test:hello") })

    A.trigger("test:hello"); //--> "test:hello"
    A.trigger("test"); 
    //--> "test"
    //--> "test:hello"
    ```

    There is also built-in events that fire when we invoke any Backbone methods:

    **model, collection, view, router, and history object events**
    
    Event name  | Arguments passed to event callback | Description
    ------------- | ------------- | -------------
    `all` | event name | triggered when any other event is triggered in Backbone

    **collection object events**
    
    Event name  | Arguments passed to event callback | Description
    ------------- | ------------- | -------------
    `add` | model, collection, options | when a model is added to a collection
    `remove` | model, collection, options | when a model is removed from a collection
    `reset` | collection, options | when the collection's entire contents have been replaced.
    `sort` | collection, options | when the collection has been re-sorted

    **model object events**

    Event name  | Arguments passed to event callback | Description
    ------------- | ------------- | -------------
    `change` | model, options | when a model's attributes have changed.
    `change:[attribute]` | model, value, options | when a specific attribute has been updated.
    `destroy` | model, collection, options | when a model is destroyed.
    `error` | model, xhr, options | when a model's save call fails on the server.
    `invalid` | model, error, options | when a model's validation fails on the client.

    **model or collection object events**

    Event name  | Arguments passed to event callback | Description
    ------------- | ------------- | -------------
    `request` | model, xhr, options | when a model or collection has started a request to the server.
    `sync` | model, resp, options | when a model (or collection) has been successfully synced with the server.

- Example with Backbone.Events

```js
var Pool = _.extend({}, Backbone.Events),
    Michael = _.extend({}, Backbone.Events),
    Chris = _.extend({}, Backbone.Events),
    log = console.log;


Pool.on("marco", function(){ log("someone yelled marco") })
Michael.listenTo(Pool, "marco", function(){ log("POLO") })
Pool.listenTo(Chris, "marco", function(){ this.trigger("marco") })
Chris.trigger("marco");
// two things logged:
// ---
// someone yelled marco
// POLO
Chris.trigger("marco");
// ... nothing logged
```

- Backbone Router

    Instead of changing `window.location.hash`, we can also call `router.navigate()` with two parameters, the second meaning to trigger the `route` event:

    ```js
    //use navigate() passing it the url to run, this will log 'foo'
    myRouter.navigate('test/foo', {
        trigger: true
    });
    ```

    We've historically ran `Backbone.history.start()` when creating a Router:

    ```js
    Backbone.history.start({

        /*Boolean, default is false, true means use pushState if available and fallback to hash paths if needed.*/
        pushState: true,

        /*Boolean, default is true, a value of false if pushState is true means that browsers that don't support pushState will do a traditional browser reload based on URL pathname.  If pushState is false and hashChange is false then url changes will do a traditional browser reload based on URL pathname. */
        hashChange: false,

        /*String, default is '' and backbone assumes you are serving if from the root url (i.e. /).  A value other than '' is a string path to the directory your application is being server from and the directory Backbone should consider the root directory. */ 
        root:'',

        /* Boolean, default is false, a true value means don't run the default route (i.e.''). */
        silent: true

    });
    ```

- Backbone Views
    
    Grokking:

    ```js
    // declare constructor, which extends from Backbone.View
    var myView = Backbone.View.extend({
        el: "",
        // $el
        initialize: function(options){},
        // remove: function(){}
        render: function(){},

        model: undefined, 
        events: {} || function(){return {}}
        collection: undefined, 
        el: '' || function(){return ''} || DOMElement, 
        id: '', 
        className: '' || function(){return ''}, 
        tagName: '' || function(){return ''}, 
        attributes: {'attribute':'value','attribute2':'value'}

        // event stuff from Backbone.Event
        // on: function(event, callback, context)
        // off: function(event, callback, context)
        // trigger: function(event, arguments)
        // once: function(event, callback, context)
        // listenTo: function(other object, event, callback)
        // stopListening: function(other object, event, callback)
        // listenToOnce: function(other object, event, callback)
    })

    // declare new instance to be used in your program
    var v1 = new myView();
    v1.el //--> DOM Element
    v1.$el //--> jQuery selection of DOM element above
    v1.setElement(/* DOM element */) //--> sets the el and $el of v1
    v1.attributes //--> returns attributes object {}
    v1.$(".some #css [type='selector']") //--> selects elements inside the v1 container (el/$el) with jQuery
    v1.render() //--> idempotent render function that should redraw v1's html inside the container (el/$el)
    v1.remove() //--> removes v1 and it's container element from the DOM entirely; also unregisters any event listeners in v1
    ```

    Each Backbone.View has its own `el` (that is not yet on the DOM). When creating a View, we have three choices:

    1. let the View automatically create an element off the DOM of type `tagname` (we have to append it to the DOM to be visible)
    2. let the View Constructor search for an element on the screen 
        
        ```js
        var MyView = Backbone.View.extend({
            el: "#some-ID-on-the-DOM"
        })

        new MyView().el; //--> should point to DOM element represented by #some-ID-on-the-DOM
        ```

    3. let the `new` assignment pass in a reference

        ```js
        new MyView({ el: document.querySelector('.footer') })
        ```

    **Example from instruction**

    ```js
    var BodyView = Backbone.View.extend({
        el: "body",
        events: {
            "click a": "callback1",
            "submit form": "callback2",
            "mouseup": "callback3"
        },
        callback1: function(event){
            event.preventDefault();
            event.target; // the element that triggered the event

            this.polo();
        },
        callback2: function(event){
            event.preventDefault();
            this.polo();
        },
        callback3: function(event){
            event.preventDefault();
            this.polo();
        },

        polo: function(){
            console.log("POLO")
        }
    })

    var body = new BodyView();
    ```

- Backbone Models

    Grokking:

    ```js
    var Task = Backbone.Model.extend({
        defaults: {},
        id: undefined, // will be a number or identifier for an individual resource (like an Etsy listing's listing_id)
        url: "", // can also be a function that returns a string
        urlRoot: "", // can also be a function that returns a string
        // changedAttributes: function(){}
        // clear: function(){}
        // clone: function(){}
        // fetch: function(){} //--> returns a $.Deferred()
        // save: function(){} //--> returns a $.Deferred()
        // destroy: function(){} //--> returns a $.Deferred()
        // parse: function(){}
        // 
        // validate: function(){} //--> can be run manually, automatically runs when save() is run, or when using {validate: true} with set()
        // validationError: string
        // isValid: function(){}
        // clone: function(){}
        // 
        // has: function(){}
        // unset: function(){}
        // clear: function(){}
        // 
        // event stuff from Backbone.Event
        // on: function(event, callback, context)
        // off: function(event, callback, context)
        // trigger: function(event, arguments)
        // once: function(event, callback, context)
        // listenTo: function(other object, event, callback)
        // stopListening: function(other object, event, callback)
        // listenToOnce: function(other object, event, callback)
        // 
        // toJSON: function(){}
        // 
        // You must use the following when manipulating or accessing the model's data.
        // ---
        // get: function(name){}
        // set: function(data, triggers){} //--> optional trigger for setting information ({validate:true} will validate before setting information)
        // 
        // hasChanged: function(){} --> returns a boolean
        // changedAttributes: function(){} --> returns a copy of the attributes that recently changed
        // 
        // previous: function(){}
        // previousAttributes: function(){}
        // 
        // methods from Lodash:
        // ---
        // keys
        // values
        // pairs
        // invert
        // pick
        // omit
        // 
        validate: function(attrs, options){},
        initialize: function(options){}
    })
    var t1 = new Task({});
    console.log(t1);
    ```

- Backbone Collections

    Collections contain one or more Backbone Models. They allow us to represent multiple domain objects (like Etsy listings).

    Grokking:

    ```js
    var TaskList = Backbone.Collection.extend({
        url: "", // can also be a function that returns a string
        model: Task, // which model constructor will be used to create models?
        // models: Array
        // fetch: function(){} --> Promise
        // add: function(data){}
        // create: function(data){}
        parse: function(){}
        // save: function(){} --> Promise
        // toJSON: function(){}
        // 
        // ... lots of lodash array and collection methods (26 to be exact)
        // --- such as
        // sort: function(){}
        // pluck: function(){}
        // where: function(){}
        // forEach()
        // map()
        // reduce()
        // filter()
        // sortBy()
        // groupBy()
        // contains()
        // reject()
        // findWhere: function(){}
        // add: function(){}
        // remove: function(){}
        // reset: function(){}
        // set: function(){}
        // get: function(){}
        // at: function(){}
        // push: function(){}
        // pop: function(){}
        // unshift: function(){}
        // shift: function(){}
        // slice: function(){}
        // length: number
        // 
        // event stuff from Backbone.Event
        // on: function(event, callback, context)
        // off: function(event, callback, context)
        // trigger: function(event, arguments)
        // once: function(event, callback, context)
        // listenTo: function(other object, event, callback)
        // stopListening: function(other object, event, callback)
        // listenToOnce: function(other object, event, callback)
        // 
        // comparator: function(){}
    });
    ```

    New Collection instances are created with a simple array of objects:

    ```js
    var tasks = new TaskList([
        {title: "some task", isDone: true},
        {title: "some task 2", inProgress: false},
        {title: "some task 3"}
    ]);
    ```

- Using Collections / Models with Etsy

    ```js
    var EtsyListing = Backbone.Model.extend({});

    var EtsyItems = Backbone.Collection.extend({
        model: EtsyListing,
        api_key: "aavnvygu0h5r52qes74x9zvo",
        url: function(){
            return [
                'https://openapi.etsy.com/v2/listings/active.js?',
                "api_key=",
                this.api_key,
                "&callback=?"
            ].join('')
        },
        parse: function(data){
            return data.results;
        }
    });

    var items = new EtsyItems();
    items.fetch().then(function(collection){
        // AJAX function has finished!
    })
    ```



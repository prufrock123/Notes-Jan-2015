# Week 4

# Objectives

1. [Regular Expressions (or RegEx for short)](#regular-expressions-or-regex-for-short))
- [DOM Events, `addEventListener()`, and `$.on()`](#DOM Events, `addEventListener()`, and `$.on()`)
- [Implicit Type coercion](#Implicit Type coercion)
- [Automatic Semicolon Insertion](#Automatic Semicolon Insertion)
- [debugger with Chrome](#debugger with Chrome)
- [errors, try/catch/finally, throw](#errors, try/catch/finally, throw)
- [Inheritance / OOP](#Inheritance / OOP)
- [Underscore / lodash](#Underscore / lodash)
- [RESTful APIs](#restful-apis)
- [Routing](#routing)
- [Script Loaders](#script-loaders)
- [Polyfills](#polyfills)
- [Caching](#caching)
- [More on Inheritance](#more-on-inheritance)
- [BDD](#bdd)
- [Node.js and Heroku](#nodejs-and-heroku)
- [Happy API Days!](#happy-api-days)

---

# Discussion Topics and Homework

### (1.) Monday

- reviewed: http://maprules1000.github.io/TIY-Jan-15-Class-Git-Pages/
- exercise from today: https://github.com/TIY-Houston-Front-End-Engineering/Routing-1-Vanilla-and-Backbone
- gh-pages version: http://tiy-houston-front-end-engineering.github.io/Routing-1-Vanilla-and-Backbone/

**Homework**

1. Complete and polish up your homework assignments (as much as you can, check with me if you have questions). You'll receive an email with a Status Report from me by 1pm.
2. When you finish fixing your work, review: [map and filter](https://github.com/cjros/js-assignments/blob/master/three-part.js)
3. Finally, create your own repo, and replicate http://maprules1000.github.io/TIY-Jan-15-Class-Git-Pages/ with Routing (Backbone). 

    > Remember that the [exercise from today](https://github.com/TIY-Houston-Front-End-Engineering/Routing-1-Vanilla-and-Backbone) has an example Backbone Router.

### (2.) Tuesday

**Homework**

1. TBD

### (2.) Wednesday

**Homework**

1. TBD

### (2.) Thursday

**Homework**

- TBD

---

# Implicit Type coercion

http://bonsaiden.github.io/JavaScript-Garden/#types

- `instanceof` / `typeof`
- How does this tie-in to prototypes?

---

# Error handling 

> ...is important for robust code.

<!-- errors, try/catch/finally, throw -->

```
console.log( undefined() ); // ERROR: undefined is not a function

var x = undefined;
console.log( x() ); // ERROR: undefined is not a function

// code doesn't break here
try {
    x();
} catch(e) {
    console.log(e.message); // ERROR: undefined is not a function
}

// code doesn't break here
try {
    x();
} catch(e) {
    console.log(e.message); // ERROR: undefined is not a function
} finally {
    // do something that should always 
    // be run after x(), even if there 
    // was an error
}
```

---

# Inheritance / OOP

> http://bonsaiden.github.io/JavaScript-Garden/#object.prototype

```js
    base = new Base();
    Derived.prototype = base; // Must be before new Derived()
    Derived.prototype.constructor = Derived; // Required to make `instanceof` work
```

```js
    function Character(name){
        this.name = name;
    }

    Character.prototype.fight = function(){
        console.log(this.name, this.power);
    }

    function Wizard(name){
        Character.apply(this, arguments);
        this.power = 10;
    }

    Wizard.prototype = new Character();
    Wizard.prototype.constructor = Wizard;
```

---

# RESTful APIs

** A database is, in simplest terms, spreadsheet. **

It has columns (a property name) and rows (the records).

For the Github API, there are various **resources**: `users`, `repos`, `teams`, `notifications`, `feeds`, `emojis`, and so forth. These are spreadsheet **tables**.

A resource, like a `person`, is identifiable by a unique attribute such as an `id` or `username`.

When we interact with databases through a RESTful API, we are given a couple options to interact with resources:

1. `GET` the information record of a particular resource
2. `GET` a collection of records for a group of resources
3. `POST` a new JSON object to the server to create a new record of a resource (i.e. a new `person`)
4. `PUT` an updated version of a record on the server, such as update a `person`'s name
5. `DELETE` a record from a resource collection (such as remove a `person` from the database)

These actions (`GET`, `PUT`, `POST`, `DELETE`) are called HTTP verbs, and are accompanied by equivalent jQuery methods `$.get()`, `$.post()`, and `$.ajax()`.

Simply put, RESTful API's exist because it means there is a standardized way for front-end and back-end (browser and server-side code) to talk to each other.

**JSONP**

Compare these two URLs and what they return (open them in your browser):

1. https://openapi.etsy.com/v2/listings/183182778?api_key=aavnvygu0h5r52qes74x9zvo
2. https://openapi.etsy.com/v2/listings/183182778.js?api_key=aavnvygu0h5r52qes74x9zvo&callback=test

The first one just returns JSON data, the second one returns a js file with a function `test` being called with a large JS object as the argument.

To use JSONP, we need to change the URL to include two things:

1. The URL should point to a '.js' file
2. The URL passed in to `$.get()` should have `&callback=?` at the end.

**Example:**

```js
var api_key = "aavnvygu0h5r52qes74x9zvo";

var etsy_url = [
    "https://openapi.etsy.com/",
    "v2/",
    "listings/",
    "active.js", // <--- added '.js' to the end here, because Etsy provides JSONP this way
    "?",
    "api_key=",
    api_key,
    "&callback=?" // <--- told jQuery to handle the request as JSONP
].join('');

$.getJSON(etsy_url).then(function(data){
    console.log(data);
});
```

### Etsy's REST API and how to use it:

1. Create an app with Etsy here: https://www.etsy.com/developers/documentation/getting_started/register. This will give you an API key to use. Some services use API keys to provide authorization and to rate-limit people who make too many requests (i.e. spam thousands of requests per second).
2. Get your API key from here: https://www.etsy.com/developers/your-apps
3. API's are released with documentation (how to GET/PUT/POST/DELETE them). One resource on Etsy is called a `listing`, and we can learn how to `GET listings` from https://www.etsy.com/developers/documentation/reference/listing
4. Test the REST API resources with your own API key:
    - get all active listings: https://openapi.etsy.com/v2/listings/active?api_key=aavnvygu0h5r52qes74x9zvo
    - look at an individual product on the API: https://openapi.etsy.com/v2/listings/114711047?api_key=aavnvygu0h5r52qes74x9zvo
    - that product has a `user_id` that we can use to find the user's details on the Etsy API: https://openapi.etsy.com/v2/users/19181170?api_key=aavnvygu0h5r52qes74x9zvo
5. Write some code
    ```js
    var api_key = "aavnvygu0h5r52qes74x9zvo";

    var etsy_url = [
        "https://openapi.etsy.com/",
        "v2/",
        "listings/",
        "active.js",
        "?",
        "api_key=",
        api_key,
        "&callback=?"
    ].join();

    $.getJSON(etsy_url).then(function(data){
        console.log(data);
    });
    ```

---

# Routing

> Check out this StackOverflow link on Hipchat: http://stackoverflow.com/questions/10075507/what-does-javascript-routing-buy-you

When you go to Gmail and load:
- The _chats_ tab, the URL changes to `https://mail.google.com/mail/u/0/#chats`.
- The inbox is `https://mail.google.com/mail/u/0/#inbox`.
- The spam folder is `https://mail.google.com/mail/u/0/#spam`.

Whenever you click a link that has a URL like:
```html
<a href="#target"></a>
```

The browser interprets a tap/click on this link as "scroll the element with the target id into view". 

If that target id doesn't exist, the browser will scroll to the top of the screen.

The URL will now have `#target` at the end.

JS has an event for these hash changes:

```js
window.addEventListener('hashchange', callbackFunction);
```

Example `Backbone.Router` for the Etsy site:

```js
EtsyClient.prototype.setupRouting = function(){
    var self = this;

    Path.map("#/").to(function() {
        self.showListings();
    });

    Path.map("#/listing/:id").to(function() {
        console.log(this);
        self.showListing(this.params.id);
    });

    // set the default hash
    Path.root("#/");
    Path.listen();
}
```

---

# Polyfills

- Finding polyfills is so easy: https://github.com/Modernizr/Modernizr/wiki/HTML5-Cross-Browser-Polyfills
- Finding if your browser supports something is so easy: http://caniuse.com/

---

# Caching

**Caching network requests with `$.get()`**

Caching is a term used in networking and computing when a a result can be reused.

For instance, if I compute the sum of ten numbers from by passing those ten numbers to `sumAll()`, I could save that result somewhere and return the same result if the same arguments are ever given again later:

Well, we can **cache** any data requested with `$.get()` as well:

```js
EtsyClient.prototype.loadTemplate = function(name){
    if(!this.templates){
        this.templates = {};
    }

    var self = this;

    if(this.templates[name]){
        var promise = $.Deferred();
        promise.resolve(this.templates[name]);
        return promise;
    } else {
        return $.get('./templates/'+name+'.html').then(function(data){
            self.templates[name] = data; // <-- cache it for any subsequent requests to this template
            return data;
        });
    }
}
```

Using `EtsyClient.prototype.loadTemplate()` in this fashion will make a brand new request the first time, and then send back a cached result every call thereafter.

---

# lodash

Lodash (https://lodash.com/, `bower install lodash`) is a library that gives us all the methods that Arrays have (`map`, `filter`, `reduce`, etc).

It is used when browsers that have older versions of JS (like IE8 and less) don't have the Array methods built in.

---

# DOM Events, `addEventListener()`, and `$.on()`

- http://youmightnotneedjquery.com/#on
- http://vimeo.com/96425312 ("What is the event loop?")
- http://devdocs.io/dom_events/

---

# Regular Expressions (or RegEx for short)

In JS, there is a `RegExp` Object. RegEx is used to test for patterns in strings (i.e. the `type="email"` and `pattern="[a-zA-Z]+"` attributes on an HTML element uses RegEx to **test for matches**).

We will use RegEx most often through two primary approaches:

1. We know a string `x`, and would like to test for any occurrences of a RegExp `y`,
- or we know a RegExp `y` and would like to find the matches (if any) from a string `x`

**Example 1**

- The dot (.) matches any character. If you want to match the dot as a character, escape it like this: \.
- A question mark (?) means that the preceding character is optional. If you want to match an actual question mark, escape it: "\?"
- The star (*) matches 0 or more characters
- The plus (+) matches 1 or more characters
- The parens () group states together
- The square brackets [] define a character-group
- The ^ at the front of a character-group [] means "not"
- The "/g" at the end of the RegEx object means "global", so `.match()` returns an array of matches instead of just one
- The "\d" means "decimal", and "\D" means "not a decimal"
- {x} for an exact number of repetitions, {x,y} for varying number of repetitions (where x and y are numbers)
- Also, there is the special "\b" pattern which matches the boundaries at the ends of words (not a real symbol).

```javascript
var text = 'The eyes of Texas are upon you.';

// Will match both "elit" and "elat". The dot can match any character.
var regex = /./g;
console.log( text.match(regex) );

// Will match both "est" and "lest". The question mark makes "l" optional.
var regex2 = /l?est/g;
console.log( text.match(regex2) );

// Match only "cat" and "can", but not "car".
var text = 'cat car can';
console.log( text.match(/ca[tn]/g) );

// Match everything BUT cat and can (notice the ^ symbol)
console.log( text.match(/ca[^tn]/g) );

// Here is another example, which matches only the number
text = 'I would like 8 cups of coffee, please.';
console.log('How many cups: ' + text.match( /[0-9]/g ));

// A better, shorter way to write it, using the \d character class
console.log('How many cups: ' + text.match( /\d/g ));

// Matching everything BUT the number (will return an array of chars)
console.log( text.match(/\D/g) );

//////////--------------

text = 'Hello people of 1974. I come from the future. In 2015 we have laser guns, hover boards and live on the moon!';

// Find the years. \d+ will match one or more chars
var yearRegex = /\d+/g;
console.log('Years: ', text.match( yearRegex ) );

// Find all sentences. Our sentences begin with a capital letter and end in either a dot or an exclamation mark.
// The question mark makes the regex non-greedy. Try removing it.
var sentenceRegex = /[A-Z].+?(\.|!)/g;
console.log('Sentences: ', text.match(sentenceRegex) );

// Find all words that begin with h. We want to match both lower and upper case, so we include the i modifier.
// Notice the \b for word boundary. Try removing it.
var hWords = /\bh\w+/ig;
console.log('H Words: ', text.match(hWords) );


// Find all words between four and six characters
var findWords = /\b\w{4,6}\b/g;
console.log( 'Words between 4 and 6 chars: ', text.match(findWords) );


// Find words longer than 5 chars
console.log( 'Words 5 chars or longer: ', text.match(/\b\w{5,}\b/g) );


// Find words exactly 6 chars long
console.log( 'Words exactly 6 chars long: ', text.match(/\b\w{6}\b/g) );
```

**Example 2**

RegEx keeps track of the groups () it has matched, and automatically numbers them.

```js
// Find the words which consist only of the same letters
var text = 'Abc ddefg, hijk lllll mnopqr ssss. Tuv wxyyy z.';
var sameLetterRegex = /\b(\w)\1*\b/g;
console.log( text.match(sameLetterRegex) );
```

Aside from matching character patterns in strings, we can use RegEx to to substitute text out (think "find and replace" feature of text editors). We can do this with `String.replace()`.

```js
// Let's turn "John Smith" into "Smith, John"
// Each group (\w+) matches a single word. Each group is assigned
// an index, starting from $1
var name = 'John Smith';
var nameRegex = /(\w+) (\w+)/;
console.log( name.replace(nameRegex, '$2, $1') );


// For more advanced manipulations, we need to provide a JS callback.
// For example, lets make the surname uppercase
var upcasename = name.replace(nameRegex, function(string, group1, group2){
    return group2.toUpperCase() + ', ' + group1;
});

console.log( upcasename );
```


---

# BDD

> **Disclaimer**: Behavior Driven Development and Test Driven Development are typically included under the same moniker, and really don't differ too much. We will specifically focus on BDD. But seriously, they are almost exactly the same thing save a function or two's names.

BDD is a weird, backwards way of programming. It is slower to do this, but writing tests for your code **before** writing the complete implementation of your code makes you think about the Single Responsibility Principle and how your Constructors/Prototypes should be structured.

In other words, Behavior Driven Development **uses** forces you to invoke your functions first, and then declare them later.

Weird, huh? So how do we use our code before it's written? Won't that throw errors?

**Yes!** That is exactly the point of this next section:

##### BDD is implemented using a process typically termed "Red, Green, Refactor":

1. You write a single test, make the test fail (i.e. a Constructor `Cat()` doesn't exist yet),
2. Then you make that test pass (i.e. create a Constructor `Cat()`),
3. Finally you repeat this process until your app is complete.

##### Why is this awesome on big projects?

Whenever someone uses your code, makes edits to it, or you simply haven't touched the code for a while and there's a new version of jQuery out (or whatever other dependencies you are using), your code may no longer work.

Wouldn't it be nice if some tests could tell you with certainty that your code will work?

Hint: that is what TDD will do :-)

However, that means writing tests isn't good enough, you have to write **testable JavaScript**.

## Installing a testing framework

Mocha and Chai are two separate projects that are used in tandem to provide a testing framework. I have taken the liberty of adding these to our setup-projects.sh file at https://github.com/TIY-Houston-Front-End-Sept-2014/Notes/blob/master/examples/extras/setup-project.sh.

These are just driven by JavaScript, and thus can be run by Node (i.e. by Gulp) or in the browser (which is the method we will take).

I have already updated our `setup-projects.sh` file to create a `test` folder with a `main.js` file inside, and a `test.html` file in the project's root directory.

If you are needing some documentation for Mocha and Chai:

- Mocha - (http://mochajs.github.io/mocha/) - Mocha provides a test runner (e.g. `describe` and `it`).
- Chai - (http://chaijs.com/) - Chai provides the expectations (e.g. `to.be.true`).

## Writing Testable JavaScript

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

There's a lot of fantastic resources out there to whet your whistle, but these particular resources below are a great start to learning how some of the most prolific JS coders / conf speakers write testable JavaScript:

- [Video](https://www.youtube.com/watch?v=OzjogCFO4Zo)
- [Slides](https://speakerdeck.com/rmurphey/writing-testable-javascript)
- [Article](http://alistapart.com/article/writing-testable-javascript)

## Other resources

The homework is being adapted from the "Array Methods" koan available on Github. A koan is a problem or context in which one meditates on (a term lovingly borrowed from Zen and Buddhism). In the programming world, there is a set of practice koans that have been translated into JavaScript (from other languages, I think these were from Ruby), where we can write tests for the built-in Array methods.

- JavaScript Koans - (https://github.com/mrdavidlaing/javascript-koans)

I have further modified the "Array Methods" koan to be used with Mocha and Chai (it was originally written to be used with another TDD framework called Jasmine).

> NOTE: also cover the combination of throwing errors, writing tests, and SOLID principles; how the strength of this combination creates really defensive and resilient code

# Node.js and Heroku

###  Getting started with Proxying

In the `server.js` file, there is a spot that says `add your proxies here`, with some examples, including proxying BreweryDB. Follow those as examples, and if you have any questions I will add/update them here for documentation. :-)

### Pushing to Heroku

Heroku is setup via the heroku toolbelt we installed. It essentially is a command-line program, nothing more, nothing less.

If you look at your git remotes (i.e. Github), you will see where your endpoints are:

```sh
mattbook-air:BreweryDBAPI matthiasak$ git remote -v
origin  git@github.com:TIY-Houston-Front-End-Sept-2014/TIY_HW24.git (fetch)
origin  git@github.com:TIY-Houston-Front-End-Sept-2014/TIY_HW24.git (push)
```

That `origin` above is why we do `git push origin master` or `git push origin gh-pages`. It means we are pushing to Github, and to the master or gh-pages branch.

Now run (where appName is some name for the app):
```sh
heroku create <appName>
```

If you don't provide an appName, then Heroku will choose one for you.

Now check your git remotes:
```sh
mattbook-air:BreweryDBAPI matthiasak$ git remote -v
heroku  git@heroku.com:tiy24yo.git (fetch)
heroku  git@heroku.com:tiy24yo.git (push)
origin  git@github.com:TIY-Houston-Front-End-Sept-2014/TIY_HW24.git (fetch)
origin  git@github.com:TIY-Houston-Front-End-Sept-2014/TIY_HW24.git (push)
```

Now, you just need to do this to get a working server on Heroku:
```sh
git add --all .
git commit -am "some message -- pushing to heroku?"
git push heroku master
```

**Now anytime you want to update Heroku, you will run the previous code. `git push --all` will NOT work.**

### Want to easily open your shiny new app on Heroku's website?

```sh
heroku open
```

# Happy API days!

We are going to do a project on working with 2 or more real APIs. If you recall, APIs provide 3 primary methods for us front-end devs to access them:

1. CORS - JSON (not all are CORS)
2. non-CORS - JSONP (not all are JSONP)
3. server-side proxy (our local server makes the JSON request for us, and returns it to the browser)

Method 3 is a little harder for us to implement, but we'll get there soon. :-)

Now, we've been doing `$.get()` enough to get information from Etsy, for example, but we haven't used `$.post()` to push any information up to a live service.

By **authenticating** with a service, we can actually push information up to services. One particular library that can help us do that is `hello.js` (http://adodson.com/hello.js/#install).

Aside from what `hello.js` provides access to, the following list is a large list of APIs that provide a mix of CORS/JSONP/proxy-able services:

## API Search Engine:

- http://apis.io/

## Social APIs

- meetup - http://www.meetup.com/meetup_api/
- klout - https://klout.com/s/developers/v2
- twitter - https://dev.twitter.com/
    - twitter "intents" (put interactive widgets on your page and have someone tweet/reply to you via twitter) - https://dev.twitter.com/docs/intents
    - twitter for websites (follow button, embed tweets on a page) - https://dev.twitter.com/docs/tfw
    - REST API (uses OAuth) - https://dev.twitter.com/docs/api/1.1
- facebook - https://developers.facebook.com/
- linkedin - https://developer.linkedin.com/apis
- foursquare - https://developer.foursquare.com/
- yelp - http://www.yelp.com/developers/documentation/v2/search_api
- github - https://developer.github.com/v3/

## Food-related APIs

- Yummly - https://developer.yummly.com/

## Government and Civil APIs

- Capitol Words - http://capitolwords.org/term/code/?search=1
- CDC - https://data.cdc.gov/ and http://wonder.cdc.gov/
- Federal Data.gov project - https://www.data.gov/developers/apis
- Sunlight Foundation - http://sunlightfoundation.com/api/

## Weather APIs

- Forecast.io - https://developer.forecast.io/

## Google APIs

> Using the Google SDK (a .js file) may be necessary and the easiest way to get started with Google APIs

    - https://developers.google.com/api-client-library/javascript/start/start-js
    - https://developers.google.com/apis-explorer/#p/

- maps, directions, geocoder, places, etc - https://developers.google.com/maps/documentation/javascript/
- feed - https://developers.google.com/feed/v1/devguide
- plus - https://developers.google.com/+/web/
- static maps - just a url for an image, e.g.:

    > http://maps.googleapis.com/maps/api/staticmap?center=Brooklyn+Bridge,New+York,NY&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Clabel:C%7C40.718217,-73.998284

- streetview api - again just a url, e.g.: http://maps.googleapis.com/maps/api/streetview?size=400x400&location=40.720032,-73.988354&fov=90&heading=235&pitch=10
- tasks - https://developers.google.com/google-apps/tasks/v1/reference/tasks/update
- Google custom search engine - https://developers.google.com/custom-search/json-api/v1/overview

## Music and Video APIs

- Spotify - https://developer.spotify.com/
- Soundcloud - https://developers.soundcloud.com/
- Deezer - http://developers.deezer.com/
- Grooveshark - http://developers.grooveshark.com/
- Rdio - http://www.rdio.com/developers/
- YouTube - https://developers.google.com/youtube/v3/getting-started
- Vimeo - https://developer.vimeo.com/
- BandsInTown - http://www.bandsintown.com/api/overview
- Dolby Audio - http://developer.dolby.com/

## Image APIs

- Flickr - https://www.flickr.com/services/api/
- PlaceKitten - http://placekitten.com/
- PlaceBacn - http://placebacn.com/
- LoremPixel - http://lorempixel.com/

## File and Data Storage APIs

- Dropbox - https://www.dropbox.com/developers/datastore

    - also, embeddable JS widgets on your page -> https://www.dropbox.com/developers/dropins

- AWS - http://aws.amazon.com/sdk-for-browser/
- Firebase - https://www.firebase.com/how-it-works.html
  - User Auth with Firebase - http://jsfiddle.net/firebase/a221m6pb/
- Parse - https://parse.com/docs/js_guide#javascript_guide - https://parse.com/downloads/javascript/parse-1.2.19.js
- Meteor (has a deploy tool just like heroku, comes with front end and back end code) - http://docs.meteor.com/#top

## Payments, Credit Card Processing, and Shopping Carts

- Stripe - https://stripe.com/docs/api - https://stripe.com/docs/stripe.js
- Braintree - https://developers.braintreepayments.com/javascript+node/start/overview
- Paypal - https://developer.paypal.com/docs/api/
- Snipcart - https://snipcart.com/
- Gumroad - "Buy button right on your site" - https://gumroad.com/overlay
    - also, embed a product widget right on site - https://gumroad.com/embed
    - https://gumroad.com/api
- Helium - https://gethelium.com/

## Retail

- BestBuy - https://developer.bestbuy.com/

## Other / HackerNews / Startup-y APIs

- Producthunt - https://github.com/karan/Hook
- Trello - https://trello.com/docs/
- HackerNews - http://api.ihackernews.com/
- https://github.com/HackerNews/API
- Track Ships / Vessels - http://www.fleetmon.com/faq/public_api
- Wikipedia - http://www.mediawiki.org/wiki/API:Main_page
- Untappd - https://untappd.com/api/docs
- BreweryDB - http://www.brewerydb.com/developers
- 23andme - https://api.23andme.com/
- NYT - http://developer.nytimes.com/docs
- NPR - http://dev.npr.org/
- EasyPost - Shipping integration and postage ordering with FedEx/UPS/USPS/DHL - https://www.easypost.com/
- Wit - natural language processing - http://labs.wit.ai/demo/index.html
- Nest - https://developer.nest.com/documentation/control
- FlightAware - http://flightaware.com/commercial/flightxml/
- IMDB / OMDB - http://www.omdbapi.com/
- Hipchat API - https://www.hipchat.com/docs/apiv2
- Zapier - https://zapier.com/developer/documentation/getting-started/
- Evernote - https://dev.evernote.com/doc/

## Dictionary / Words / Thesaurus APIs

- DictionaryAPI - http://dictionaryapi.com/ - example at http://whispering-island-7828.herokuapp.com/#magic

## GIFs

- https://github.com/giphy/GiphyAPI

## Real Estate APIs

- Trulia - http://developer.trulia.com/
- Zillow - http://www.zillow.com/howto/api/PropertyDetailsAPIOverview.htm
- http://www.getziptastic.com/

## Job APIs

- USA jobs - http://search.digitalgov.gov/developer/jobs.html
- current API you're using: http://www.authenticjobs.com/api/documentation/
- possible XML API: http://www.indeed.com/jsp/apiinfo.jsp
- JS-based API for LinkedIn Jobs: https://developer.linkedin.com/documents/getting-started-javascript-api
- Stack Overflow XML feed: http://careers.stackoverflow.com/jobs/feed?searchTerm=javascript&location=tx&range=160&distanceUnits=Miles

## Transportation APIs

- Uber - https://developer.uber.com/

## Real Devices

- The LEAP Motion - https://www.leapmotion.com/ - https://developer.leapmotion.com/documentation/skeletal/javascript/index.html
- Oculus - http://www.oculus.com/dk2/ - https://github.com/Instrument/oculus-bridge
- Tessel - https://tessel.io/ - https://tessel.io/docs
- Nest - https://nest.com/ - https://developer.nest.com/documentation/control - https://developer.nest.com/documentation/alert

## Browser APIs (from previous Notes)

This last section is all about Browser APIs available to us. We've encountered a few already, such as the `requestAnimationFrame()` function that syncs our drawing and DOM manipulation code to the computer's 60Hz refresh rate.

These are great to explore and build on-top of, because they are what create truly immersive applications.

- Device Orientation (http://simpl.info/deviceorientation/)
- `getUserMedia()` (http://simpl.info/getusermedia/)
- Geolocation (https://github.com/samdutton/simpl/blob/master/geolocation/js/main.js)
- Fullscreen API (http://simpl.info/fullscreen/)
- HTML5 Input types (http://simpl.info/inputtypes/)
- localStorage (http://simpl.info/localstorage/)
- Mutation Observer (http://simpl.info/mutationobserver/)
- Object.observe() (http://simpl.info/observe/)
- Notification API (http://aurelio.audero.it/demo/web-notifications-api-demo.html) and (http://caniuse.com/notifications)
- Page Visibility API (http://simpl.info/pagevisibility/)
- Web Workers (http://simpl.info/webworkers/)
- Web Speech API (https://simpl.info/stt/) and Web Speech SYnthesis API (http://simpl.info/tts/)
- GamePad API (http://caniuse.com/#feat=gamepad) and (http://www.html5rocks.com/en/tutorials/doodles/gamepad/)
- online/offline status (http://caniuse.com/online-status)
- requestAnimationFrame (http://caniuse.com/requestanimationframe)
- screen orientation API - lock the screen in a particular direction (http://aurelio.audero.it/demo/screen-orientation-api-demo.html) and (http://caniuse.com/screen-orientation)


## Interface Patterns and Resources to explore

> **NOTE**: Your first priority is to make usable, flexible sites, NOT just pretty websites. http://tympanus.net/codrops/2013/11/22/applying-app-design-concepts-to-website-design/

**Typography, Fonts, Icons, Codepens**

- http://beautifulopen.com/
- http://www.google.com/fonts
- http://www.idangero.us/framework7/
- http://www.squarespace.com/stories
- http://thenounproject.com/
- http://iconmelon.com/#/
- http://mattdsmith.com/float-label-pattern/
- http://codepen.io/bartekd/pen/qFsDf
- http://codepen.io/P233/pen/lGewF
- http://codepen.io/vpegado/pen/daugx
- https://goodui.org/ (reasoning behind WHY to do something in UI)
- http://www.typegenius.com/
- http://uigifs.com/
- https://niice.co/
- http://useyourinterface.com/
- http://dev.w3.org/html5/html-author/charref
- http://materializecss.com/


**Codrops**

- http://tympanus.net/Development/FullscreenForm/
- http://tympanus.net/Development/NotificationStyles/bar-slidetop.html
- http://tympanus.net/Development/SelectInspiration/index4.html
- http://tympanus.net/Development/TooltipStylesInspiration/round.html
- http://tympanus.net/Development/ArticleIntroEffects/index3.html
- http://tympanus.net/Development/ButtonComponentMorph/
- http://tympanus.net/Development/ButtonComponentMorph/index3.html
- http://tympanus.net/Development/ButtonComponentMorph/index5.html
- http://tympanus.net/Development/MinimalForm/
- http://tympanus.net/Development/3DGridEffect/index2.html
- http://tympanus.net/Development/FullscreenOverlayStyles/
- http://tympanus.net/Development/BookPreview/
- http://tympanus.net/Development/ResponsiveMultiLevelMenu/index3.html
- http://tympanus.net/Tutorials/PagePreloadingEffect/
- http://tympanus.net/Tutorials/CircularProgressButton/
- http://tympanus.net/Tutorials/AnimatedBorderMenus/index3.html
- http://tympanus.net/Tutorials/NaturalLanguageForm/
- http://tympanus.net/Tutorials/ExpandingOverlayEffect/
- http://tympanus.net/Blueprints/GridGallery/
- http://tympanus.net/Blueprints/FullWidthTabs/
- http://tympanus.net/Blueprints/SplitLayout/
- http://tympanus.net/Blueprints/OnScrollEffectLayout/
- http://tympanus.net/Blueprints/ResponsiveMultiColumnForm/
- http://tympanus.net/Blueprints/ProductGridLayout/
- http://tympanus.net/Blueprints/AnimatedHeader/
- http://tympanus.net/Blueprints/TooltipMenu/
- http://tympanus.net/Blueprints/VerticalTimeline/
- http://tympanus.net/Blueprints/HorizontalSlideOutMenu/
- http://tympanus.net/Blueprints/ScrollingLayout/
- http://tympanus.net/Blueprints/SlidePushMenus/
- http://tympanus.net/Blueprints/QuotesRotator/
- http://tympanus.net/Blueprints/VerticalIconMenu/
- http://tympanus.net/Development/WobblySlideshowEffect/
- http://tympanus.net/Development/MorphingSearch/
- http://tympanus.net/Development/DragDropInteractions/icons.html
- http://tympanus.net/Tutorials/SlidingHeaderLayout/index.html
- http://tympanus.net/Development/DialogEffects/don.html
- http://tympanus.net/Development/TextInputEffects/

**and other stuff:**

- http://codyhouse.co/demo/3d-animated-mockup/index.html
- http://hellohappy.org/beautiful-web-type/
- http://www.fontsquirrel.com/
- http://www.fontsquirrel.com/tools/webfont-generator
- http://thenounproject.com/
- http://thestocks.im/
- https://niice.co/search/geometric
- http://www.typegenius.com/
- http://uigifs.com/
- http://useyourinterface.com/
- http://evil-icons.io/
- http://photoswipe.com/
- http://www.gradient-animator.com/
- http://www.materialpalette.com/light-blue/lime
- http://goodui.org/
- http://colourco.de/
# Week 8

# Objectives

1. React in 7 Minutes
2. Grokking React Components
3. JSnoX (https://github.com/af/JSnoX)
4. React, Mithril, and other "Virtual DOM" frameworks
5. History of React
6. Intro to the Virtual DOM
7. Creating and Rendering Components
8. React Components maintain their own state, just like Backbone Views
9. Event Handling and Synthetic Events
10. Nesting Components in React
11. JSX
12. Flux and Reflux
13. Resources
14. Closing thoughts


---

# Discussion Topics and Homework

- Monday
    + Parse Authentication and Users, logging in, etc.
    + **Homework**
        * Finish [Friday's homework (Week 7)](./week7.md)
        * Add Parse Authentication and Login to your app (Notes also on [Week 7](./week7.md))
- Tuesday
    + Reviewed Parse Features
        * Objects / Collections
        * Queries
        * Files
        * Config
        * Users
        * Facebook Users
        * Access Control Lists
        * GeoPoints
        * Cloud Functions/Code/Modules (define, run, and import functions that run on Parse's servers)
        * Push Notifications
        * Security, class creation, configuration
    + Reviewed REST and Device APIs from [APIs.md](./APIs.md)
    + **Homework**
        * Finish Monday's Parse authentication and login to your todolist app
        * Watch "React in 7 Minutes" (https://egghead.io/lessons/react-react-in-7-minutes)
- Wednesday
    + Making Parse-todolist-auth-react (https://github.com/TIY-Houston-Front-End-Engineering/todolist-parse-react)
    + gh-pages: http://tiy-houston-front-end-engineering.github.io/todolist-parse-react/
- Thursday
    + Integrating with Rails/Node/etc REST APIs (class demonstration)
    + dual-instructor lecture
    + **Homework**
        * React Soundcloud: https://github.com/matthiasak/js-assignments/blob/master/react-soundcloud/README.md

---

- React in 7 Minutes

    https://egghead.io/lessons/react-react-in-7-minutes

- Grokking React Components

    ```js
    var Constructor = React.createClass({

        // properties are provided by the instance 
        // data passed to the constructor
        // 
        // these key-value pairs ensure that properties
        // are of the type defined here:
        propTypes: {
            list: React.PropTypes.array,
            isReady: React.PropTypes.bool,
            finish: React.PropTypes.func,
            size: React.PropTypes.number,
            data: React.PropTypes.object,
            description: React.PropTypes.string
        },
        mixins : [], // other mixins/classes to include the in the `extend`

        getInitialState: function() {}, // called when a component is initialized (much like Backbone)
        getDefaultProps: function() {}, // called when creating properties on a component (much like Backbone.Model defaults)

        componentWillMount : function() {}, // called when a component is attached to the DOM
        componentWillReceiveProps: function() {}, // called when props are updated
        componentWillUnmount : function() {}, // called when a component is removed from the DOM

        componentDidMount : function() {}, // called after a component is attached to the DOM
        componentDidReceiveProps: function() {}, // called after props are updated
        componentDidUnmount : function() {}, // called after a component is removed from the DOM

        // custom methods added to this component...
        // given an underscore in the name to denote 'custom'
        _parseData : function() {}, 
        _onSelect : function() {},

        // called by React whenever the state changes
        render : function() {}

    })
    ```

- JSnoX (https://github.com/af/JSnoX)
    
    React is written in JavaScript, thus we declare components with JavaScript. This can feel very unnatural, thus Facebook created a terminal tool that converts a hybrid HTML/JS language called JSX into pure JS.

    > (See the JSX section at the bottom for more info on JSX.)

    Instead of using JSX (HTML written in our JS files), which breaks prettifier/formatting, JSHint, and a host of other tools, I prefer to write my code in pure JavaScript and skip the build-tool process.

    The pure JS API for rendering React components, however, is "chatty", so we're going to use a React plugin called "JSnoX" that simplifies React's API.

    ```js
    var LoginForm = React.createClass({
        render: function() {
            return d('form[method=POST]', { onSubmit: this._submitLogin},
            [
                d('h1.form-header', 'Login'),
                d('input:email[name=email]', {
                    placeholder: 'Email'
                }),
                d('input:password[name=pass]', {
                    placeholder: 'Password'
                }),
                d(SomeOtherNestedComponent, {
                    myProp: 'foo'
                }),
                d('button:submit', 'Login')
            ])
        }
    })
    ```

- React, Mithril, and other "Virtual DOM" frameworks

    Pressed by my own curiosity, I started a journey to understand what can be generalized and unified in the different implementations of a React-like library. The best way I know to understand something isn't just to learn how it works but which problems it's trying to solve and **why it's designed that way**.

    I'll start with a bare model and then I'll add feature after feature trying to explain the design decisions (just like Etsy, Promises, Routing, Backbone Views, Backbone Models/Collections, Backbone Router, ...), pointing when possible to the corresponding implementations in React, Mithril and Mercury.

    Backbone is an MVC framework focused on building really structured classes that pull information from the web and printing it to the DOM. When application size/scale/structure gets unruly, it can be difficult to manage the complexity of DOM writing and interaction.

    React and others take a very different approach to making apps render fast - there's this concept of a virtual DOM. Imagine the virtual DOM like a long English paper. If the data behind a React Component (similar to a Backbone View) changes, then React automatically creates a new string of HTML and puts it in the Virtual DOM (our big English paper). The virtual DOM engine knows how to find the smallest section of the HTML that changed, and write that to the live DOM.

    It's a really fast way to draw browser updates. Think of it like using a hammer with nails. You can hammer a hundred nails into a fence-board to keep it secure from strong winds, or you can find the weak point and put just one nail in. That's what the virtual DOM does :-) it finds where to update the smallest part of the DOM, optimizing how the browser renders.

- History of React

    > So, the history of React is that we had this awesome way of building front-end on PHP called XHP. We had been using it very successfully on the server for a while and when you moved to JS you were left with bare DOM manipulation which was terrible.
    >
    > The idea of React was to port the XHP way of writing interfaces to JS. The three main characteristics are:
    >
    > - syntax extension to write XML inside of JS
    > - components
    > - using JS to generate markup (and not a template language)
    >
    > The big question that needed to be answered was how do you deal with updates? On the server you just re-render the entire page so you don't have to deal with this. In React, the diff algorithm and lifecycle methods were invented.

    React contains this nice "middle-state" called the virtual DOM, which is the result of the PHP serverside XHP implementations :-)

    Why? There are three major reasons:

    - Performance - the virtual DOM can render updates REALLY fast
    - Flexibility - the React Components are really flexible, composable, and even work nested
    - Testability - React Components can be embedded easily in TDD/BDD suites :D

- Intro to the Virtual DOM

    Manual DOM manipulation is messy and keeping track of the previous DOM state is hard. A solution to this problem is to write your code as if you were recreating the entire DOM whenever state changes. Of course, if you actually recreated the entire DOM every time your application state changed, your app would be very slow and your input fields would lose focus.

    > https://github.com/Matt-Esch/virtual-dom

- Creating and Rendering Components

    ```js
    var Hello = React.createClass({displayName: 'HelloMessage',
        render: function() {
            return React.createElement("div", {}, "Hello ", this.props.name);
        }
    });

    var el = React.createElement(Hello, {name: "John"});

    React.render(el, document.body);
    ```
    
- React Components maintain their own state, just like Backbone Views

    ```js
    var Timer = React.createClass({
        // creates the state object when a component is first created
        getInitialState: function() { 
            return { s: 0 } // s starts at 0
        },
        
        // called when a component is attached to the DOM
        componentDidMount: function() {
            this.interval = setInterval(this._tick, 1000);
        },
        // called when a component is detached from the DOM
        componentWillUnmount: function() {
            clearInterval(this.interval);
        },

        // custom function, adds one second to the counter
        _tick: function() {
            // setState() changes the state and re-renders the component, 
            // works a bit like Backbone.Model's set()
            this.setState({
                s: this.state.s + 1
            });
        },

        // called whenever the state changes
        render: function() {
            return (
                React.createElement("p", {}, "Seconds Elapsed: ", this.state.s)
            );
        }
    });

    React.render(React.createElement(Timer, null), document.body);
    ```

    JSnoX version from class:

    ```
    // in Timer.js
    ;(function(exports){

        "use strict";

        var Timer = React.createClass({
            displayName: 'TIMER',
            // setup
            getInitialState: function() {
                return { time: new Date() }
            },

            componentDidMount: function(){
                this.setState({
                    interval: setInterval(this._tick, 16)
                })
            },

            componentWillUnmount: function(){
                // clearInterval(this.state.interval);
            },

            _tick: function(){
                this.setState({ time: new Date() })
            },

            // and rendering (using JSnoX, too)
            render: function() {
                var t = this.state.time;
                var s = [
                    t.getHours(),
                    t.getMinutes(),
                    t.getSeconds(),
                    t.getMilliseconds()
                ].join(":")
                return d("div", s)
            }
        })

        var Wrapper = React.createClass({
            _alert: function(e){
                console.log(e);
                alert(this.refs.yey.getDOMNode().innerText);
            },
            _handleForm: function(e){
                e.preventDefault();
                var email = this.refs.email.getDOMNode().value;
                console.log(email)
            },
            render: function(){
                return d("div", [
                    d("span@yey", "weeeeeeeeeee, milliseconds are awesome."),
                    d("input:submit", { onClick: this._alert }, "PUSH ME. NOW."),
                    d("div.grid.grid-2-400", [
                        d("span", {key: "COFFEE"}, "TIME: ~~~>"),
                        d(Timer)
                    ]),
                    d("form", {onSubmit: this._handleForm}, [
                        d("input:email@email"),
                        d("button:submit", "GO")
                    ])
                ])
            }
        })

        exports.Timer = Timer;
        exports.Wrapper = Wrapper;

    })(typeof module === "object" ? module.exports : window);

    // in app.js
    var wrapper = d(Wrapper, {});
    React.render(wrapper, document.body);
    ```

- Event Handling and Synthetic Events

    **Tip 1**

    Turn on touch event support with `React.initializeTouchEvents(true)`;

    **Tip 2**

    Handle events through the `render()`:

    > Using the Timer example above

    ```js
    render: function() {
        return (
            React.createElement("p", {onClick: this._tick}, "Seconds Elapsed: ", this.state.s)
        );
    }
    ```

- Nesting Components in React

    We're going to demo a ToDo list app as an intro to nesting components (like nesting Views in Backbone).

    ```js
    var TodoApp = React.createClass({
        // setup
        getInitialState: function() {
            return { items: [], text: '' }
        },

        // custom methods
        _onChange: function(e) {
            this.setState({ text: e.target.value })
        },
        _handleSubmit: function(e) {
            e.preventDefault()
            var nextItems = this.state.items.concat([this.state.text])
            this.setState({ items: nextItems, text: "" })
        },

        // and rendering (using JSnoX, too)
        render: function() {
            return d("div", null, [
                d("h3", null, "TODO"),
                d(TodoList, {items: this.state.items}),
                d("form", {onSubmit: this._handleSubmit}, [
                    d("input", {onChange: this._onChange, value: this.state.text}),
                    d("button", null, "Add #"+(this.state.items.length+1))
                ])
            ])
        }
    });

    var TodoList = React.createClass({
        displayName: 'TodoList',
        render: function() {
            return d("ul", null, this.props.items.map(function(t){
                return d("li", null, t);
            }));
        }
    });

    var el = React.createElement(TodoApp, null);
    React.render(el, document.body);
    ```

- JSX

    For more info on the JSX compiler, see:

    - http://facebook.github.io/react/downloads.html#npm
    - https://www.npmjs.org/package/gulp-cjsx

- Flux and Reflux

    - http://facebook.github.io/react/blog/2014/05/06/flux.html
    - https://github.com/spoike/refluxjs

- Resources

    <!-- - [This slidedeck about React (PDF)](./examples/day41/hackreactor.pdf) -->
    - The official React site - http://facebook.github.io/react/
    - React Docs - http://facebook.github.io/react/docs/getting-started.html
    - https://www.npmjs.org/package/gulp-cjsx
    - React + Google Material UI = http://material-ui.com/#/components/buttons
    - React Best Tips and Practices - http://aeflash.com/2015-02/react-tips-and-best-practices.html

- Closing thoughts

    React is amazingly useful for building UI views/components. It's fast, flexible, and let's us use the same JS code on the client (browser) or server (Node.js) to create an HTML string (Virtual DOM). In the browser, we can use that to just set `innerHTML`. On the server, we can just send down the HTML string and have the browser render this as a regular ol' HTML file.

    > UPDATE: React is now being used to power Canvas animations and build native apps. Google it!


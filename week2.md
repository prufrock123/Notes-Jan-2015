# Week 2

# Objectives

1. [Resources](#resources)
- [NPM](#npm)
- [SCSS](#scss)
- [Building our own CSS framework](#building-our-own-css-framework)
- [SMACSS](#smacss)
- [A Visual Description of Responsive Design](#a-visual-description-of-responsive-design)
- [SOLID](#solid)
- [JavaScript](#javascript)

---

# Discussion Topics and Homework

### (1.) Monday

**Homework**

1. Do this assignment: [Responsive Timeline](https://github.com/matthiasak/js-assignments/blob/ba308382c346a44a92bccebb790214d0b6dc840f/html-intro-4-timeline/README.md)

### (2.) Tuesday

**Homework**

1. Read http://bonsaiden.github.io/JavaScript-Garden/#types and blog 15 key points or facts
2. Do this assignment: [JS Intro HW - data types, variables, functions, simple math](https://github.com/matthiasak/js-assignments/blob/7710ff376dc0f4bf5c7fa2318317c59b54029f42/js-functions-datatypes-math-1/README.md)

### (3.) Wednesday

**Homework**

1. Do this assignment: [JS functions, loops, structures](https://github.com/matthiasak/js-assignments/blob/b40c26d300174e0d80b835ffc6f9eb591a6732ed/js-functions-practice/README.md)

### (4.) Thursday

**Review**

- https://gist.github.com/matthiasak/10ccc502ae702866f9f0

**Homework**

- http://www.staticshowdown.com/
- Do this assignment: [ROT13](https://github.com/matthiasak/js-assignments/blob/a9223d3b13b04a1fc942ef9d2f16b65dfa2de64b/rot13/README.md)

### (5.) Friday

**Homework**

- For the 3-day weekend, do as much of this assignment as you can. We will review on Tuesday. [looping, loopity, loops](https://github.com/matthiasak/js-assignments/blob/master/js-functions-functional-practice-1/exercises-1.js)

---

# Resources

- http://onepagelove.com/
- http://sass-lang.com/guide
- https://www.npmjs.org/
- https://github.com/jonathanpath/SASS-SMACSS
- http://bonsaiden.github.io/JavaScript-Garden/
- http://devdocs.io/
- Mozilla Developer Network: https://developer.mozilla.org/en-US/
- http://blog.keithcirkel.co.uk/how-to-use-npm-as-a-build-tool/
- https://developer.mozilla.org/en-US/docs/Web/Reference/API
- https://developer.mozilla.org/en-US/docs/Web/JavaScript
- https://leanpub.com/understandinges6/read/
- http://blog.andyet.com/2014/08/13/opinionated-rundown-of-js-frameworks
- https://github.com/PROSPricing/js-assessment/tree/master/app
- https://github.com/enaqx/awesome-react
- http://backbonejs.org
- https://github.com/instanceofpro/awesome-backbone
- https://github.com/h5bp/Front-end-Developer-Interview-Questions/blob/master/README.md
- http://youmightnotneedjquery.com/

---

# NPM

"Node Package Manager" is the metadata and tool for storing information about a project, automating some scripts, and recording information such as dependencies and tools that should be installed alongside the codebase.

We will walk through [this package.json file](./extras/package.json) to further discuss.

---

# SCSS

## An Introduction to SCSS (Sassy CSS)

LESS, Sass and Compass compile a language into CSS (which can be read by a browser). These are called CSS Preprocessors. The (arguably) most popular of these preprocessors is SCSS, which is a derivative of the original Sass language, but has taken over the official Sass nomenclature. In otherwords, Sass and SCSS are nearly synonymous now.

## SCSS syntax

- variables

    ```scss
    $font-stack:    Helvetica, sans-serif;
    $primary-color: #333;

    body {
        font: 100% $font-stack;
        color: $primary-color;
    }
    ```

- nesting

    ```scss
    nav {
        ul {
            margin: 0;
            padding: 0;
            list-style: none;
        }

          li { display: inline-block; }

        a {
            display: block;
            padding: 6px 12px;
            text-decoration: none;
        }
    }
    ```

- partials and import

    You can create partial Sass files that contain little snippets of CSS that you can include in other Sass files. This is a great way to modularize your CSS and help keep things easier to maintain. A partial is simply a Sass file named with a leading underscore. You might name it something like `_partial.scss`. The underscore lets Sass know that the file is only a partial file and that it should not be generated into a CSS file. Sass partials are used with the `@import` directive.

    ```scss
    // _reset.scss

    html,
    body,
    ul,
    ol {
        margin: 0;
        padding: 0;
    }
    ```

    ```scss
    /* base.scss */

    @import 'reset';

    body {
        font: 100% Helvetica, sans-serif;
        background-color: #efefef;
    }
    ```

- mixins and extensions

    Mixins exist to avoid repeating a lot of stuff.

    ```scss
    @mixin border-radius($radius) {
      -webkit-border-radius: $radius;
         -moz-border-radius: $radius;
          -ms-border-radius: $radius;
              border-radius: $radius;
    }

    .box { @include border-radius(10px); }
    ```

    Extensions exist to create subclasses of classes, etc.

    ```scss
    .message {
        border: 1px solid #ccc;
        padding: 10px;
        color: #333;
    }

    .success {
        @extend .message;
        border-color: green;
    }

    .error {
        @extend .message;
        border-color: red;
    }

    .warning {
        @extend .message;
        border-color: yellow;
    }
    ```

- operators

    tldr; `+`, `-`, `*`, `/`, `%`

    ```scss
    .container { width: 100%; }

    article[role="main"] {
        float: left;
        width: 600px / 960px * 100%;
    }

    aside[role="complimentary"] {
        float: right;
        width: 300px / 960px * 100%;
    }
    ```

---

# Building our own CSS framework

- Typography
- Icons
- Grid
- mobile-first
- off-screen nav
- modals
- menu-bars
- ...

---

# SMACSS

SMACSS (pronounced “smacks”) is more style guide than rigid framework. There is no library to download or install. SMACSS is a way to examine your design process and is a way to fit those rigid frameworks into a flexible thought process.

### Categorizing

At the very core of SMACSS is categorization. By categorizing CSS rules, we begin to see patterns and can define better practices around each of these patterns.

There are five types of categories:

1. Base
- Layout
- Module
- State
- Theme

Each category has certain guidelines that apply to it. This somewhat succinct separation allows us to ask ourselves questions during the development process. How are we going to code things and why are we going to code them that way?

### Base rules

Base rules are the defaults. They are almost exclusively single element selectors but it could include attribute selectors, pseudo-class selectors, child selectors or sibling selectors. Essentially, a base style says that wherever this element is on the page, it should look like this.

```css
html, body, form { margin: 0; padding: 0; }
input[type=text] { border: 1px solid #999; }
a { color: #039; }
a:hover { color: #03C; }
```

### Layout rules

Layout rules divide the page into sections. Layouts hold one or more modules together.

```css
#header, #article, #footer {
    width: 960px;
    margin: auto;
}

#article {
    border: solid #CCC;
    border-width: 1px 0 0;
}
```

### Modules

Modules are the reusable, modular parts of our design. They are the callouts, the sidebar sections, the product lists and so on.

```css
.module > h2 {
    padding: 5px;
}

.module span {
    padding: 5px;
}
```

### State rules

State rules are ways to describe how our modules or layouts will look when in a particular state. Is it hidden or expanded? Is it active or inactive? They are about describing how a module or layout looks on screens that are smaller or bigger. They are also about describing how a module might look in different views like the home page or the inside page.

There is plenty of similarity between a sub-module style and a state style. They both modify the existing look of an element. However, they differ in two key ways:

1. State styles can apply to layout and/or module styles; and
- State styles indicate a JavaScript dependency.

It is this second point that is the most important distinction. Sub-module styles are applied to an element at render time and then are never changed again. State styles, however, are applied to elements to indicate a change in state while the page is still running on the client machine.

### Theme rules

Finally, Theme rules are similar to state rules in that they describe how modules or layouts might look, but in a particular theme (night mode?).

It is probably self-evident but a theme defines colours and images that give your application or site its look and feel. Separating the theme out into its own set of styles allows for those styles to be easily redefined for alternate themes.

```css
// in module-name.css
.mod {
    border: 1px solid;
}

// in theme.css
.mod {
    border-color: blue;
}
```

### Naming Rules

By separating rules into the five categories, naming convention is beneficial for immediately understanding which category a particular style belongs to and its role within the overall scope of the page. On large projects, it is more likely to have styles broken up across multiple files. In these cases, naming convention also makes it easier to find which file a style belongs to.

I like to use a prefix to differentiate between Layout, State, and Module rules. For Layout, I use `l-` but `layout-` would work just as well. Using prefixes like `grid-` also provide enough clarity to separate layout styles from other styles. For State rules, I like `is-` as in `is-hidden` or `is-collapsed`. This helps describe things in a very readable way.

```css
/* Example Module */
.example { }

/* Callout Module */
.callout { }

/* Callout Module with State */
.callout.is-collapsed { }

/* Form field module */
.field { }

/* Inline layout  */
.l-inline { }
```

### Rules of State Change

> See http://smacss.com/book/state

### Other tidbits

- keep specificity low

    For example, `body.article > #main > #content > #intro > p > b` would have a depth of applicability of 6 generations. If this selector was written as `.article #intro b` then the depth is still the same: 6 generations.

    The problem with such a depth is that it enforces a much greater dependency on a particular HTML structure.

    **Simplification of rules**

    ```css
    .pod {
        border: 1px solid #333;
    }

    .pod > h3 {
        margin-top: 5px;
    }

    .pod > ul {
        margin-bottom: 5px;
    }
    ```

- keep selectors simple

    Selectors can be fast or slow. To understand what makes a page render, we need to cover a few things first:

    - How CSS gets evaluated

        The style of an element is evaluated on element creation. Each node is evaluated and rendered to the viewport as it is received in order down the HTML.

        As the browser loads and renders an element, the browser scans the CSS, evaluating every CSS statement to find which ones match that element.

        For each CSS statement, the browser will read it from right-to-left and see if it matches the DOM element.

        If you have a rule like `body div#content p { color: #003366; }` then for every element — as it gets rendered to the page — it will:

        - first ask if it is a paragraph element.
        - If it is then it will work its way up the DOM and ask if it is a div with an ID of content.
        - If it finds what it is looking for, it will continue its way up the DOM until it reaches the body.

    - Some rules just suck

        Google Pagespeed (http://code.google.com/speed/page-speed/docs/rendering.html#UseEfficientCSSSelectors) recommends against using the following selectors:

        1. Rules with descendant selectors. E.g. `#content h3`
        - Rules with child or adjacent selectors. E.g. `#content > h3`
        - Rules with overly qualified selectors. E.g. `div#content > h3`
        - Rules that apply :hover to non-link elements. E.g. `div#content:hover`

    - Constrain yourself, don’t choke yourself

        I follow three simple guidelines to help limit the number of elements that need to be evaluated:

            1. Use child selectors
            - Avoid tag selectors for common elements
            - Use class names as the right-most selector

---

# A Visual Description of Responsive Design

- responsive vs. adaptive

![](./extras/rwd/1.gif)

- relative vs. static

![](./extras/rwd/2.gif)

- with/without breakpoints

![](./extras/rwd/3.gif)

- flow vs. static

![](./extras/rwd/4.gif)

- nested vs. not nested

![](./extras/rwd/5.gif)

- fonts

![](./extras/rwd/6.gif)

- max width

![](./extras/rwd/7.gif)

- desktop first vs. mobile first

![](./extras/rwd/8.gif)

- vectors vs images

![](./extras/rwd/9.gif)

---

# SOLID



---

# JavaScript

## Types

1. **Primitives** - simple values that can be passed around and referenced directly. They are kind of like cash. If you give someone a $5 bill, they have the money and they can use it immediately.

    - Numbers - `0`, `-1`, `49.123`, `0x000010`, `2e5`
    - Booleans - `true`, `false`
    - Strings -

        ```js
        'Cool';
        "Cool";
        "That was 'cool'";
        "That was \"cool\"";
        "how much wood could a woodchuck chuck if woodchuck could chuck wood?";
        ```

- **Objects** - more abstract "things". They are like checks. They're too complex to be passed around or referenced directly, you have to know how to use them to actually get the value out of them.

    - Literals

        ```js
        {
            name: "Matt",
            height: "6'2\"",
            Name: "Instructor"  //<-- case sensitive property names
        }
        ```
    - Arrays

        ```js
        var names = ["Matt", "Mark", "Mike", "Mitch", "Moe"];
        ```
    - Functions

        ```js
        function sum(a, b){
            return a+b;
        }
        ```
    - there will be many more...

## Variables

```js
    var x = 5;
```

Variables are like labeled boxes, where the box `x` has the number `5` inside it.

Variables can be named almost anything with alphanumeric characters (numbers, lower and uppercase letters), underscores, and dollar signs ($). The only condition is that the name cannot start with a number.

Variable names are case sensitive.

The convention, but not rule, is to capitalize each word after the first:

```js
    var someCoolVariable;
```

**Declare multiple variables:**

```js
var age, favoriteColor, name;
```

**Declare and assign multiple:**

```js
var age = 37,
    favoriteColor = "green",
    name = "Jake";
```

The following are all reserved words, meaning you cannot create a variable with any of these names:

`arguments`, `break`, `case`, `catch`, `class`, `const`, `continue`, `debugger`, `default`, `delete`, `do`, `else`, `enum`, `export`, `extends`, `false`, `finally`, `for`, `function`, `if`, `implements`, `import`, `in`, `instanceof`, `interface`, `let`, `new`, `null`, `package`, `private`, `protected`, `public`, `return`, `static`, `super`, `switch`, `this`, `throw`, `true`, `try`, `typeof`, `var`, `void`, `while`

> Kevin Henney points out that the “labeled boxes” analogy also works nicely for introducing “arrays (a row or column of boxes) and objects (a group of boxes).” Ikai Lan likes how “box size is a good analogy for type discussions later on.”
>
> https://twitter.com/KevlinHenney/status/372598874462253056
> https://twitter.com/ikai/status/372656503947149312

## Code Comments

In JavaScript, there are two types of comments (a.k.a. ways to put a note in the code)

```js
    // single line comment

    /*
        and a multi-line
        comment
        .
     */
```

## Operators

- assignment operator: `=`
- mathematical operators: `+`, `-`, `*`, `/`, `++`, `--`, `%`
- compound operators: `+=`, `-=`, `*=`, `/=`
- conditional operators: `!`, `==`, `===`, `!=`, `!==`, `>`, `>=`, `<`, `<=`
- binary combinators: `&&`, `||`
- grouping operators: `( ... )` e.g. `(5+9)*3`
- function operators: `()` e.g. `sum(5, 10)`
- string operator: `+`

For more, see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators

## Accessors

In JavaScript, we can access properties of an object with `.`:

```js
var instructor = {
    name: "Matt",
    height: "6'2\"",
    laptop: {
        type: "MacBook Air"
    }
};

instructor.name; //<-- "Matt"
instructor.laptop.type; //<-- "MacBook Air"
```

## Statements

Statements can consist of a combination of accessors and operators:

```js
instructor.name + " owns a " + 2013 + instructor.laptop.type; //<-- "Matt owns a 2013 MacBook Air"
```

Like a sentence, a statement is one coherent "thought" or instruction.
- It should appear on its own line.
- It should end with a semicolon (a semicolon means "this instruction is over, move to the next one.")

## Assignments

Assignments have a new or existing variable, an assignment operator `=`, and then a statement.

```js
var x = (2 + 45) + "a"; //<-- x is "47a"
x += (45 + 2); //<-- x is "47a47"
```

## Functions

Functions are the reusable, composable building-blocks of JavaScript. Functions are declared and used, sometimes in the same statement, sometimes in a seperate statement:

```
function sum(a, b){
    return a+b;
}
sum(1, 2); //<-- 3

// or


// the following is an anonymous function because it has no name
// when invoking anonymous functions this way, it is called an IIFE
// (Immeidately Invoked Function Expression)

(function (a, b){ 
    return a+b;
})
(1, 2); //<-- 3


```

`return` is a statement inside functions that "unboxes" a value where the function was invoked:

```
var a = sum(1,2) + 4;
// becomes
//  a = 3 + 4
// then
//  a = 7
a; //<-- 7
```

## Strict Mode

ECMAScript 5 has a strict mode that results in cleaner JavaScript, with fewer unsafe features, more warnings, and more logical behavior. The normal (nonstrict) mode is sometimes called "sloppy mode."

You can switch on strict mode by writing it inside functions like this:

```js
function foo() {
    'use strict';
    // ...
}
```

I am going to recommend that you `use strict` mode (see what I did there? :thumbsup:) for the code you write.

## Using JavaScript In Your Websites

### In `<head>`

```html
<head>
  <title>Cool</title>
  <script type="text/javascript">
    var cool = true;
  </script>
</head>
```

### External file (preferred)

At the end of the body:

```html
<body>
  <h1>Hay</h1>
  <script type="text/javascript" src="main.js"></script>
</body>
```

## Accessors (`.` vs `[]`)

```js
sum += person.finishingTime1;
sum += person["finishingTime1"];
sum += person["finishingTime"+1];
```

## Conditional statements and blocks

- `if`

    ```js
    if(){
        ...
    }
    ```

- `if`/`else`

    ```js
    if(){

    } else {

    }
    ```

- `if`/`else if`/`else`

    ```js
    if(){

    } else if(){

    } else if(){

    } else {

    }
    ```

- `switch`

    ```js
    var answer = "A";

    switch (answer.toLowerCase()) {
        case "A":
            console.log("Correct");
            break;
        default:
            console.log("Incorrect");
            break;
    }
    ```

- `ternary`

    ```js
    var result = true ? "yey for red" : "it's actually salmon"; //<-- "yey for red"
    ```

- `short-circuited statement`

    ```js
    var isMyShirtRed = false;
    var result = (!isMyShirtRed && "it's actually salmon") || "yey for red";
    ```

## Loops

- `for`

    ```js
    for(declare vars; conditional; modifier){
        .. do shit X amount of times
    }
    ```

- `for-in`

    ```js
    "use strict";

    var matt = {
        finishingTime1: 240, //in minutes
        finishingTime2: 210.4,
        finishingTime3: 235.1,
        finishingTime4: 208.9,
        finishingTime5: 197.5,
        unqualifyingFinishingTime: 250.5,
        unqualifyingFinishingTime2: 350.5
    };

    var getAverageTime = function(person) {
        "use strict";
        var sum = 0;
        for(var index in person){
            sum += person[index];
        }
        return sum / Object.keys(person).length;
    }

    console.log(getAverageTime(matt));
    ```

- `while`

    ```js
    var matt = {
        finishingTime1: 240, //in minutes
        finishingTime2: 210.4,
        finishingTime3: 235.1,
        finishingTime4: 208.9,
        finishingTime5: 197.5,
    };

    var getAverageTime = function(person) {
        "use strict";

        var sum = 0,
            i = 1,
            length = Object.keys(person).length;

        while(i <= length){
            sum += person["finishingTime"+i];
            i++;
        }

        return sum / length;
    }

    console.log(getAverageTime(matt));
    ```

- `do`/`while`

    ```js
    var matt = {
        finishingTime1: 240, //in minutes
        finishingTime2: 210.4,
        finishingTime3: 235.1,
        finishingTime4: 208.9,
        finishingTime5: 197.5,
    };

    var getAverageTime = function(person) {
        "use strict";

        var sum = 0,
            i = 1,
            length = Object.keys(person).length;

        do {
            sum += person["finishingTime"+i];
            i++;
        } while(i <= length)

        return sum / length;
    }

    console.log(getAverageTime(matt));
    ```

## Arrays

- creating arrays

    ```js
    var names = ['matt', 'mark', 'mike'];

    // or

    var names = new Array(3);
    name[0] = 'matt';
    name[1] = 'mark';
    name[2] = 'mike';
    ```

- array methods and properties

    - `length`
    - `indexOf` / `lastIndexOf`
    - `push` / `pop`
    - `unshift` / `shift`
    - `join`
    - `forEach`
    - `sort`
    - `reverse`
    - `slice`
    - `filter`
    - `map`
    - `reduce`
    - `concat`

    ```js
    var fruits = [{
        name: "apple",
        color: "red"
    }, {
        name: "strawberry",
        color: "red"
    }, {
        name: "tomato",
        color: "red"
    }, {
        name: "grape",
        color: "red"
    }]

    fruits = fruits.filter(function(fruit){
        return fruit.color === "red";
    }).map(function(fruit){
        return fruit.name;
    })

    console.log(fruits.join(", "));
    ```


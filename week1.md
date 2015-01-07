# Week 1

# Objectives

1. [Blogging and Branding](#blogging-and-branding)
- [Expectations, Policies, Schedules, Fun Stuff](../README.md)
- [This Journey](#this-journey)
- [Mac keyboard shortcuts]()
- [DND mode]()
- [Mac OS X Terminal Basics](#mac-os-x-terminal-basics)
- [Sublime Text shortcuts]()
- [Resources](#resources)
- [How a browser reads HTML](#how-a-browser-reads-html)
- [HTML](#html)
- [Chrome Dev Tools](#chrome-dev-tools)
- [CSS](#css)
- [The Box Model](#the-box-model)
- [Responsive Web Design](#responsive-web-design)
- [Box Sizing](#box-sizing)
- [The Inline Block Grid](#the-inline-block-grid)
- [Fonts, Google Fonts, Typography](#fonts)
- [Git](#git)
- [Bower](#bower)

---

# Discussion Topics and Homework

### (1.) Monday

**Homework**

1. Read http://learnlayout.com/, blog at least 15 things you learned, start exploring/coding these lessons in the "intro-html-1" file we started today. Zip that up and email it to matt@theironyard.com.
- Watch "The Long Game pt 1 and 2": http://delve.tv/essays/
- Blog about "The Long Game" and your first assignment ~~> start a blog on http://medium.com

### (2.) Tuesday

**Homework**

1. Do this assignment: [html-intro-1](https://github.com/matthiasak/js-assignments/blob/95838cbf5dd7c6645265784645040f2664f44969/html-intro-1/README.md)

### (2.) Wednesday

-  TBD

**Homework**

- TBD

### (2.) Thursday

-  TBD

**Homework**

- TBD

---

# Resources

**HTML Tags and Attributes, CSS Properties, Ipsums, GIFs, MDN**

- http://meettheipsums.com/
- Mozilla Developer Network: https://developer.mozilla.org/en-US/
- List of HTML tags: https://developer.mozilla.org/en-US/docs/Web/HTML/Element
- List of HTML attributes: https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes
- All the CSS properties! https://developer.mozilla.org/en-US/docs/Web/CSS/Reference
- You need GIFs, so get 'em here: http://giphy.com/

**Typography, Fonts, Icons, A-to-Z-css podcast**

- http://necolas.github.io/normalize.css/
- http://typeplate.com/
- http://kennethormandy.com/journal/normalize-opentype-css
- http://hellohappy.org/beautiful-web-type/
- http://www.atozcss.com/media-queries/ and the entire AtoZcss podcast lineup: http://www.atozcss.com/
- http://fortawesome.github.io/Font-Awesome/get-started/
- http://thenounproject.com/
- https://icomoon.io/
- http://iconmelon.com/

**CSS almanac, pseudo-classes/selectors, codepen patterns, currentColor**

- http://css-tricks.com/almanac/
- CSS pseudo-classes and selectors
- http://a.singlediv.com/
- http://codepen.io/patterns/
- `currentColor`
- `::before` / `::after`
- http://onepagelove.com/

---

# This Journey

http://blog.pickcrew.com/5-alternative-ways-to-manage-time/

- 30SS and taking notes,

    Immediately after every lecture, meeting, or any significant experience, take 30 seconds — no more, no less — to write down the most important points. All notes in detail will be given to you. If they aren't written by me, then they are available online. What is hardest is learning, using, becoming fluent with, and reflecting on this content.

- communication,

    If you are sick, running late, have to take care of a car, etc... ping me directly on hipchat. Failing to do so will only hurt your progress in this class.

    Also, **you need to ask questions.** If you aren't, you either aren't involved/paying attention or you aren't understanding enough to ask a question. :-) Asking questions is a muscle, and you need to exercise that muscle!

- automating, scheduling, and decision fatigue,

    We are hardwired to need breaks every 90-120 minutes. Schedule your energy, not your time. Block out parts of your day for exercise, for reading (fiction), for cooking, for family.

    Group similar activities; if you need to do emails, do them in batches. If you need to do an assignment, do it without looking around at websites, checking Facebook/Twitter, or reading emails.

    **There is no excuse to not work on high-priority items first.**

    To overcome decision fatigue and be more productive in general, Tim Ferriss recommends putting systems and processes in place that automate as much thinking as possible. The goal is to turn open-ended questions (What am I going to eat for breakfast?) into if/then statements (If it’s a weekday, I’m going to have a protein shake for breakfast).

    I’ve adopted Tim’s approach during the first three hours of my morning. As soon as I have a cup of coffee in hand, I’m working on some kind of code lesson for the day. Then, I write for an hour. Finally, I get in some sort of physical activity. This removes any and all wasted time from my morning.

- focus

    Devote all of your energy to one task at a time. Multi-tasking has a cost, especially when programming. TURN ON DND MODE.

    Don't check email until lunch. Rather than checking your email dozens of times throughout the day, dedicate two blocks of time (one at the beginning and one at the end of the day).

---

# Blogging and Branding

Sign up for an account on http://medium.com. You will be asked to regularly blog, reflecting on your voyage and trials here at The Iron Yard. You will also be asked to, on occasion, reflect on a reading, on an assignment, or on a video as a homework assignment itself.

Writing about code, about being a developer, about a tool, and so forth gives you leverage. You learn to put into words how you emotionally feel, you understand and reflect, you meditate. Those thoughts, ideas, and takeaways are in essence "pre-meditated" and prepared so that when you rub shoulders with and interview with employers, clients, and customers, you have something eloquent enough to deliver, and memorable enough to recall.

---

# How a browser reads HTML

**Browser Rendering Process**

1. loads HTML
2. finds tags from top to bottom, and tries to render them
3. CSS found! - loads it in parallel and continues
4. JS found! - loads and executes it while blocking everything else :-(

---

# HTML

**Syntax**

1. This is an HTML tag: `<div>`
2. Most tags exist in two's – they have an opening and closing tag: `<div></div>`
3. Tags can be nested.

    Bad:

    ```html
    <div><span></div></span>
    ```

    Good:

    ```html
    <div> <span></span> </div>
    ```

**Tags**

Common HTML tags:

- html
- head
- body
- div
- span
- p
- a
- pre
- blockquote
- hr
- h1, h2, h3, h4, h5, h6
- img
- ol, ul, li
- strong, em

Table HTML tags:

- table
- tr
- td

Form HTML tags:

- form
- input
- textarea
- button
- label
- fieldset
- select, option

HTML5 tags:

- aside
- article
- audio
- address
- header
- footer
- main
- nav
- section

**Attributes**

Tags can have attributes: `<tagname attributeName="..">`. Some attributes have defined _values_ while others do not.

Common attributes include:

- class, id (can be any value you provide)

    ```html
    <div class="header" id="top-of-page"></div>
    ```

- `<input>` type (can be: text, number, telephone, email, password, url, search, date, time, datetime, month, week, color, range)

    ```html
    <input type="text">
    ```

- `<input>` name, required, pattern

    ```html
    <input name="email" type="email" required>
    <input name="alphabeticalOnly" type="text" pattern="[a-zA-Z]+" required>
    ```

- `<input>` placeholder (can be any placeholder text on an input)

    ```html
    <input type="email" placeholder="Enter your email">
    ```

- `<img>` src (a URL to pull an image from)

    ```html
    <img src="...">
    ```

- `<form>` action (a URL to send the data -- default is to the same webpage address), method (can be: POST or GET -- default is GET)

    ```html
    <form id="login" method="POST">
        <input name="email" type="email" required>
        <input name="pass" type="password" required>
    </form>
    ```

- '<a>' href (can be any URL), target (can be )

    ```html
    <a href="...">
    ```

- other `<form>` and `<input>` attributes: autocomplete, autosave, autofocus

---

# CSS

The **first** and **most important** rule of CSS is that all elements have default styles, provided by a default stylesheet (comes from the browser). Any element can be customized with nearly any custom CSS.

As developers and designers, we have the opportunity to customize the default stylesheet provided by the browser, by providing our own CSS for the browser to load in addition.

The **second** rule of CSS in this class is that with HTML and CSS, for _any_ layout, less is more. Consider all the permutations of layouts and the CSS declarations, and this will help you to build mind map and a "practiced" routine for particular layout and design techniques.

**Syntax**

CSS is comprised of a series of CSS _statements_, each of which have 0 or more CSS _property/value_ pairs.

Here is a single CSS _statement_ with two _property/value_ pairs:

```css
<selector> {
    display: inline-block;
    border: 3px solid red;
    border-radius: 50%;
}
```

A CSS _statement_ applies the block of _properties_ to any element that matches any and all elements in the webpage that match the _statement target_ (like `img` above).

The _selector_ can be any combination of:

_identifiers_

1. a `tagname`
- a `.class`
- an `#id`
- a star `*` (which matches any `tagname`)
- `[name="value"]` - matches elements where name is exactly "value"
-  `[name~="value"]` - matches elements where name contains "value"
- `[name$="value"]` - matches elements where name starts with "value"
- `[name^="value"]` - matches elements where name ends with "value"

_pseudo-classes_

1. `:active`
- `:checked`
- `:default`
- `:empty`
- `:enabled`
- `:first`
- `:first-child`
- `:first-of-type`
- `:focus`
- `:fullscreen`
- `:hover`
- `:invalid`
- `:last-child`
- `:last-of-type`
- `:link`
- `:not()`
- `:nth-child()`
- `:nth-last-child()`
- `:nth-last-of-type()`
- `:nth-of-type()`
- `:only-child`
- `:only-of-type`
- `:optional`
- `:required`
- `:target`
- `:valid`
- `:visited`

_pseudo-objects_

1. `::after`
- `::before`
- `::first-letter`
- `::first-line`
- `::selection`

_combinators_

1. `A B` - descendant selector
- `A > B` - direct child
- `A ~ B` - general sibling
- `A + B` - adjacent sibling
- `A, B` - group selector

Putting it all together, here are some valid CSS statements:

```css
div {}
div.class {}
.class {}
div#id.class {}
#id.class {}

.grid > * {}
.grid > *:nth-child(2n+1) {}

table tr:nth-child(2n+1) {}

article p:first-of-type::first-letter {
    float: left;
    font-size: 2.5em;
}

article a:hover {}

.first + .second {}
```

**Specificity**

Every CSS _statement_ we declare in our own stylesheet overrides the default stylesheet because it is included in the webpage after the default, essentially overwriting any conflicting properties with the latest one.

But what happens if we have two _statements_ adding styles to `p` tags:

```css
html body p { color: green; }
body p { color: red; font-size: 3em; }
```

The paragraph font size will be `3em`, however text color will be green, because the color property has a more **specific** selector applying a value: `html body p`.

Numerically, there is a hidden point system in CSS that determines how this works. Here's the "points" awarded to a selector:

- 1 point per tagname
- 5 points per class
- 25 points per id
- `A B` (descendant) adds the points of A and B together
- `A > B` (direct child) adds A, B, and an extra amount of points
- and so forth...

Thus, generally you should be careful about how specific your _selectors_ are until you need them. We will cover this in greater detail throughout the course.

**Layout techniques**

(From http://learnlayout.com) Creating "columns"

1. `position: absolute`
- `float: left`
- `display: inline-block`

**Pseudo-elements**

There are two "free" elements that you can use with any HTML tag. These can be used to reduce the amount of code needed to produce some graphical effect, and can be added to many elements on multiple HTML pages with just a few lines of CSS.

By default, these pseudo-elements exist inside any element:

```css
div::before {

}

div::after {

}
```

They are simply hidden by default. We can "enable" these hidden elements by adding:

```css
div::before {
    content: "hi!"
}

div::after {
    content: "bye!"
}
```

This will make the `::before` and `::after` elements visible, which are now the very first and very last element in each div.

We can style pseudo-elements with any CSS attributes our hearts desire:

```css
div::before {
    content: "hi!"
    display: inline-block;
    float: left;
    padding: 1em;
    color: #ccc;
    font-size: 1.5em;
}
```

If deconstructing [codepens](http://codepen.io) hasn't taught you what you can do with pseudo-elements, perhaps we can look at a few examples.

**Custom attributes**

```html
<div name="Matt"></div>
```

```css
div::before {
    content: "Hello, my name is " attr(name);
    display: inline-block;
    float: left;
    padding: 1em;
    color: #ccc;
    font-size: 1.5em;
}
```

As in the above, we can access attributes on an element through the CSS with `attr()`.

**Counters**

CSS has counters as well. We can count the occurance of elements. The following code will add a counter to every `<h3>`, and write it out to a pseudo-element's `content`:

```css
body {
  counter-reset: section;
}
h3:before {
  counter-increment: section;
  content: "Section" counter(section) ": ";
}
```

We can even go crazy and count every single element on the page:

```css
body {
  counter-reset: element;
}
*:before {
  counter-increment: element;
  content: "Element" counter(section) ": ";
}
```

**Transitions and Pseudo-classes**

Pseudo-classes like `:hover` can be used to style an element when you hover over it with your mouse.

In a common scenario:

```css
a {
    color: green;
}
a:hover {
    color: red;
}
```

The above CSS will "flicker" between green and red. I want the transition to be smooth!

```css
a {
    color: green;
    transition: color .5s ease;
}
a:hover {
    color: red;
}
```

That's better. :-)

**Transforms**

One method of moving elements up, left, down, and right is to give said element a `position`:

- `relative`,
- `absolute`, or
- `fixed`

However, there is another method to moving elements around on the screen (and more, like rotating, skewing, scaling, etc). We do that with `transform`:

```css
div {
    transition: transform .5s ease;
}
div:hover {
    transform: translateX(10px) translateY(5px) rotate(45deg) skew(20deg) scale(.8);
}
```

We can use any combination of the following in the `transform` property:

1. `translate(X, Y)`
- `translateX(a)`
- `translateY(a)
- `translateZ(a)
- `rotate(Adeg)` same as `rotateZ(Adeg)`
- `rotateX(Adeg)`
- `rotateY(Adeg)`
- `skew(Adeg)`
- `scale(A)`

**Keyframes**

Keyframe animations let us control the intermediate steps of an animation (which is not possible in a transition). The following will demonstrate a method to define an animation in CSS and add it to a hover-state:

```css
@keyframes zoomInAndRotate {
    0% {
        transform: scale(1) rotate(0deg);
    }
    50% {
        transform: scale(1.5) rotate(5deg);
    }
    100% {
        transform: scale(1.5) rotate(90deg);
    }
}
```

```html
.animated:hover {
    animation: zoomInAndRotate 1s linear both;
}
```

---

# Sublime Text Shortcuts

**Install Package Control**

1. Open Sublime Terminal with `CTRL + ~`.
2. Copy and paste the following into the Sublime Terminal:

    > import urllib.request,os,hashlib; h = '2deb499853c4371624f5a07e27c334aa' + 'bf8c4e67d14fb0525ba4f89698a6d7e1'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)

3. Hit Enter.
4. Close Sublime Terminal with `ESC`.
5. Open Package Control `CMD + SHIFT + P`.
6. Type `install`, notice all the options you can do and how Sublime suggests items based on what you are searching for.
7. Select the item named `Package Control: Install Package`.
8. Search for `Prettify` and install!
9. Now you should be able to type `CMD + SHIFT + H` in any file and have the file by automatically formatted.

---

# Bower

```sh
# search for a CSS or JS library to include
$> bower search <package name>
# such as ...
$> bower search normalize


# install a file in your project directory
$> bower install <package name>
# such as ...
$> bower install normalize.css
```

**Go-to resources for front end projects**

```sh
$> bower install normalize.css
$> bower install typeplate-starter-kit
```

Then include this in your `index.html`:

```html
<link rel="stylesheet" type="text/css" href="./bower_components/normalize.css/normalize.css">
<link rel="stylesheet" type="text/css" href="./bower_components/typeplate-starter-kit/css/typeplate.css">
```

---

# Mac OS X Terminal Basics

```sh
# make a directory
$ mkdir <directory-name>

# move into a directory
$ cd <directory-name>

# list the contents of a directory
$ ls <directory-name>

# the symbol for the current directory is a dot
$ ls . # this lists the contents of the current directory

# the symbol for the parent directory is ..
$ cd .. # this moves up a directory

# See the current directory
$ pwd
```

---

# Git

To use the basics of git, you can think of it as a briefase with folders in it. It takes a copy of papers (a printout of your project at a certain point in time), but it will only snapshot the things you have placed in the "staging area" (the folders, in this analogy).

**Configuring git editor**

```sh
git config --global core.editor "sublime --wait"
```

**Cloning a repository to your computer**

This creates a git repository in the current directory.

```sh
git clone <ssh URL from your github repo>
```

**Adding files to the staging area**

To see the current status of your directory and repository:

```sh
$ git status
```

To track *all* files. You can do this by adding the current directory.

```sh
$ git add --all .
```

**Checking the status**

```sh
$ git status
```

**Committing files**

Now that you have files in the staging area, you can save a snapshot of the staging area using a commit.

```sh
$ git commit -am "some commit message"
```

**Pushing to GitHub**

```sh
$ git push origin master
```

If you use the wrong command, it might give you an error, but it won't hurt anything, so don't worry too much about remembering whether you've already pushed.

**Github pages**

Github allows you to create a branch called `gh-pages`. These files (like an index.html file) will then be accessible at <github-username>.github.io/<projectname>/index.html.

```sh
# after committing and pushing to Github
# ---
# 1. create a branch called gh-pages and work within that 'folder'
#    '-b' is used only once to create gh-pages. omit '-b' if you already created 'gh-pages'.
$ git checkout -b gh-pages
# 2. grab all the latest commits from 'master' and apply them to 'gh-pages'
$ git merge master
# 3. push these updates to git
$ git push origin gh-pages
# 4. checkout 'master' again; you should do this so that any edits you make to your code starts in the 'master' branch
```
$ git checkout master

---

# Responsive Web Design

Several different layout properties have been assessed, and the primary approach to create type-setting "grids" (for example, a newspaper layout), is to create a parent element with a bunch of child elements that `float:left`.

This works well, and is easily implemented with the following:

```css
.parent-element {
    position: relative;
    overflow-y: auto; /* force the height of the parent-element to be as tall as that of the floated elements inside it */
}
.parent-element > * {
    float:left;
    width: 50%;
}
```

The technique above creates "rows of two". For "rows of three", change the width of `.parent-element`'s children (the grid elements) to 33%.

Also, in this approach, the grid elements have no seperation. This isn't ideal, so let's reduce the width of each grid element by 2% and add 1% margins for whitespace:

```css
.parent-element {
    position: relative;
    overflow-y: auto;
}
.parent-element > * {
    float:left;
    width: 48%;
    margin: 0 1% 1.5em 1%; /* top right bottom left */
}
```

This will put some space in-between each grid element.

**Adapting the number of columns to the screen size**

One of the most prominent topics today in the CSS arena is how to approach making "one-size-fits-all" websites. These "responsive" sites work well with large desktop screens, small phone screens, and everything in-between.

For these sites to work "well", sometimes we must implement "collapsing columns", which means as the screen size grows, columns or layout can change. We will cover one primary approach to create "collapsing columns" with **media queries**.

**Rule #1** for using media queries is to start "mobile first". That is:

1. Make all of your CSS statements that are **NOT** inside a media query declare styles for a mobile screen.
2. Find the "breakpoints" - the widths or heights of your browser that a style should change, and write them down
3. Write mediaqueries for each "breakpoint".

Thus, if the CSS from earlier should be changed to mobile first, we would start with a "single column" layout.


```css
.parent-element {
    position: relative;
    overflow-y: auto;
}
.parent-element > * {
    float:left;
    width: 98%;
    margin: 0 1% 1.5em 1%; /* top right bottom left */
}
```

Next, we want to have two columns when the screen is at a tablet size (about 765px), and three columns when the screen is at a reasonable desktop size (about 1024px):

```css
.parent-element {
    position: relative;
    overflow-y: auto;
}
.parent-element > * {
    float:left;
    width: 98%;
    margin: 0 1% 1.5em 1%; /* top right bottom left */
}
@media (min-width: 765px) {
    /* change to two columns */
    .parent-element > * {
        width: 48%;
    }
}
@media (min-width: 1024px) {
    /* change to three columns */
    .parent-element > * {
        width: 31%;
    }
}
```

---

# Box Sizing

One of my least favorite parts about layout with CSS is the relationship of width and padding. You’re busy defining widths to match your grid or general column proportions, then down the line you start to add in text, which necessitates defining padding for those boxes. And ‘lo and behold, you now are subtracting pixels from your original width so the box doesn’t expand.

If I say the width is 200px, gosh darn it, it’s gonna be a 200px wide box even if I have 20px of padding!!

Here's a fix:

```css
*, *::before, *::after {
    box-sizing: border-box;
}
```

And a visual description of how this changes things (for the better):

![](./extras/border-box.jpg)

---

# The Inline Block Grid

The "inline-block grid" is a slighly different approach from the "float grid". Both approaches can use media queries to make responsive columns. However, the "inline-block grid" takes a different layout approach, and can be customized more.

Let's address the pieces for the grid, one at a time:

1. Box-sizing - keep the padding growing inwards

    ```css
    *, *::before, *::after {
        box-sizing: border-box;
    }
    ```

2. The `.grid` class

    ```css
    .grid {
        font-size: 0px;
        text-align: justify;
        position: relative;
    }
    ```

    - The font-size is set to 0 on the container element because inline elements have "text spaces" between them. We are forcing those "text spaces" to have no width.
    - Justifying the text spreads the items out along the entire horizontal line. This gives the appearance of margins and whitespace b/w the columns if the combined width of the elements doesn't span the width of the container.

3. The `.grid::after` pseudo-element

    The last inline element of any container will never be "justified". Because we want all all of our grid elements to be "justified", we are adding a hidden inline-block at the end of the container to let our grid elements justify.

    ```css
    .grid::after {
        content: "";
        display: inline-block;
        width: 100%;
    }
    ```

4. The "mobile-first" case

    ```css
    .grid > * {
        display: inline-block;
        width: 100%;
        text-align: left; /* reset the text-alignment */
        font-size: medium; /* reset the font size */
        vertical-align: top;
        transition: all .25s ease; /* optional, but cool */
    }
    ```

5. The customizations

    ```css
    @media (min-width: 765px){
        .grid-2-765 > * { width: 48%; }
    }

    @media (min-width: 1024px){
        .grid-3-1024 > * { width: 31.33%; }
    }
    ```

    Any combination of customizations can be created and added to an element for granular control of layout.

6. The HTML

```html
<div class="grid grid-2-765 grid-3-1024">
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <a href="#"></a>
    <div></div>
    <div></div>
    <li></li>
</div>
```

Now, because the CSS forces every grid element inside the `.grid` container to be an inline block, we can use nearly any element as a child (i.e. `span`, `a`, `div`, `li`, ...).

---

# Forcing Aspect-Ratio

Forcing the aspect ratio can be done with an `::after` pseudo-element. In this case, `padding-top: 100%;` means give the `::after` element a top padding that is 100% of the container's width.

```css
.squarify > *::after {
    content: "";
    display: block;
    padding-top: 100%;
}
```

---

# Absolute Centering

http://tiy-houston-front-end-engineering.github.io/TShirts/centering.html

```css
*, *::before, *::after {
    box-sizing: border-box;
}
.square {
    margin: auto;
    width: 200px;
    background-color: chartreuse;
}
.square::after {
    content:"";
    display: block;
    padding-top: 100%;
}
.centerify {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}
```


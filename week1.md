# Week 1

# Objectives

- Policies, learning styles, notes, communications, scheduling, automating, focus (http://blog.pickcrew.com/5-alternative-ways-to-manage-time/)
- Chrome Dev Tools
- [Mac OS X Terminal Basics](#mac-os-x-terminal-basics)
- HTML
- [CSS](#css)
- [Git](#git)
- Sublime Text shortcuts
- Mac keyboard shortcuts
- [Bower](#bower)
- DND mode
- "How a browser reads a web-page"
- General resources
- Blogging and branding
- Expectations, Policies, Schedules, Fun Stuff
- Sublime boilerplate code and tab completion
- The ipsums (http://meettheipsums.com/)
- Layout: `display` and `position`
- The Box Model
- [Responsive Web Design](#responsive-web-design)
- [Box Sizing](#box-sizing)
- [The Inline Block Grid](#the-inline-block-grid)
- Fonts and Google Fonts
- Shell-scripting (bash) and automating repetitive work

---

# Resources

**HTML Tags and Attributes, CSS Properties, Ipsums, GIFs, MDN**

- http://meettheipsums.com/
- Mozilla Developer Network: https://developer.mozilla.org/en-US/
- List of HTML tags: https://developer.mozilla.org/en-US/docs/Web/HTML/Element
- List of HTML attributes: https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes
- All the CSS properties! https://developer.mozilla.org/en-US/docs/Web/CSS/Reference
- You need GIFs, so get 'em here: http://giphy.com/

**Typography, Fonts, A-to-Z-css**

- http://necolas.github.io/normalize.css/
- http://typeplate.com/
- http://kennethormandy.com/journal/normalize-opentype-css
- http://hellohappy.org/beautiful-web-type/
- http://www.atozcss.com/media-queries/ and the entire AtoZcss podcast lineup: http://www.atozcss.com/

**CSS almanac, pseudo-classes/selectors, codepen patterns, currentColor**

- http://css-tricks.com/almanac/
- CSS pseudo-classes and selectors
- http://a.singlediv.com/
- http://codepen.io/patterns/
- `currentColor`
- `::before` / `::after`

---

# Discussion Topics and Homework

### (1.) Monday

- Common HTML tags vs display type, shorthand CSS values, ems, `box-sizing:border-box`

**Homework**

1. Read http://learnlayout.com/
- Do this assignment: .. link to html-intro-1
- Watch "The Long Game pt 1 and 2": http://delve.tv/essays/
- Blog about "The Long Game" and your first assignment ~~> start a blog on http://medium.com

---

# HTML

**Syntax**

**Attributes**

**Nesting**

**Tags**

**Semantic Tags (and other HTML5 additions)**

---

# CSS

**Syntax**

**Specificity**

**Point system**

**Layout techniques**

**Pseudo-selectors**

**Pseudo-objects**

**Transitions**

**Transforms**

**Keyframes**

**attr()**

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
$ git add .
```

**Checking the status**

```sh
$ git status
```

**Committing files**

Now that you have files in the staging area, you can save a snapshot of the staging area using a commit.

```sh
$ git commit
```

This will open a text editor, probably Sublime. (See [Configuring git editor](#configuring-git-editor) if Sublime doesn't open.)

Enter a commit message as the first line in the editor (e.g. "Initial commit" or "Fix the font in index.html"). Save the document in the editor and close the window. Git will finish running in the terminal and you should see output like the following:

```
$ git commit
[master 7b84c79] Fix font in index.html
1 file changed, 12 insertions(+), 2 deletions(-)
```

**Pushing to GitHub**

First you'll need to make a repository on GitHub (replace `<projectname>` with the name of your project) and clone it:

```sh
$ git clone <project SSH URL>
```

Then, push your commits to GitHub:

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

# Inline Block Grid

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
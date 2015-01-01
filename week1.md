# Week 1

# Objectives

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
- The ipsums (http://meettheipsums.com/),
- Layout: `display` and `position`
- The Box Model
- Responsive Web Design
- Fonts and Google Fonts
- Shell-scripting (bash) and automating repetitive work

---

# Resources

** HTML Tags and Attributes, CSS Properties, Ipsums, GIFs, MDN **

- http://meettheipsums.com/
- Mozilla Developer Network: https://developer.mozilla.org/en-US/
- List of HTML tags: https://developer.mozilla.org/en-US/docs/Web/HTML/Element
- List of HTML attributes: https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes
- All the CSS properties! https://developer.mozilla.org/en-US/docs/Web/CSS/Reference
- You need GIFs, so get 'em here: http://giphy.com/

** Typography, Fonts, A-to-Z-css **

- http://necolas.github.io/normalize.css/
- http://typeplate.com/
- http://kennethormandy.com/journal/normalize-opentype-css
- http://hellohappy.org/beautiful-web-type/
- http://www.atozcss.com/media-queries/ and the entire AtoZcss podcast lineup: http://www.atozcss.com/

** CSS almanac, pseudo-classes/selectors, codepen patterns, currentColor **

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

** Homework **

1. Read http://learnlayout.com/
- Do this assignment: .. link to html-intro-1
- Watch "The Long Game pt 1 and 2": http://delve.tv/essays/
- Blog about "The Long Game" and your first assignment ~~> start a blog on http://medium.com

---

# CSS

** Syntax **
** Specificity **
** Layout techniques **
** Pseudo-selectors **
** Pseudo-objects **
** Transitions **
** Transforms **
** Keyframes **

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

** Go-to resources for front end projects **

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

** Configuring git editor **

```sh
git config --global core.editor "sublime --wait"
```

** Cloning a repository to your computer **

This creates a git repository in the current directory.

```sh
git clone <ssh URL from your github repo>
```

** Adding files to the staging area **

To see the current status of your directory and repository:

```sh
$ git status
```

To track *all* files. You can do this by adding the current directory.

```sh
$ git add .
```

** Checking the status **

```sh
$ git status
```

** Committing files **

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

** Pushing to GitHub **

First you'll need to make a repository on GitHub (replace `<projectname>` with the name of your project) and clone it:

```sh
$ git clone <project SSH URL>
```

Then, push your commits to GitHub:

```sh
$ git push origin master
```

If you use the wrong command, it might give you an error, but it won't hurt anything, so don't worry too much about remembering whether you've already pushed.

** Github pages **

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

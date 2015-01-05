#!/bin/sh
#
# test for a Folder name and URL

say "Attention: please answer a question in the terminal!"
echo "(1) Enter the folder name to create for this new project:"
read folderName

if [ -z $folderName ] ; then
    echo "You emptied an empty answer. Can't continue." >&2; exit 1
fi

say "Attention: please answer a question in the terminal!"
echo "(2) Enter the Git SSH URL for this project:"
read gitSshUrl

if [ -z $gitSshUrl ] ; then
    echo "You emptied an empty answer. Can't continue." >&2; exit 1
fi

# setup our directory
mkdir $folderName
cd $folderName

# start git in this folder and setup the Git URL as the origin
git init
git remote add origin $gitSshUrl
git commit -am "initial"
git pull origin master

# setup some files
mkdir ./css
mkdir ./dist
mkdir ./js
mkdir ./js/test
mkdir ./templates
mkdir ./scss

bower install normalize.css typeplate-starter-kit jquery lodash pathjs Loader backbone --save

if [ ! -f ./index.html ]; then
    touch ./index.html
    # insert some links into the HTML
    echo '
<!DOCTYPE html>
<html style="opacity: 0;">
<head>
    <title></title>
</head>
<body>
    <script type="text/javascript" src="./bower_components/Loader/loader.js" id="loaderjs" data-app="./js/app.js"></script>
</body>
</html>
    ' > ./index.html
fi
if [ ! -f ./scss/style.scss ]; then
    touch ./scss/style.scss
    # insert some links into the HTML
    echo '

@import "../bower_components/normalize-scss/_normalize.scss";
@import "../bower_components/typeplate-starter-kit/css/_typeplate.scss";

@mixin gridify($col, $width, $gutter: 2) {
    @media only screen and (min-width: #{$width}#{"px"}){
        .grid-#{$col}-#{$width} {
            & > * {
                width: #{(100 / $col) - $gutter}#{"%"};
            }
        }
    }
}

/**
 * BOX-SIZING
 */

*, *:before, *:after {
    box-sizing: border-box;
}

/**
 * GRIDS
 */

.grid {
    width: 100%;
    display: block;
    font-size: 0;
    text-align: justify;
    position: relative;

    & > * {
        font-size: medium;
        text-align: left;
        display: inline-block;
        width: 100%;
        vertical-align: top;
    }

    &:after {
        display: inline-block;
        width: 100%;
        content: "";
        font-size: medium;
    }
}

@include gridify(2, 400);
@include gridify(4, 600);

/**
 * GENERAL
 */

body {
    transition: opacity .25s ease;
}
    ' > ./scss/style.scss
fi
if [ ! -f ./js/app.js ]; then
    touch ./js/app.js
    # setup our default app.js file
    echo '
window.onload = app;

// runs when the DOM is loaded
function app(){
    "use strict";

    // load some scripts (uses promises :D)
    loader.load(
        //css
        {url: "./dist/style.css"},
        //js
        {url: "./bower_components/jquery/dist/jquery.min.js"},
        {url: "./bower_components/lodash/dist/lodash.min.js"},
        {url: "./bower_components/backbone/backbone.js"}
    ).then(function(){
        _.templateSettings.interpolate = /{([\s\S]+?)}/g;
        document.querySelector("html").style.opacity = 1;
        // start app?
    })

}
    ' > ./js/app.js
fi
if [ ! -f ./js/test/main.js ]; then
    touch ./js/test/main.js
    # write to our testing js
    echo '
_.templateSettings.interpolate = /{([\s\S]+?)}/g;

mocha.setup({
    ui: "bdd",
    ignoreLeaks: true
});

var assert = chai.assert;
var expect = chai.expect;

//--- your setup code goes here (i.e. create test instances of your Constructors)
//--- your setup code goes here

//--- your tests go here
// an example test suite
describe("Array", function(){
    describe("#indexOf()", function(){
        it("should return -1 when the value is not present", function(){
            expect([1,2,3].indexOf(5)).to.equal(-1);
            expect([1,2,3].indexOf(0)).to.equal(-1);
        })
    })
})
//--- your tests go here

mocha.globals(["jQuery"]);
mocha.run();
    ' > ./test/main.js
fi

if [ ! -f ./Procfile ]; then
    touch ./Procfile
    # setup our Procfile
    echo 'web: node heroku-server.js' > ./Procfile
fi
if [ ! -f ./server.js ]; then
    curl https://raw.githubusercontent.com/TIY-Houston-Front-End-Sept-2014/Notes/master/examples/extras/server.js > ./server.js
fi
if [ ! -f ./heroku-server.js ]; then
    touch ./heroku-server.js
    curl https://raw.githubusercontent.com/TIY-Houston-Front-End-Sept-2014/Notes/master/examples/extras/heroku-server.js > ./heroku-server.js
fi
if [ ! -f ./gulpfile.js ]; then
    # download our gulp file
    curl https://raw.githubusercontent.com/TIY-Houston-Front-End-Sept-2014/Notes/master/examples/extras/gulpfile.js > ./gulpfile.js
fi

if [ ! -f ./package.json ]; then
    npm init
    npm install gulp gulp-autoprefixer gulp-jshint gulp-sass --save-dev
    npm install express method-override request lodash --save
fi

# write to our .gitignore
echo "node_modules" > .gitignore

# get our post-commit hook to auto-commit to gh-pages
curl https://raw.githubusercontent.com/TIY-Houston-Front-End-Sept-2014/Notes/master/examples/extras/git-hook-post-commit.sh > .git/hooks/post-commit
chmod a+x .git/hooks/post-commit

# finish up on git
git add --all .
git commit -am "ok, wrapping up install process"
git branch gh-pages
git push --all

say "Installation and setup of this get repository has been successful!"

# final messages
echo "Don't forget to:
(1) setup a heroku account
(2) install https://toolbelt.heroku.com/"

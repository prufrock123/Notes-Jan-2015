# Week 5

# Objectives

1. jQuery vs. Vanilla JS
- Inheritance
- Error Handling
- RegEx
- Heroku

---

# Discussion Topics and Homework

- Friday
    + **Homework**
        * Watch and blog about: [Writing Testable JS](https://www.youtube.com/watch?v=OzjogCFO4Zo)
        * JavaScript Koans - (https://github.com/mrdavidlaing/javascript-koans)

---

- jQuery vs. Vanilla (from TA lecture Friday afternoon)

    > http://youmightnotneedjquery.com

- Error handling

    > ...is important for robust code.

    Topics:

    - Error objects and extending them,
    - try/catch/finally,
    - throw

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

- Constructors, Prototypes, and Inheritance

    > http://bonsaiden.github.io/JavaScript-Garden/#object.prototype

    General approach:

    ```js
        base = new Base();
        Derived.prototype = base; // Must be before new Derived()
        Derived.prototype.constructor = Derived; // Required to make `instanceof` work
    ```

    Example:

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

- Regular Expressions (or RegExp for short)

    > http://regexpal.com/

    In JS, there is a `RegExp` Object. RegExp is used to test for patterns in strings (i.e. the `type="email"` and `pattern="[a-zA-Z]+"` attributes on an HTML element uses RegEx to **test for matches**).

    We will use RegExp most often through two primary approaches:

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

    RegExp keeps track of the groups () it has matched, and automatically numbers them.

    ```js
    // Find the words which consist only of the same letters
    var text = 'Abc ddefg, hijk lllll mnopqr ssss. Tuv wxyyy z.';
    var sameLetterRegex = /\b(\w)\1*\b/g;
    console.log( text.match(sameLetterRegex) );
    ```

    Aside from matching character patterns in strings, we can use RegExp to to substitute text out (think "find and replace" feature of text editors). We can do this with `String.replace()`.

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

- Node.js and Heroku

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

    ### Want to easily open your shiny new app on Heroku's website?

    ```sh
    heroku open
    ```

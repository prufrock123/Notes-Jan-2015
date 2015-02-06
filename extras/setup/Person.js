;(function(m){

    "use strict";

    function Person(name){
        this.name = name;
    }

    Person.prototype = {
        setName: function(name){
            this.name = name;
        }
    }

    m.exports.Person = Person;

})(typeof module === "object" ? module : window);
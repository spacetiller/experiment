'use strict'
var fs = require("fs");

fs.readFile('input.txt', function (err, data) {
    if (err) return console.error(err);
    console.log(data.toString());
});

console.log("³ÌĞòÖ´ĞĞ½áÊø!");
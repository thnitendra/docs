# https://www.npmjs.com/package/request
# npm install
# node ajax_test.js
var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;
var xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
       // Action to be performed when the document is read;
       console.log("ok");

    } else {
	console.log(this.readyState + " " + this.status);
    }
};
xhttp.open("GET", "http://google.com",true);
xhttp.send();

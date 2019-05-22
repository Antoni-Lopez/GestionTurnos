'use strict';

const express = require('express');
const bodyParser = require('body-parser');
const app = express();

app.use(bodyParser.urlencoded({extended: false}));

app.get('/', function (request, response) {
    response.send('Hello');
});

app.post('/', function (request, response) {
    response.send(request.body);
});

app.listen(3000);

console.log('Open: https://red-duck-60.localtunnel.me/loginform2.aspx');
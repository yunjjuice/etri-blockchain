var express = require('express');
var app = express();

app.get('/', function (req, res) { // localhost 주소 자체
    res.send('It Works!');
});

app.get('/test', function (req, res) { // localhost/test 주소
    res.send('test page Works!');
});

// CRUD 해보기
app.get('/create', function (req, res){
    res.send('create');
});

app.get('/read', function (req, res){
    res.send('read');
});

app.get('/update', function (req, res){
    res.send('update');
});

app.get('/delete', function (req, res){
    res.send('delete');
});

var server = app.listen(80, function () {
    console.log('Node Express Webserver Started');
});
var http = require('http'),
    express = require('express');

var port = 3000; // 포트는 임의로 지정 가능. 예약된 거 있을까 봐 3000 함
var app = express();
app.use(express.urlencoded()); // 한글 사용

var server = http.createServer(app).listen(port, function(){
  console.log("Http server listening on port " + port);
});

app.get('/', function (req, res) { // /는 루트
	res.writeHead(200, {'Content-Type' : 'text/html'}); // html을 화면에 보여주고
	res.write('<h3>Hello World!</h3>'); // 태그를 보여준다
	res.write('<a href="/login">Please login</a>'); // 태그를 그냥 넣어줬다 a태그 /login으로 이동
	res.end();
});

app.get('/login', function (req, res){
	res.writeHead(200, {'Content-Type': 'text/html'});
	res.write('<h3>Login</h3>');
	res.write('<form method="POST" action="/login">');
	res.write('<label name="userId">UserId : </label>')
	res.write('<input type="text" name="userId"><br/>');
	res.write('<label name="password">Password : </label>')
	res.write('<input type="password" name="password"><br/>');
	res.write('<input type="submit" name="login" value="Login">');
	res.write('</form>');
	res.end();
})

app.post('/login', function (req, res){
	var userId = req.param("userId"); // param 안에 값은 위에 있는 html name과 맞춰준다.
	var password = req.param("password")

	res.writeHead(200, {'Content-Type': 'text/html'});
	res.write('Thank you, '+userId+', you are now logged in.');
	res.write('<p><a href="/"> back home</a>');
	res.end();
});
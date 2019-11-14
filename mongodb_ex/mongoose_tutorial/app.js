// serverjs

// [LOAD PACKAGES]
var express     = require('express');
var app         = express();
var bodyParser  = require('body-parser');
var mongoose    = require('mongoose');
let MONGO_URI   = "mongodb://localhost/database"
// [ CONFIGURE mongoose ]
// Node의 native Promise 사용
mongoose.Promise = global.Promise;

// Connect to MongoDB
mongoose.connect(MONGO_URI, { useNewUrlParser: true, useCreateIndex: true, useUnifiedTopology: true })
  .then(() => console.log('Successfully connected to mongodb'))
  .catch(e => console.error(e));


// CONNECT TO MONGODB SERVER
// var db = mongoose.connection;
// db.on('error', console.error);
// db.once('open', function(){
//     // CONNECTED TO MONGODB SERVER
//     console.log("Connected to mongod server");
// });

// mongoose.connect('mongodb://localhost/mongodb_tutorial');

// DEFINE MODEL
var Book = require('./models/book');

// [CONFIGURE APP TO USE bodyParser]
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// [CONFIGURE SERVER PORT]

var port = process.env.PORT || 3000;

// [CONFIGURE ROUTER]
var router = require('./routes')(app, Book);

// [RUN SERVER]
var server = app.listen(port, function(){
 console.log("Express server has started on port " + port)
});
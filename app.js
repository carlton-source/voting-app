const express = require('express');
const bodyParser = require('body-parser');
const dotenv = require('dotenv');
const app = express();


dotenv.config();

app.use(bodyParser.json());
module.exports = app;
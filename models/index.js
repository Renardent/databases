const {Client} = require('pg');
const User = require('./User');
const Phone = require('./Phone');
const {configs} = require('../configs');

const client = new Client(configs);

User._client = client;
User._tableName = 'users';

Phone._client = client;
Phone._tableName = 'products';


module.exports = {
    client,
    User, 
    Phone
};
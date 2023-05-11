const {Client} = require('pg');
const { mapStudents } = require('./.vscode/utils');
const {configs} = require('./configs');
const {loadUsers} = require('./api');
const {getUsers} = require('./api/fetch');

const client = new Client(configs);

async function start() {
    await client.connect();

    const studentArray = await getUsers();

    const res = await client.query(`INSERT INTO students (first_name,last_name, group_id) VALUES ${mapStudents(studentArray)}`);
    console.log(res); 

    await client.end();
}
start();

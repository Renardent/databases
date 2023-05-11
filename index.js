const {Client} = require('pg');
const { mapStudents } = require('./.vscode/utils');

const configs = {
    host: 'localhost',
    port: 5432,
    user: 'postgres',
    database: 'university',
    password: '111'
}

const client = new Client(configs);

const studentArray = [{
    firstName: 'Big',
    lastName: 'Ben',
    group_id: '2'
},
{
    firstName: 'Moriarty',
    lastName: 'Albert',
    group_id: '3'
},
{
    firstName: 'Moriarty',
    lastName: 'William',
    group_id: '1'
}]


async function start() {
    await client.connect();

    const res = await client.query(`INSERT INTO students (first_name,last_name, group_id) VALUES ${mapStudents(studentArray)}`);
    console.log(res); 

    await client.end();
}
start();

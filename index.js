const {User, client} = require('./models');
const {getUsers} = require('./api/fetch');


async function start() {
    await client.connect();

    const studentArray = await getUsers();

    const res = await User.bulkCreate(studentArray);
    console.log(res); 

    await client.end();
}
start();

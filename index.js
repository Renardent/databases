const {User, Phone, client} = require('./models');
const {getUsers} = require('./api/fetch');
const {generatePhones} = require('./utils');


async function start() {
    await client.connect();

    //const studentArray = await getUsers();

    //const res = await User.bulkCreate(studentArray);
    const phones = generatePhones(100);
    const res2 = await Phone.bulkCreate(phones);

    await client.end();
}
start();

const axios = require('axios');
 
const http= axios.create ({
    baseURL: 'https://randomuser.me/api/'
});


module.exports.loadUsers = async () => {
     http.get('?results=25').then(response => {
        console.log(response);
    });
    // const {data: {results}} = await
    // console.log(results);
}
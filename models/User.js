
const {mapStudents} = require('../utils');

class User {
    static _client;
    static _tableName;

    static findAll(){
        return this._client.query(`SELECT * FROM ${this._tableName}`);
    }


    static bulkCreate(users) {
    this. client.query(`INSERT INTO ${this._tableName} (first_name, last_name, group_id) VALUES ${mapStudents(studentArray)}`);

    }
}

module.exports = User;
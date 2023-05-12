class Phone {
    static _client;
    static _tableName;

    static async bulkCreate(phones) {
        const valueString = phones.map(
        ({brand,model,price,quantity = 1, category}) => `('${brand}', '${model}', ${price}, ${quantity}, '${category}')`
        ).join(',');
        
        const res = await this._client.query (
            `INSERT INTO ${this._tableName}
            (brand, price, model, quantity, category) VALUES
            ${valueString};`
        )

    }
}



module.exports = Phone;
const mysql2 = require("mysql2");

const connection = mysql2.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'privateschool',
    port: 3306
});


connection.connect(function (error) {
    if (error) {
        console.log(error);
    } else {
        console.log("Connected!");
    }
});

module.exports = connection;
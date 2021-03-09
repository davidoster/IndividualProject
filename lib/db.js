const mysql2 = require("mysql2");

const connection = mysql2.createConnection({
    host: 'ra1.anystream.eu',
    user: 'root',
    password: 'AFDEmp_MySQL1',
    database: 'private_school',
    port: 3012
});


connection.connect(function (error) {
    if (error) {
        console.log(error);
    } else {
        console.log("Connected!");
    }
});

module.exports = connection;
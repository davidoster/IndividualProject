const express = require('express');
const router = express.Router();
const dbconnection = require('../lib/db');

router.get('/', (req, res, next) => {
    const query = "SELECT * FROM assignments";
    const fullUrl = req.protocol + '://' + req.get('host') + req.baseUrl;
    dbconnection.query(query, function (err, rows) {
        if (err) {
            res.render('assignment', { title: 'Assignments - ERROR', assignments: '', message: req.query.message });
        } else {
            res.render('assignment', { title: 'Assignments', assignments: rows, message: req.query.message, url: fullUrl });
        }
    });
});

module.exports = router;
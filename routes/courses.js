const express = require('express');
const router = express.Router();
const dbconnection = require('../lib/db');

router.get('/', (req, res, next) => {
    const query = "SELECT * FROM courses";
    const fullUrl = req.protocol + '://' + req.get('host') + req.baseUrl;
    dbconnection.query(query, function (err, rows) {
        if (err) {
            res.render('courses', { title: 'Courses - ERROR', courses: '', message: req.query.message });
        } else {
            res.render('courses', { title: 'Courses', courses: rows, message: req.query.message, url: fullUrl });
        }
    });
});

module.exports = router;
const express = require('express');
const router = express.Router();
const dbconnection = require('../lib/db');
const Trainer = require('../models/trainer');


router.get('/', (req, res, next) => {
    const query = "SELECT * FROM trainers";
    const fullUrl = req.protocol + '://' + req.get('host') + req.baseUrl;
    dbconnection.query(query, function (err, rows) {
        if (err) {
            res.render('trainers', { title: 'Trainers - ERROR', trainers: '', message: req.query.message });
        } else {
            res.render('trainers', { title: 'Trainers', trainers: rows, message: req.query.message, url: fullUrl });
        }
    });
});

router.get('/add/', (req, res, next) => {
    res.render('addTrainer', { title: 'Trainers - Add New', message: '' });
});

router.post('/add', (req, res, next) => {
    let trainer = new Trainer(undefined, req.body.firstName, req.body.lastName, req.body.subject);
    const query = `INSERT INTO privateschool.trainers (first_name, last_name, subject) VALUES (?, ?, ?);`
    dbconnection.execute(query, [trainer.firstName, trainer.lastName, trainer.subject], (err, result) => {
        if (err) {
            res.render('addTrainer', { title: '', messag: 'ERROR inserting Data into DB' });
        } else {
            res.redirect('/trainers?message=New Trainer Added!!');
        }
    });
});

module.exports = router;
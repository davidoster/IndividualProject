const express = require('express');
const router = express.Router();
const dbconnection = require('../lib/db');
const Student = require('../models/student');


router.get('/', (req, res, next) => {
    const query = "SELECT * FROM students";
    const fullUrl = req.protocol + '://' + req.get('host') + req.baseUrl;
    dbconnection.query(query, function (err, rows) {
        if (err) {
            res.render('students', { title: 'Students - ERROR', students: '', message: req.query.message });
        } else {
            res.render('students', { title: 'Students', students: rows, message: req.query.message, url: fullUrl });
        }
    });
});

router.get('/add/', (req, res, next) => {
    res.render('addStudent', { title: 'Student - Add New', message: '' });
});

router.post('/add', (req, res, next) => {
    let student = new Student(undefined, req.body.firstName, req.body.lastName, req.body.dateOfBirth, req.body.tuition);
    const query = `INSERT INTO privateschool.students (first_name, last_name, date_of_birth, tuition_fees) VALUES (?, ?, ?, ?);`
    dbconnection.execute(query, [student.firstName, student.lastName, student.dateOfBirth, student.tuitionFees], (err, result) => {
        if (err) {
            res.render('addStudent', { title: '', message: 'ERROR inserting Data into DB' });
        } else {
            res.redirect('/students?message=New Student Added!!');
        }
    });
});

module.exports = router;
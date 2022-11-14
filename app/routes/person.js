const express = require('express');

const person = require('../controllers/person');

const router = express.Router();

router.get('/', person.getPeople);
router.get('/:personId', person.getPerson);
router.post('/', person.createPerson);
router.patch('/:personId', person.updatePerson);
router.delete('/:personId', person.deletePerson);

module.exports = router;

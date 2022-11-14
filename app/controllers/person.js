const Person = require('../models/person');

const getPeople = async (req, res) => {
  try {
    const people = await Person.find();

    res.status(200).json({ success: true, message: 'OK', result: people });
  } catch (error) {
    res.status(404).json({ success: false, message: error.message });
  }
};

const getPerson = async (req, res) => {
  const { personId } = req.params;

  try {
    const person = await Person.findById(personId);

    res.status(200).json({ success: true, message: 'OK', result: person });
  } catch (error) {
    res.status(404).json({ success: false, message: error.message });
  }
};

const createPerson = async (req, res) => {
  const newPerson = new Person({
    first_name: req.body.first_name,
    last_name: req.body.last_name,
    age: req.body.age,
  });

  try {
    await newPerson.save();

    res.status(201).json({ success: true, message: 'OK', result: newPerson });
  } catch (error) {
    res.status(400).json({ success: false, message: error.message });
  }
};

const updatePerson = async (req, res) => {
  const { personId } = req.params;
  try {
    await Person.findOneAndUpdate({
      _id: personId,
    },
    {
      first_name: req.body.first_name,
      last_name: req.body.last_name,
      age: req.body.age,
    });
    res.status(202).json({ success: true, message: 'OK' });
  } catch (error) {
    res.status(401).json({ success: false, message: error.message });
  }
};

const deletePerson = async (req, res) => {
  const { personId } = req.params;

  try {
    await Person.findOneAndRemove({ _id: personId });
    res.status(203).json({ success: true, message: 'OK' });
  } catch (error) {
    res.status(402).json({ success: false, message: error.message });
  }
};

module.exports = {
  getPeople,
  createPerson,
  getPerson,
  updatePerson,
  deletePerson,
};

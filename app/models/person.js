const mongoose = require('mongoose');

const personSchema = mongoose.Schema({
  first_name: {
    type: String,
    required: true,
  },
  last_name: {
    type: String,
    required: true,
  },
  age: {
    type: Number,
    required: true,
  },

}, {
  timestamps: true,
  versionKey: false,
});

const personModel = mongoose.model('person', personSchema);
module.exports = personModel;

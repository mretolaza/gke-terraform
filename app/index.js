/* eslint-disable no-console */
const express = require('express');
const mongoose = require('mongoose');

const app = express();

const port = process.env.SERVICE_PORT || 3000;
// const mongoHost = process.env.MONGO_HOST || 'localhost';
// const mongoPort = process.env.MONGO_PORT || '27017';
// const url = `mongodb://${mongoHost}:${mongoPort}`;

// mongoose.set('useNewUrlParser', true);
// mongoose.set('useFindAndModify', false);
// mongoose.set('useCreateIndex', true);
// mongoose.connect(url, { useNewUrlParser: true });

const { connection } = mongoose;
app.use(express.json());
try {
  connection.on('open', () => {
    console.log('connected');
  });
} catch (error) {
  console.log(`Error: ${error}`);
}

// const router = require('./routes/person');

// app.use('/api/person', router);
app.use('/health', (_, res) => {
  res.status(200).json({ success: true, message: 'Hola Bidkar :D' });
});

app.listen(port, () => {
  console.log(`Server started at port ${port}`);
});

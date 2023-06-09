const express = require('express')
const cors = require('cors')

const app = express();

app.use(cors());
app.use(express.json());

const conn = require('./src/db/connDB');
conn();

const routers = require("./src/routers/router");
app.use('/api', routers);

app.listen(3001, () => console.log('Servidor API iníciado com sucesso.'));
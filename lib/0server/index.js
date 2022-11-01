const express = require('express');
const cors = require('cors');
require('dotenv').config();
const app = express();

app.use(cors());

app.use(express.json());

app.get('/', (req, res) => {
    res.status(200).json({
        msg: "Welcome to the nx clone api",
        routes:"/ticket/sections, /ticket/subsections, /tickets, /ticket/:id"
    })
}
);

const ticketModule = require('./modules/tickets/ticket.js');

app.use('/ticket', ticketModule);

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log('listening on port:'+PORT);
}
);

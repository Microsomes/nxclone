

const express = require('express');

const cors = require('cors');

const mysql = require('mysql2');

const app = express();

app.use(cors());

app.use(express.json());

app.get('/', (req, res) => {
    res.status(200).json({
        msg: "Welcome to the nx clone api"
    })
}
);

app.get("/raw",(req,res)=>{
    const tickets = require('./ticket.json');
    res.status(200).json({
        tickets
    })

})

app.listen(3000, () => {
    console.log('Example app listening on port 3000!');
}
);

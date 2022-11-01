

const express = require('express');

const cors = require('cors');

const mysql = require('mysql2');

const fs = require('fs');

require('dotenv').config();

//pool

const pool = mysql.createPool({
host: 'db-mysql-lon1-37482-do-user-8648433-0.b.db.ondigitalocean.com',
user: 'doadmin',
database: 'nxticketv2',
password: 'AVNS_8KsesRhzbt9qOq-UKKn',
port: '25060',
ssl: {
ca: fs.readFileSync(__dirname + '/ca-certificate.crt')
}
});


pool.getConnection(function(err, connection) {
if (err) throw err; // not connected!
console.log('connected to db as id ' + connection.threadId);

connection.query("CREATE TABLE IF NOT EXISTS wallet (id INTEGER PRIMARY KEY AUTO_INCREMENT, ticketName TEXT, ticketPrice TEXT, ticketSubtitle TEXT, ticketSubtitle2 TEXT, isActive INTEGER, purchasedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP, activatedDate TIMESTAMP)", function (err, result) {
if (err) throw err;
console.log("Table created");
});

connection.query("DESCRIBE wallet", (err,result)=>{
if (err) throw err;
console.log(result);
})

connection.release();
});

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

app.get("/ticket/sections",(req,res)=>{
    pool.getConnection(function(err, connection) {
        if (err) throw err; // not connected!
        console.log('connected to db as id ' + connection.threadId);
        connection.query("SELECT * FROM ticket_sections", (err,result)=>{
            if (err) throw err;
            res.status(200).json({
                result
            })
        })
        connection.release();
    } );
})

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log('Example app listening on port:'+PORT);
}
);

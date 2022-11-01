

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

app.get("/ticket/subsections",(req,res)=>{
    pool.getConnection(function(err, connection) {
        if (err) throw err; // not connected!
        console.log('connected to db as id ' + connection.threadId);
        connection.query("SELECT * FROM ticket_subsection", (err,result)=>{
            if (err) throw err;
            res.status(200).json({
                result
            })
        })
        connection.release();
    } );
})

app.get("/ticket",(req,res)=>{
    pool.getConnection(function(err, connection) {
        if (err) throw err; // not connected!
        console.log('connected to db as id ' + connection.threadId);
        connection.query("SELECT * FROM ticket", (err,result)=>{
            if (err) throw err;
            res.status(200).json({
                result
            })
        })
        connection.release();
    } );
})

app.get("/ticket/:id",(req,res)=>{
    const id = req.params.id;
    pool.getConnection(function(err, connection) {
        if (err) throw err; // not connected!
        console.log('connected to db as id ' + connection.threadId);
        connection.query(`SELECT * FROM ticket WHERE id = ${id}`, (err,result)=>{
            if (err) throw err;
            try{
            var id = result[0].id;
            const categoryId = result[0].ticket_section_id;
            const subcategoryId = result[0].ticket_subsection_id;
            console.log(categoryId)

            res.status(200).json({
                ...result[0]
            })
        }catch(err){
            res.status(404).json({
                msg: "Ticket not found"
            })
        }
        })
        connection.release();
    } );
});

app.post("/purchase/ticket", (req,res)=>{
    const {ticketId, accountOrGuestId} = req.body;
    pool.getConnection(function(err, connection) {
        if (err) throw err; // not connected!
        console.log('connected to db as id ' + connection.threadId);
        connection.query(`INSERT INTO ticket_purchased (ticket_id, account_or_guestid) VALUES (${ticketId}, ${userId}, ${quantity})`, (err,result)=>{
            if (err) throw err;
            res.status(200).json({
                msg: "Ticket purchased"
            })
        })
        connection.release();
    } );
})

app.get("/purchased", (req,res)=>{
    pool.getConnection(function(err, connection) {
        if (err) throw err; // not connected!
        console.log('connected to db as id ' + connection.threadId);
        connection.query("SELECT * FROM ticket_purchased", (err,result)=>{
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

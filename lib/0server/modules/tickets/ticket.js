const express = require('express');
const app = express.Router();
const pool = require('../database.js');
const moment = require('moment');


app.get("/raw",(req,res)=>{
    const tickets = require('../../ticket.json');

    res.status(200).json({
        tickets
    })
})

app.get("/sections",(req,res)=>{
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

app.get("/subsections",(req,res)=>{
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

app.get("/tickets",(req,res)=>{
    pool.getConnection(function(err, connection) {
        if (err) throw err; // not connected!
        connection.release();
        console.log('connected to db as id ' + connection.threadId);
        connection.query("SELECT ticket_sections.name as category, (select name FROM ticket_subsection WHERE ticket_subsection.id = ticket.ticket_subsection_id ) as subCategory, ticket.* FROM ticket INNER JOIN ticket_sections ON ticket.ticket_section_id = ticket_sections.id", (err,result)=>{
            if (err) throw err;
            res.status(200).json({
                result
            })
        })
    } );
})


app.post("/purchase", (req,res)=>{
    const {ticketId, accountOrGuestId} = req.body;

    if(!ticketId || !accountOrGuestId){
        res.status(400).json({
            msg: "Please provide a ticket id and account id"
        })
        return;
    }

    pool.getConnection(function(err, connection) {
        if (err) throw err; // not connected!
        console.log('connected to db as id ' + connection.threadId);
        connection.query(`INSERT INTO ticket_purchased (ticket_id, account_or_guestid) VALUES (${ticketId}, ${accountOrGuestId})`, (err,result)=>{
            connection.query(`INSERT INTO ticket_status (ticket_id,status) VALUES (${result.insertId}, 'purchased')`, (err,result)=>{
                connection.release();
                if (err) {
                    res.status(500).json({
                        msg: "Internal Server Error",
                        err
                    })
                }
                res.status(200).json({
                    msg: "Ticket purchased",
                    ticketId: result.insertId
                })
            });
        })
    } );
})

app.get("/purchased", (req,res)=>{
    pool.getConnection(function(err, connection) {
        if (err) throw err; // not connected!
        console.log('connected to db as id ' + connection.threadId);
        connection.query("SELECT * FROM ticket_purchased", (err,result)=>{
            connection.release();
            if (err) throw err;
            
            res.status(200).json({
                result
            })
        })
    } );
})

app.get("/purchased/byuser/:id",(req,res)=>{
    const id = req.params.id;
    pool.getConnection(function(err, connection) {
        if (err) throw err; // not connected!
        console.log('connected to db as id ' + connection.threadId);
        connection.query(`SELECT * FROM ticket_purchased WHERE account_or_guestid = ${id}`, (err,result)=>{
            connection.release();
            if (err) throw err;
            res.status(200).json({
                result
            })
        })
    } );
})


function getTicketStatus(ticketId){
    return new Promise((resolve,reject)=>{
        pool.getConnection(function(err, connection) {
            if (err) throw err; // not connected!
            console.log('connected to db as id ' + connection.threadId);
            connection.query(`SELECT * FROM ticket_status WHERE ticket_id = ${ticketId}`, (err,result)=>{
                connection.release();
                if (err) throw err;
                resolve(result);
            })
        } );
    })
}

function getPurchasedTicketInfo(ticketId){
    return new Promise((resolve,reject)=>{
        pool.getConnection(async function(err, connection) {
            if (err) throw err; // not connected!
            console.log('connected to db as id ' + connection.threadId);
            connection.query(`SELECT * FROM ticket_purchased WHERE id = ${ticketId}`, async (err,result)=>{
                connection.release();
                if (err) reject(err);
                resolve(result
                    );
            })
        } );
    })
}

function purchasedStatus(ticketId){
    return new Promise(async (resolve,reject)=>{
        var statuses = await getTicketStatus(ticketId);

        if(statuses[0].status == "purchased" && statuses.length == 1) {

            var createdDate = moment(statuses[0].date)
            // next day
            var nextDay = moment(createdDate).add(1, 'days')

            //has expired
            var expired = true;

            //unix time for createdDate
            var createdDateUnix = moment(createdDate).unix();
            var expiredDate = moment(nextDay).unix();

             //check if expired
            if(moment().unix() < expiredDate){
                expired = false;
            }
            

            resolve({
                type:"not-used",
                purchasedDate: createdDate,
                expiredDate: nextDay,
                unix:{
                    purchased: createdDateUnix,
                    expired: expiredDate
                },
                expired
            });
        }

        resolve(false);

    })  
}

app.get("/purchased/:id",async (req,res)=>{
    const id = req.params.id;

    var ticket = await getPurchasedTicketInfo(id);
    var statuses = await getTicketStatus(id);

    var calculatedStatus = await purchasedStatus(id);

    if(ticket.length === 0){
        res.status(404).json({
            msg: "Ticket not found"
        })
        return;
    }else{
        ticket = ticket[0];

    res.status(200).json({
        id,
        ticket,
        statuses,
        calculatedStatus
    })
    }
})

app.get("/:id",async (req,res)=>{
    const id = req.params.id;
    pool.getConnection(function(err, connection) {
        if (err) throw err; // not connected!
        console.log('connected to db as id ' + connection.threadId);
        connection.query(`SELECT * FROM ticket WHERE id = ${id}`, (err,result)=>{
            connection.release();
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
    } );
});



module.exports = app;
const mysql = require('mysql2');
const fs = require('fs');

const tickets = require("../ticket.json");


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
pool.getConnection(function (err, connection) {
    if (err) throw err; // not connected!
    console.log('connected to db as id ' + connection.threadId);
    
    connection.query("CREATE TABLE IF NOT EXISTS ticket_sections ( id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT)",(err,result)=>{
        if (err) throw err;
        console.log("Table created: ticket_sections");
    })

    connection.query("TRUNCATE ticket_sections");

    connection.query("CREATE TABLE IF NOT EXISTS ticket_subsection (id INTEGER PRIMARY KEY AUTO_INCREMENT, ticket_section_id INTEGER, name TEXT)",(err,result)=>{
        if (err) throw err;
        console.log("Table created: ticket_subsection");
    })

    connection.query("TRUNCATE ticket_subsection");
    
    connection.query("CREATE TABLE IF NOT EXISTS ticket (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, price DECIMAL(5), subline TEXT, ticket_section_id INTEGER NOT NULL, ticket_subsection_id INTEGER NOT NULL)",(err,result)=>{
        if (err) throw err;
        console.log("Table created: tickets");
    })

    connection.query("TRUNCATE ticket");

    connection.query("CREATE TABLE IF NOT EXISTS ticket_info (id INTEGER PRIMARY KEY AUTO_INCREMENT, type VARCHAR(255), data TEXT, ticket_id INTEGER NOT NULL)",(err,result)=>{
        if (err) throw err;
        console.log("Table created: ticket_info");
    })

    connection.query("TRUNCATE ticket_info");

    connection.query("CREATE TABLE IF NOT EXISTS user_account (id INTEGER PRIMARY KEY AUTO_INCREMENT, email varchar(255), password varchar(255), created TIMESTAMP DEFAULT CURRENT_TIMESTAMP)",(err,result)=>{
        if (err) throw err;
        console.log("Table created: user_account");
    })

    connection.query("CREATE TABLE IF NOT EXISTS ticket_purchased (id INTEGER PRIMARY KEY AUTO_INCREMENT, ticket_id INTEGER NOT NULL, purchased_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, account_or_guestid INTEGER NOT NULL)",(err,result)=>{
        if (err) throw err;
        console.log("Table created: ticket_purchased");
    })
       
    console.log("----")

    Object.keys(tickets['sections']).forEach((key)=>{
        const val = tickets['sections'][key];

        connection.query("INSERT INTO ticket_sections  (name) values (?)",[key],(err,result)=>{
            if (err) throw err;
            console.log("Inserted: "+result.insertId);

            Object.keys(val['sections']).forEach((ltre)=>{
                // console.log(key+":"+ltre);

                connection.query("INSERT INTO ticket_subsection (ticket_section_id,name) values (?,?)",[result.insertId,ltre],(err,result2)=>{
                    if (err) throw err;
                    // console.log("Inserted: "+result2.insertId);


                Object.keys(val['sections'][ltre]).forEach((ticket)=>{
                    // console.log(">>>",key+":"+ltre+":"+ticket);
                    const current = val['sections'][ltre][ticket];

                  

                    connection.query("INSERT INTO ticket (name,price,subline,ticket_section_id,ticket_subsection_id) values (?,?,?,?,?)",[current.name,current.price,current.subline,result.insertId,result2.insertId],(err,result)=>{
                        if (err) throw err;
                        // console.log("Inserted: "+result.insertId);

                        if(current.info == undefined){

                        }else{
                           current.info.forEach((info)=>{
                                console.log(info.type);
                                connection.query("INSERT INTO ticket_info (type,data,ticket_id) values (?,?,?)",[info.type,JSON.stringify(info.val),result.insertId],(err,result)=>{
                                    if (err) throw err;
                                    // console.log("Inserted: "+result.insertId);
                                })
                                // console.log(info.val);
                           })
                        }
                    }
                    );
                });

                });


            })
        })

       
        
    })

    connection.release();
}
);
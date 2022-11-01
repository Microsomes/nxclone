
const mysql = require('mysql2');

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
    
    
const password = "myPassword"  //password removed for lab submission

const express = require('express');
require('dotenv').config()

const apikey = process.env.API_KEY;
console.log({apikey})
const app = express();
const PORT = 5000;
let mysql = require('mysql');
const cors = require('cors');

// permits cross-origin resource sharing
app.use(cors());  

//set up server to listen on designated port
app.listen(PORT, () => { 
   console.log(`Server is listening at http://localhost:${PORT}`)
});

// when admin submits a get request for data via localhost:PORT/orders, return orderData
app.get('/orders', async (req, res) => {
   // test to see if localhost:PORT/orders will return res.send message
   // res.send("This is a test!");

   let orderData = await getOrderData();
   
   // returns orderData in
   res.json(orderData);

});


// when getOrderData is called : 1) connect to db, 2) run query, 3) close db connection and 4) return data
async function getOrderData(){
   let connect = mysql.createConnection({  //open db connection
      host: "localhost",
      user: "root", //your username
      password: password,
      database: "nanas_greens"
   });

// create insert data function and see what is different,  pass in what's different as a parameter

   let orderData = await new Promise((resolve, reject) =>
   {
      connect.query("SELECT * FROM orders", (err, result, fields) => { 
         if (err) {
            reject(err)
         }
         else { 
            resolve(result)
           // console.log(result)
         }
      
         //above as ternary - (err) ? reject(err) : resolve(result);
      })
   })   

   connect.end(); //close db connection
   return orderData;  //from promise above
}



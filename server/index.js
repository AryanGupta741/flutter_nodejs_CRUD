// const express = require("express");
// const app = express();
// const PORT = 3000;

// // all the requested work in this file and all the response work in api.dart file

// // middleware is used to serve data in JSON format and encode the JSON format
// app.use(express.json());
// app.use(express.urlencoded({ extended: true }));

// // this list stores the user data
// const personData = [];

// app.listen(PORT, () => console.log(`Server started at port number: ${PORT}`));

// // POST API
// app.post("/api/add_person", (req, res) => {
//     console.log("result", req.body);
//     console.log("work");
//     const pdata = {
//         "id": personData.length + 1,
//         "pname": req.body.pname,
//         "pphone": req.body.pphone,
//         "pAge": req.body.pAge,
//     };
//     // push the data into persondata list
//     personData.push(pdata);
//     console.log("Final RESULT", pdata);

//     res.status(200).send({
//         "Status_code": 200,
//         "message": "data saved",
//         "person": pdata
//     });
// });


const express = require("express");
const app = express();
const PORT = 3000;

// Middleware to parse incoming JSON requests and URL-encoded bodies
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Array to store person data
const personData = [];

//notified Start the server
app.listen(PORT, () => console.log(`Server started at port number: ${PORT}`));

// POST API endpoint to add a person
app.post("/api/add_person", (req, res) => {
    // Log the received request body
    console.log("result", req.body);

    // Create a new object with person data from the request
    const pdata = {
        "id": personData.length + 1, // Generate unique ID
        "pname": req.body.pname,     // Extract person name from request body
        "pphone": req.body.pphone,   // Extract person phone number from request body
        "pAge": req.body.pAge,       // Extract person age from request body
    };

    // Push the new person data into the personData array
    personData.push(pdata);

    // Log the final result
    console.log("Final RESULT", pdata);

    // Send a response indicating success and the saved person data
    res.status(200).send({
        "Status_code": 200,
        "message": "data saved",
        "person": pdata
    });
});


// GET API data 
app.get("/api/get_person", (req, res) => {
    // Check if there is data available in the 'personData' array
    if (personData.length > 0) {
        // If data is available, send a response with status code 200 and the data
        res.status(200).send({
            "status_code": 200,
            "person": personData,
        });
    } else {
        // If no data is available, send an empty array as the response data
        res.status(200).send({
            "status_code": 200,
            "person": [],
        });
    }
});

// UPDATED API data

// app.post("api/update/:id", (req,res) => {// *1 is used because convet into integer
//     let id = req.params.id*1; // retrive the id for req
//     let personTOBEupdate = personData.find(p=>p.id === id); // check req id is present in person object
//     let index = personData.indexOf(personTOBEupdate);

//     personData[index] = req.body;

//     res.status(200).send({
//         "status_code" : 200,
//         "message" : "uodate the data successfully"
//     })
// })

app.post("/api/update/:id", (req, res) => {
    // Retrieve the id from the request parameters and convert it to an integer
    let id = parseInt(req.params.id);
    
    // Find the person object to be updated based on the id
    let personTOBEupdate = personData.find(p => p.id === id);
    
    // Check if the person object exists
    if (personTOBEupdate) {
        // Get the index of the person object in the personData array
        let index = personData.indexOf(personTOBEupdate);

        // Replace the existing data with the updated data from the request body
        personData[index] = req.body;

        // Send a success response with status code 200 and a message
        res.status(200).send({
            "status_code": 200,
            "message": "Update successful"
        });
    } else {
        // If the person object with the specified id is not found, send a 404 error response
        res.status(404).send({
            "status_code": 404,
            "message": "Person not found"
        });
    }
});

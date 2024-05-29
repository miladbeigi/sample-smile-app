"use strict";

const express = require("express");
const app = new express();
const port = 3001;

/*** APIs ***/

// GET / -> should return { "message": "Hello Smile" } in JSON
app.get("/", (req, res) => {
    res.status(200).json({ message: "Hello Smile" });
    console.log("GET / -> { message: 'Hello Smile' }");
});

// Path not found
app.use((req, res) => {
    res.status(404).json({ message: "Not Found" });
});

// Activate the server
app.listen(port, () => {
    console.log(`Server listening at http://0.0.0.0:${port}`);
});

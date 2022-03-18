const express = require("express");
const app = express();
const port = 3000;

let count = 0;

app.get("/ping", (req, res) => {
  count++;
  res.send(`Pong ${count}`);
  console.log(`Pong ${count}`);
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});

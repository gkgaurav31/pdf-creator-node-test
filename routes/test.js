var express = require('express');

var router = express.Router();

var pdf = require("pdf-creator-node");
var fs = require("fs");
var path = require("path");
var html = fs.readFileSync(path.join(__dirname, "../template.html"), "utf8");

var options = {
    format: "A3",
    orientation: "portrait",
    border: "10mm",
  };
  
const orders = [
{
    order: 1,
    type: "Address",
    address: "Pune, Maharashtra",
},
{
    order: 2,
    type: "item",
    description: "Item 1",
    price: "30",
},
{
    order: 3,
    type: "Address",
    address: "Pune, Maharashtra",
},
];

var document = {
html: html,
data: {
    orders,
},
path: "/home/output.pdf",
type: "", // "stream" || "buffer" || "" ("" defaults to pdf)
};


router.get('/', function(req, res, next) {
    console.log(document);
    pdf
    .create(document, options)
    .then((res) => {
        console.log(res);
    })
    .catch((error) => {
        console.error(error);
    });
    

  res.send('done');
});

module.exports = router;

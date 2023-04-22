const http = require('http');
const colors = require('colors');
const { Image } = require('image-js');
const { executionAsyncResource } = require('async_hooks');
const hostname = '127.0.0.1';
const port = 3000;
const { createCanvas, loadImage } = require('canvas');
const { isContext } = require('vm');
const { fstat } = require('fs');
let fs = require('fs');



const server = http.createServer(function(req, res) {
    fs.readFile('index.html', function(err,data){ 
        res.writeHead(200, {'Content-Type': 'text/html', 'Content-Length':data.length});
        res.write(data);
        res.end();
    });
})




server.listen(port,hostname, () =>{ 
    console.log(`Server running at http://${hostname}:${port}/`);

});

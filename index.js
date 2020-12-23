const http = require("http");
const fs = require("fs");

const host = 'localhost';
const port = 8000;

const baby_pi_page = fs.readFileSync("index.html", 'utf-8');

const requestListener = function (req, res) {
    res.setHeader("Content-Type", "text/html");
    res.writeHead(200);
    res.end(baby_pi_page);
};

const server = http.createServer(requestListener);
server.listen(port, host, () => {
    console.log(`Server running at http://${host}:${port}`);
});
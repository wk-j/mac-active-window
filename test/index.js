"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const lib = require("../index");
let location = lib.findActiveWindow(38111);
let size = lib.findScreenSize();
location.then(rs => {
    console.log(rs.location.x);
    console.log(rs.location.y);
    console.log(rs.location.width);
    console.log(rs.location.height);
});
size.then(rs => {
    console.log(rs);
});
lib.resizeFrontMostWindow(800, 800).then(rs => {
}).catch(err => {
    console.error("+++++++");
    console.error(err);
});
//# sourceMappingURL=index.js.map
"use strict";
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
//# sourceMappingURL=index.js.map
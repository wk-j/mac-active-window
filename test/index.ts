import * as lib from "../index";

let location = lib.findActiveWindow(38111);

location.then(rs => {
    console.log(rs.location.x);
    console.log(rs.location.y);
    console.log(rs.location.width);
    console.log(rs.location.height);
});

location.catch(err => {
    console.error(err);
});

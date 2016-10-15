
import * as child from "child_process";

function spawn() {
    let app = "swift/ActiveWindow/.build/debug/ActiveWindow"
    return new Promise<string>(resolve => {
        child.execFile(app, [ ], function(err, stdout, stderr) { 
            resolve(stdout);
        }); 
    });
}

async function getActiveWindow() {
    let data = await spawn();
    return data;
}
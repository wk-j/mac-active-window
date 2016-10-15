
import * as child from "child_process";
import * as path from "path";

export class Location {
    x: number;
    y: number; 
    width: number;
    height: number;
}

export class Window {
    location: Location;
}

function spawn(pid) {
    let dir = __dirname;
    let app = path.join(dir, `swift/ActiveWindow/.build/debug/ActiveWindow`);
    return new Promise<string>(resolve => {
        child.execFile(app, [ pid ], function(err, stdout, stderr) { 
            if(!err) {
                resolve(stdout);
            }else {
                console.error(err);
                resolve("{}");
            }
        }); 
    });
}

export async function findActiveWindow(pid) {
    let data = await spawn(pid);
    let window = JSON.parse(data) as Window;
    return window;
}
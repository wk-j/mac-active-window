
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

function screenSize() {
    let dir = __dirname;
    let app = path.join(dir, "swift/ScreenSize/.build/debug/ScreenSize");
    return new Promise<string>(resolve => {
        child.execFile(app, [], (err, stdout, stderr) => {
            if(!err) {
                resolve(stdout);
            }else {
                resolve("{}");
            }
        });
    });
}

function resize(w, h) {
    let dir = __dirname;
    let app = path.join(dir, "carbon/resize.bin");
    return new Promise<string>((resolve, error) => {
        child.execFile(app, [w, h], (err, stdout, stderr) => {
            if(!err) {
                resolve(stdout);
            }else {
                error("Can't use accessibility API!");
            }
        });
    });
}

function activeWindow(pid) {
    let dir = __dirname;
    let app = path.join(dir, `swift/ActiveWindow/.build/debug/ActiveWindow`);
    return new Promise<string>(resolve => {
        child.execFile(app, [ pid ], (err, stdout, stderr) => { 
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
    let data = await activeWindow(pid);
    let window = JSON.parse(data) as Window;
    return window;
}

export async function findScreenSize() {
    let data = await screenSize();
    let size = JSON.parse(data) as { width: number, height: number };
    return size;
}

export async function resizeFrontMostWindow(width, height) {
    let data = await resize(width, height);
    return data;
}

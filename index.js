"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator.throw(value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments)).next());
    });
};
const child = require("child_process");
const path = require("path");
class Location {
}
exports.Location = Location;
class Window {
}
exports.Window = Window;
function screenSize() {
    let dir = __dirname;
    let app = path.join(dir, "swift/ScreenSize/.build/debug/ScreenSize");
    return new Promise(resolve => {
        child.execFile(app, [], (err, stdout, stderr) => {
            if (!err) {
                resolve(stdout);
            }
            else {
                resolve("{}");
            }
        });
    });
}
function resize(w, h) {
    let dir = __dirname;
    let app = path.join(dir, "carbon/resize.bin");
    return new Promise((resolve, error) => {
        child.execFile(app, [w, h], (err, stdout, stderr) => {
            if (!err) {
                resolve(stdout);
            }
            else {
                error("Can't use accessibility API!");
            }
        });
    });
}
function activeWindow(pid) {
    let dir = __dirname;
    let app = path.join(dir, `swift/ActiveWindow/.build/debug/ActiveWindow`);
    return new Promise(resolve => {
        child.execFile(app, [pid], (err, stdout, stderr) => {
            if (!err) {
                resolve(stdout);
            }
            else {
                console.error(err);
                resolve("{}");
            }
        });
    });
}
function findActiveWindow(pid) {
    return __awaiter(this, void 0, void 0, function* () {
        let data = yield activeWindow(pid);
        let window = JSON.parse(data);
        return window;
    });
}
exports.findActiveWindow = findActiveWindow;
function findScreenSize() {
    return __awaiter(this, void 0, void 0, function* () {
        let data = yield screenSize();
        let size = JSON.parse(data);
        return size;
    });
}
exports.findScreenSize = findScreenSize;
function resizeFrontMostWindow(width, height) {
    return __awaiter(this, void 0, void 0, function* () {
        let data = yield resize(width, height);
        return data;
    });
}
exports.resizeFrontMostWindow = resizeFrontMostWindow;
//# sourceMappingURL=index.js.map
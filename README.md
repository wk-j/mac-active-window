## Active Window

- [x] Find window location
- [x] Find screen size
- [x] Resize front most window

## Install 

```
npm install --save mac-active-window
```

## Find window location from PID

```javascript
import * as lib from "mac-active-window";

let pid = 38111;
let location = lib.findActiveWindow(pid);

location.then(rs => {
    let winLocation = rs.location;
    console.log(winLocation.x);
    console.log(winLocation.y);
    console.log(winLocation.width);
    console.log(winLocation.height);
});
```

## Find screen size 

```javascript
import * as lib from "mac-active-window";

let size = lib.findScreenSize();
size.then(rs => {
    console.log(rs.width);
    console.log(rs.height);
});

```

## Resize front most window

```javascript
import * as lib from "mac-active-window";

lib.resizeFrontMostWindow(500, 300);
```
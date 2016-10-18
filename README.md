## Active Window

- [x] Find window location
- [x] Find screen size
- [ ] Resize window

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

## Resize window

```javascript
import * as lib from "mac-active-window";

var pid = 11886;
lib.resizeWindow(pid, { width: 500, height: 300 });

```
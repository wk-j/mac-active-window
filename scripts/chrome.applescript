tell application "Google Chrome"
    (*
    set _window to first window where titled is true
    set the bounds of _window to {100, 100, 100, 100}
    *)
        repeat with w in every window
            log (get properties of w)
            --zoomed
            --presenting
            --miniaturized
            --name
            --active tab
            --mode # mode:"normal"
            --miniaturizable
            --class:window
            --closeable
            --resizable
            --visible
            --zoomable
            --id
            --bounds:{0, 22, 1600, 1114}
            --index:2
            --active tab index:1}
        end repeat

         set the bounds of first window to {500 , 500, 100, 100}
end tell
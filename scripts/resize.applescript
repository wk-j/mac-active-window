set theApp to (path to frontmost application as Unicode text)
tell application theApp
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
end tell
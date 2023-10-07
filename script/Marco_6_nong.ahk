; Beta. It can not working correctly
XButton2::
    while GetKeyState("XButton2", "P")  ; Check if XButton2 is being held down
    {
        Click Down  ; Simulate a left-click press
        Sleep 25    ; Sleep for 25ms
        Click Up    ; Simulate a left-click release
        Sleep 25    ; Sleep for 25ms before the next set of left clicks

        Click Down  ; Simulate a left-click press
        Sleep 25    ; Sleep for 25ms
        Click Up    ; Simulate a left-click release
        Sleep 25    ; Sleep for 25ms before the next set of left clicks

        Click Down  ; Simulate a left-click press
        Sleep 25    ; Sleep for 25ms
        Click Up    ; Simulate a left-click release
        Sleep 25    ; Sleep for 25ms before the next set of left clicks
    }
return
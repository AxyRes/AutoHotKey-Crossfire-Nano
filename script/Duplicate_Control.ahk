Ctrl::
{
    Send, ^{Ctrl} ; Simulate double Ctrl press
    Sleep, 20 ; A small delay between presses
    Send, ^{Ctrl} ; Simulate double Ctrl press
	Sleep, 26 ; A small delay between presses
	Send, ^{Ctrl} ; Simulate the third Ctrl press
    Sleep, 23 ; Another small delay
    Send, ^{Ctrl} ; Simulate the fourth Ctrl press
    return
}
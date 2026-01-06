-- All the callbacks for button presses.
-- See https://sdk.play.date/1.9.3/Inside%20Playdate.html#buttonCallbacks for more information

-- Track which buttons are currently held
ButtonState = {
    a = false,
    b = false,
    up = false,
    down = false,
    left = false,
    right = false
}

--
-- A Button
--
function playdate.AButtonDown()
    ButtonState.a = true
    print("A button pressed down.")
end

function playdate.AButtonUp()
    ButtonState.a = false
    print("A button released.")
end

--
-- B Button
--
function playdate.BButtonDown()
    ButtonState.b = true
    print("B button pressed down.")
end

function playdate.BButtonUp()
    ButtonState.b = false
    print("B button released.")
end

--
-- D-pad buttons
--
function playdate.upButtonDown()
    ButtonState.up = true
    print("Up button pressed.")
end

function playdate.upButtonUp()
    ButtonState.up = false
    print("Up button released.")
end

function playdate.downButtonDown()
    ButtonState.down = true
    print("Down button pressed.")
end

function playdate.downButtonUp()
    ButtonState.down = false
    print("Down button released.")
end

function playdate.leftButtonDown()
    ButtonState.left = true
    print("Left button pressed.")
end

function playdate.leftButtonUp()
    ButtonState.left = false
    print("Left button released.")
end

function playdate.rightButtonDown()
    ButtonState.right = true
    print("Right button pressed.")
end

function playdate.rightButtonUp()
    ButtonState.right = false
    print("Right button released.")
end

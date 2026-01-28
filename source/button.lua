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

-- A Button
function playdate.AButtonDown()
    ButtonState.a = true
    return(ButtonState)
end

function playdate.AButtonUp()
    ButtonState.a = false
    return(ButtonState)
end

-- B Button
function playdate.BButtonDown()
    ButtonState.b = true
    return(ButtonState)
end

function playdate.BButtonUp()
    ButtonState.b = false
    return(ButtonState)
end


-- D-pad
function playdate.upButtonDown()
    ButtonState.up = true
    return(ButtonState)
end

function playdate.upButtonUp()
    ButtonState.up = false
    return(ButtonState)
end

function playdate.downButtonDown()
    ButtonState.down = true
    return(ButtonState)
end

function playdate.downButtonUp()
    ButtonState.down = false
    return(ButtonState)
end

function playdate.leftButtonDown()
    ButtonState.left = true
    return(ButtonState)
end

function playdate.leftButtonUp()
    ButtonState.left = false
    return(ButtonState)
end

function playdate.rightButtonDown()
    ButtonState.right = true
    return(ButtonState)
end

function playdate.rightButtonUp()
    ButtonState.right = false
    return(ButtonState)
end

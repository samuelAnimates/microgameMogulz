--[[ Section 1: Overview
Here we include all of the callbacks for button presses.
The functions here depend on ButtonState defined in main.lua
See https://sdk.play.date/1.9.3/Inside%20Playdate.html#buttonCallbacks for more information about them
]]

--[[ Section 2: Initialize Button State
Here we track ButtonState inherited from main.lua
]]

-- Declare local buttonState to work with in this file
local buttonState

-- Initialize our local buttonState to match that in main.lua
function fun_initButtonState(state) -- prefix "fun_" to remind myself in main.lua that this is an imported function 
    buttonState = state
end

--[[ Section 3: Update Button State
Here we update the button state as necessary.
]]

-- Update local A button status to true upon Playdate recognizing it's pressed
function playdate.AButtonDown()
    buttonState.a = true
end

-- Update local A button status to false upon Playdate recognizing it's released
function playdate.AButtonUp()
    buttonState.a = false
end

-- Update local B button status to true upon Playdate recognizing it's pressed
function playdate.BButtonDown()
    buttonState.b = true
end

-- Update local B button status to false upon Playdate recognizing it's released
function playdate.BButtonUp()
    buttonState.b = false
end

-- Update local D-pad Up button status to true upon Playdate recognizing it's pressed
function playdate.upButtonDown()
    buttonState.up = true
end
-- Update local D-pad Up button status to false upon Playdate recognizing it's released
function playdate.upButtonUp()
    buttonState.up = false
end

-- Update local D-pad Down button status to true upon Playdate recognizing it's pressed
function playdate.downButtonDown()
    buttonState.down = true
end

-- Update local D-pad Down button status to false upon Playdate recognizing it's released
function playdate.downButtonUp()
    buttonState.down = false
end

-- Update local D-pad Left button status to true upon Playdate recognizing it's pressed
function playdate.leftButtonDown()
    buttonState.left = true
end

-- Update local D-pad Left button status to false upon Playdate recognizing it's released
function playdate.leftButtonUp()
    buttonState.left = false
end

-- Update local D-pad Right button status to true upon Playdate recognizing it's pressed
function playdate.rightButtonDown()
    buttonState.right = true
end

-- Update local D-pad Right button status to false upon Playdate recognizing it's released
function playdate.rightButtonUp()
    buttonState.right = false
end
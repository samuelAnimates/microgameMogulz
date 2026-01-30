--[[ Section 1: Overview
Here we 
]]

--[[ Section 2: Core Imports
]]

-- Common CoreLibs imports.
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

--[[ Section 2: Initialize important game states
Here we
]]

-- Track which buttons are currently held
local ButtonState = {
    a = false,
    b = false,
    up = false,
    down = false,
    left = false,
    right = false
}

--[[ Section 3: Declare handy variables
Here we
]]
-- Define width and height of all minigame screens, in pixels.
-- This leaves room for a countdown on the left edge of the screen and a faux console frame around all minigames
local minigameScreenWidth = 320
local minigameScreenHeight = 192

-- Define, square edge length defining the grid underlying all minigame visuals, in pixels.
-- I.e all minigames take place on a 20 by 12 grid, where each square is 16 by 16 pixels
local minigameGridSize = 16

gfx = playdate.graphics


--[[ Section 4: Import 
Here we 
]]

-- Import button.lua file with functions to track what buttons are currently pressed.
import "button"
import "crank"
import "lifecycle"

-- Import simulator.lua file with functions only called when the Playdate simulator is in use.
import "simulator"


--[[
-- Define default values of game state, to be updated each frame
GameState = {
   -- Where the player currently is, initialized to title screen
   -- One of: "title", "collection", "cutscene", "practice", "pause"
   cat_current = "collection",
   -- Which collection the player is on (nil if not in a collection)
   -- "01_music", "02_sports", "03_fashion", "04_toys", "05_retro", "06_tech"
   cat_collection = "collection_05_retro",
   -- Which microgame the player is playing
   -- Numerical id (nil if not in a game)
   num_microgameId = 070,
   -- Which level in a collection or practice the player is on (nil if not in either)
   num_level = 1,

   -- Pause menu navigation
   pauseMenu = {
      -- Which pause screen the 
      -- Either "root" or "accessibility"
      cat_screen = "root",
      highlighted = 1,   -- which option is highlighted (1, 2, 3, etc.)
      -- What screen we came from (so pause knows where to return)
      pausedFrom = nil,  -- "collection", "practice" 
   }
    
}


AccessibilitySettings = {
    crankControls = true,
    accelerometerControls = true,
    slowMode = false
}


-- Lookup table for minigame collections
local collections = {
    collection_01_music = {
        minigameCount = 16,
        path = "collections/01_music"
    },
    collection_02_sports = {
        minigameCount = 16,
        path = "collections/02_sports"
    },
    collection_03_fashion = {
        minigameCount = 16,
        path = "collections/03_fashion"
    },
    collection_04_toy = {
        minigameCount = 16,
        path = "collections/04_toy"
    },
    collection_05_retro = {
        minigameCount = 16,
        path = "collections/05_retro"
    },
    collection_06_tech = {
        minigameCount = 16,
        path = "collections/06_tech"
    }
}


-- Menu option indices for reference
PauseMenuOptions = {
    root = {
        "Accessibility",
        "Return to Title Screen",
        "Give Up"
    },
    accessibility = {
        "Crank Controls",
        "Accelerometer Controls",
        "Slow Game Speed",
        "Back"
    }
}
]]


print(playdate.metadata.name .. " launched!")

--[[ Section 4: Global variables
Here we define truly global variables we should not change.
They define the space that minigames take up on screen.
]]



--[[ Section 5: Main game loop

]]

gfx.setBackgroundColor(gfx.kColorWhite)

-- Num variable to track which frame in a microgame we're on.
-- Set to 0 outside of a micrograme. Max value will ge 240
num_currentFrame = 0



function loadCollection(collectionId)
    gameState.currentCollection = {
        id = collectionId,
        path = "collections/" .. collectionId,
        minigames = {},
    }
    
    -- Load all minigames in the collection dynamically
    local files = playdate.file.listFiles(gameState.currentCollection.path)
    
    for _, filename in ipairs(files) do
        if filename:match("%.lua$") then
            local modulePath = gameState.currentCollection.path .. "/" .. filename:gsub("%.lua$", "")
            local minigameModule = require(modulePath)
            if minigameModule then
                table.insert(gameState.currentCollection.minigames, minigameModule)
            end
        end
    end
    
    selectRandomMinigame()
end

function selectRandomMinigame()
    local randomIndex = math.random(#gameState.currentCollection.minigames)
    gameState.currentMinigame = gameState.currentCollection.minigames[randomIndex]
    gameState.currentMinigame.init()
    gameState.is_win = nil
end


import "collections/05_retro/minigame_065_snake"

-- This is our core game loop, which the Playdate OS calls once per frame, defaulted to 30 fps in this project.
function playdate.update()

    -- Pass ButtonState to the initButtonState function from button.lua
    fun_initButtonState(ButtonState)

    -- Snake Game function hard-coded
    fun_snakeUpdate(ButtonState)

end

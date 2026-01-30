local x = 40
local y = 40
local updates = 0

function fun_snakeUpdate(buttonState)
    if updates < 300 then
        updates += 1
        
        if buttonState.up then y -= 2 end
        if buttonState.down then y += 2 end
        if buttonState.left then x -= 2 end
        if buttonState.right then x += 2 end
        
        gfx.clear()
        gfx.drawText("Hello, Playdate!", x, y)
        gfx.drawText("Updates: " .. updates, 40, 60)
    else
        gfx.clear()
        gfx.drawText("All done!", 40, 40)
    end
end
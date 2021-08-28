--[[
    PauseState Class

    The PauseState lets the player briefly pause the game. Required behaviour
    from CS50 Assignment 1:

    1. When they pause the game, a simple sound effect should play
    2. At the same time this sound effect plays, the music should pause
    3. When the user presses P again, the gameplay and the music should resume
    4. Display a pause icon in the middle of the screen.
]]

PauseState = Class{__includes = BaseState}

local pause_icon = love.graphics.newImage('pause.png')

function PauseState:update(dt)
    -- resume play if P is pressed
    if love.keyboard.wasPressed('p') then
        gStateMachine:change('play', gLastPlayState)
    end
end

function PauseState:render()
    love.graphics.draw(pause_icon, VIRTUAL_WIDTH / 2 - pause_icon:getWidth() / 2, 60)

    love.graphics.setFont(mediumFont)
    love.graphics.printf('(Press "P" to resume)', 0, 120, VIRTUAL_WIDTH, 'center')
end

--[[
    Called when this state is transitioned to from another state.
]]
function PauseState:enter()
    sounds['pause']:play()
    sounds['music']:pause()
    scrolling = false
end

--[[
    Called when this state is transitioning to another state.
]]
function PauseState:exit()
    sounds['pause']:play()
    sounds['music']:play()
    scrolling = true 
end

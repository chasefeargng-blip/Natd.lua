-- Main toggle button to open/close GUI
local toggleBtn = Instance.new("TextButton")
toggleBtn.Parent = game.CoreGui
toggleBtn.Position = UDim2.new(0, 10, 0, 10)
toggleBtn.Size = UDim2.new(0, 100, 0, 50)
toggleBtn.Text = "Open GUI"
toggleBtn.BackgroundColor3 = Color3.new(0, 0.5, 1)

local guiEnabled = false

toggleBtn.MouseButton1Click:Connect(function()
    guiEnabled = not guiEnabled
    mainGui.Enabled = guiEnabled
    toggleBtn.Text = guiEnabled and "Close GUI" or "Open GUI"
end)

-- Main GUI setup
local mainGui = Instance.new("ScreenGui")
mainGui.Name = "NatSemiTPGui"
mainGui.Enabled = false
mainGui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Position = UDim2.new(0.5, -150, 0.5, -200)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.Parent = mainGui

-- Draggable support
local dragging = false
local dragInput, dragStart, startPos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        frame.Position = startPos + UDim2.new(0, delta.X, 0, delta.Y)
    end
end)

-- Title bar with Minimize and Close buttons
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
titleBar.Parent = frame

local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "Nat Semi TP"
titleLabel.Size = UDim2.new(1, -60, 1, 0)
titleLabel.Position = UDim2.new(0, 60, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Parent = titleBar

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Text = "-"
minimizeBtn.Size = UDim2.new(0, 30, 1, 0)
minimizeBtn.Position = UDim2.new(1, -60, 0, 0)
minimizeBtn.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
minimizeBtn.Parent = titleBar

local closeBtn = Instance.new("TextButton")
closeBtn.Text = "X"
closeBtn.Size = UDim2.new(0, 30, 1, 0)
closeBtn.Position = UDim2.new(1, -30, 0, 0)
closeBtn.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)
closeBtn.Parent = titleBar

local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 1, -30)
contentFrame.Position = UDim2.new(0, 0, 0, 30)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = frame

local isMinimized = false

minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    contentFrame.Visible = not isMinimized
end)

closeBtn.MouseButton1Click:Connect(function()
    mainGui.Enabled = false
    toggleBtn.Text = "Open GUI"
end)

-- Enter Hub Button
local enterHubBtn = Instance.new("TextButton")
enterHubBtn.Size = UDim2.new(0, 200, 0, 50)
enterHubBtn.Position = UDim2.new(0, 50, 0, 20)
enterHubBtn.Text = "Enter Hub"
enterHubBtn.BackgroundColor3 = Color3.new(0, 0.5, 1)
enterHubBtn.Parent = contentFrame

-- Container for speed buttons
local speedContainer = Instance.new("Frame")
speedContainer.Size = UDim2.new(1, -20, 0, 200)
speedContainer.Position = UDim2.new(0, 10, 0, 80)
speedContainer.BackgroundTransparency = 1
speedContainer.Parent = contentFrame
speedContainer.Visible = false

-- Show speed options on Enter Hub click
enterHubBtn.MouseButton1Click:Connect(function()
    speedContainer.Visible = true
end)

-- Speed Mode Buttons
local function createSpeedButton(text, speed)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 50)
    btn.Position = UDim2.new(0, 10, 0, 10 + (#speedContainer:GetChildren() - 1) * 60)
    btn.Text = text
    btn.BackgroundColor3 = Color3.new(0, 1, 0)
    btn.Parent = speedContainer

    btn.MouseButton1Click:Connect(function()
        _0xSpeed = speed
        _0xToggleSpeed(true)
    end)
end

-- Speed control variables
local _0x1a2b3c = game:GetService("RunService")
local _0x4d5e6f = game.Players.LocalPlayer
local _0xSpeed = 16
local _0xActive = false

local function _0xSetSpeed(v)
    local chr = _0x4d5e6f.Character
    if chr then
        local hum = chr:FindFirstChild("Humanoid")
        if hum then hum.WalkSpeed = v end
    end
end

local function _0xToggleSpeed(state)
    _0xActive = state
    if state then
        _0xSetSpeed(_0xSpeed)
    else
        _0xSetSpeed(16)
    end
end

-- Create speed buttons
createSpeedButton("Speed Boost (29)", 29)
createSpeedButton("Giant Potion (34)", 34)

-- Reset button
local resetBtn = Instance.new("TextButton")
resetBtn.Size = UDim2.new(0, 200, 0, 50)
resetBtn.Position = UDim2.new(0, 50, 0, 200)
resetBtn.Text = "Reset (16)"
resetBtn.BackgroundColor3 = Color3.new(1, 0, 0)
resetBtn.Parent = contentFrame

resetBtn.MouseButton1Click:Connect(function()
    _0xSpeed = 16
    _0xToggleSpeed(false)
end)

-- Keep speed consistent
game:GetService("RunService").Heartbeat:Connect(function()
    if _0xActive then
        _0xSetSpeed(_0xSpeed)
    end
end)

-- Reapply speed on respawn
_0x4d5e6f.CharacterAdded:Connect(function()
    if _0xActive then
        _0xSetSpeed(_0xSpeed)
    end
end)

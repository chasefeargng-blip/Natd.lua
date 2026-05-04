-- ============================================
-- NAT SEMI TP - FIXED & DRAGGABLE
-- ============================================

local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local runService = game:GetService("RunService")

-- Speed systeem
local speedLock = false
local speedVal = 16

local function setSpeed(v)
    local chr = player.Character
    if chr then
        local hum = chr:FindFirstChild("Humanoid")
        if hum then hum.WalkSpeed = v end
    end
end

runService.Heartbeat:Connect(function()
    if speedLock then setSpeed(speedVal) end
end)

local function boost(v)
    speedVal = v
    speedLock = true
    setSpeed(v)
end

local function resetSpeed()
    speedLock = false
    speedVal = 16
    setSpeed(16)
end

local function fastRespawn()
    if player.Character then
        player.Character:BreakJoints()
    end
end

-- GUI Setup
local gui = Instance.new("ScreenGui")
gui.Name = "NatSemiHub"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false
gui.DisplayOrder = 999

local bg = Color3.fromRGB(15,15,22)
local grn = Color3.fromRGB(0,255,170)
local pur = Color3.fromRGB(140,90,255)
local wht = Color3.fromRGB(255,255,255)
local red = Color3.fromRGB(255,55,65)
local blu = Color3.fromRGB(88,101,242)
local pnk = Color3.fromRGB(255,100,180)

-- Sleep-functie (zorgt dat je de frames kunt verplaatsen)
local function makeDraggable(frame)
    local dragging, dragInput, dragStart, startPos
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

-- Start Frame (sf)
local sf = Instance.new("Frame")
sf.Size = UDim2.new(0,300,0,160)
sf.Position = UDim2.new(0.5,-150,0.5,-80)
sf.BackgroundColor3 = bg
sf.BorderSizePixel = 0
sf.Parent = gui
Instance.new("UICorner",sf).CornerRadius = UDim.new(0,8)
makeDraggable(sf)

local sfTitle = Instance.new("TextLabel")
sfTitle.Size = UDim2.new(1,0,0,40)
sfTitle.Text = "NAT SEMI TP"
sfTitle.TextColor3 = wht
sfTitle.BackgroundTransparency = 1
sfTitle.Font = Enum.Font.GothamBlack
sfTitle.TextSize = 18
sfTitle.Parent = sf

local dcBtn = Instance.new("TextButton")
dcBtn.Size = UDim2.new(0.85,0,0,30)
dcBtn.Position = UDim2.new(0.075,0,0.35)
dcBtn.Text = "COPY DISCORD LINK"
dcBtn.BackgroundColor3 = blu
dcBtn.TextColor3 = wht
dcBtn.Font = Enum.Font.GothamBold
dcBtn.TextSize = 11
dcBtn.Parent = sf
Instance.new("UICorner",dcBtn).CornerRadius = UDim.new(0,6)

dcBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/4cXDtZ2J4")
    dcBtn.Text = "COPIED!"
    task.wait(1.5)
    dcBtn.Text = "COPY DISCORD LINK"
end)

local enterBtn = Instance.new("TextButton")
enterBtn.Size = UDim2.new(0.85,0,0,40)
enterBtn.Position = UDim2.new(0.075,0,0.62)
enterBtn.Text = "ENTER HUB"
enterBtn.BackgroundColor3 = grn
enterBtn.TextColor3 = Color3.fromRGB(0,0,0)
enterBtn.Font = Enum.Font.GothamBlack
enterBtn.TextSize = 15
enterBtn.Parent = sf
Instance.new("UICorner",enterBtn).CornerRadius = UDim.new(0,7)

-- Main Hub Frame
local main = Instance.new("Frame")
main.Size = UDim2.new(0,300,0,240)
main.Position = UDim2.new(0.5,-150,0.5,-120)
main.BackgroundColor3 = bg
main.BorderSizePixel = 0
main.Visible = false
main.Parent = gui
Instance.new("UICorner",main).CornerRadius = UDim.new(0,8)
makeDraggable(main)

-- Knoppen voor Main Hub
local function createMainBtn(text, color, pos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.85,0,0,36)
    btn.Position = pos
    btn.Text = text
    btn.BackgroundColor3 = color
    btn.TextColor3 = (color == wht or color == grn) and Color3.new(0,0,0) or wht
    btn.Font = Enum.Font.GothamBlack
    btn.TextSize = 13
    btn.Parent = main
    Instance.new("UICorner",btn).CornerRadius = UDim.new(0,7)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

createMainBtn("SPEED BOOST (29)", grn, UDim2.new(0.075,0,0.15), function() boost(29) end)
createMainBtn("GIANT SPEED (34)", pur, UDim2.new(0.075,0,0.35), function() boost(34) end)
createMainBtn("RESET SPEED (16)", red, UDim2.new(0.075,0,0.55), function() resetSpeed() end)
createMainBtn("FAST RESPAWN", pnk, UDim2.new(0.075,0,0.75), function() fastRespawn() end)

-- DE FIX: Enter knop logica
enterBtn.MouseButton1Click:Connect(function()
    sf.Visible = false
    main.Visible = true
    print("Hub geopend!")
end)

print("NAT SEMI TP Geladen - Klik op Enter Hub")

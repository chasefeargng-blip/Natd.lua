-- ============================================
-- NAT SEMI TP - SIMPLE & WORKING
-- Speed: 29 | Giant: 34 | Reset: 16 | Respawn
-- Heartbeat bypass actief
-- Discord: discord.gg/4cXDtZ2J4 (copy button)
-- ============================================

local player = game.Players.LocalPlayer

-- Speed systeem met Heartbeat bypass
local speedLock = false
local speedVal = 16

local function setSpeed(v)
    local chr = player.Character
    if chr then
        local hum = chr:FindFirstChild("Humanoid")
        if hum then hum.WalkSpeed = v end
    end
end

game:GetService("RunService").Heartbeat:Connect(function()
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

player.CharacterAdded:Connect(function(chr)
    local hum = chr:WaitForChild("Humanoid")
    if speedLock then hum.WalkSpeed = speedVal end
end)

local function fastRespawn()
    spawn(function()
        pcall(function() if player.Character then player.Character:BreakJoints() end end)
        wait(0.5)
        pcall(function()
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.Health = 0
            end
        end)
    end)
end

-- GUI
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

local bg = Color3.fromRGB(15,15,22)
local grn = Color3.fromRGB(0,255,170)
local pur = Color3.fromRGB(140,90,255)
local wht = Color3.fromRGB(255,255,255)
local red = Color3.fromRGB(255,55,65)
local blu = Color3.fromRGB(88,101,242)
local pnk = Color3.fromRGB(255,100,180)

-- Start Frame
local sf = Instance.new("Frame")
sf.Size = UDim2.new(0,300,0,160)
sf.Position = UDim2.new(0.5,-150,0.5,-80)
sf.BackgroundColor3 = bg
sf.Parent = gui

local sfTitle = Instance.new("TextLabel")
sfTitle.Size = UDim2.new(1,-20,0,36)
sfTitle.Position = UDim2.new(0,10,0,8)
sfTitle.Text = "NAT SEMI TP"
sfTitle.TextColor3 = wht
sfTitle.BackgroundTransparency = 1
sfTitle.Font = Enum.Font.GothamBlack
sfTitle.TextSize = 18
sfTitle.Parent = sf

local dcLabel = Instance.new("TextLabel")
dcLabel.Size = UDim2.new(1,-20,0,18)
dcLabel.Position = UDim2.new(0,10,0,50)
dcLabel.Text = "Join Discord for key:"
dcLabel.TextColor3 = Color3.fromRGB(160,160,160)
dcLabel.BackgroundTransparency = 1
dcLabel.Font = Enum.Font.SourceSans
dcLabel.TextSize = 12
dcLabel.Parent = sf

local dcBtn = Instance.new("TextButton")
dcBtn.Size = UDim2.new(0.85,0,0,28)
dcBtn.Position = UDim2.new(0.075,0,0.42)
dcBtn.Text = "COPY DISCORD LINK"
dcBtn.BackgroundColor3 = blu
dcBtn.TextColor3 = wht
dcBtn.Font = Enum.Font.GothamBold
dcBtn.TextSize = 11
dcBtn.Parent = sf
Instance.new("UICorner",dcBtn).CornerRadius = UDim.new(0,6)
dcBtn.MouseButton1Click:Connect(function()
    pcall(function() setclipboard("https://discord.gg/4cXDtZ2J4") end)
    dcBtn.Text = "COPIED!"
    wait(1.5)
    dcBtn.Text = "COPY DISCORD LINK"
end)

local enterBtn = Instance.new("TextButton")
enterBtn.Size = UDim2.new(0.85,0,0,36)
enterBtn.Position = UDim2.new(0.075,0,0.65)
enterBtn.Text = "ENTER HUB"
enterBtn.BackgroundColor3 = grn
enterBtn.TextColor3 = Color3.fromRGB(0,0,0)
enterBtn.Font = Enum.Font.GothamBlack
enterBtn.TextSize = 14
enterBtn.Parent = sf
Instance.new("UICorner",enterBtn).CornerRadius = UDim.new(0,7)

-- Main Hub Frame (direct onder start frame zelfde grootte)
local main = Instance.new("Frame")
main.Size = UDim2.new(0,300,0,220)
main.Position = UDim2.new(0.5,-150,0.5,-110)
main.BackgroundColor3 = bg
main.Visible = false
main.Parent = gui

local mainTitle = Instance.new("TextLabel")
mainTitle.Size = UDim2.new(1,-20,0,36)
mainTitle.Position = UDim2.new(0,10,0,8)
mainTitle.Text = "SPEED BOOST"
mainTitle.TextColor3 = wht
mainTitle.BackgroundTransparency = 1
mainTitle.Font = Enum.Font.GothamBlack
mainTitle.TextSize = 16
mainTitle.Parent = main

local spdBtn = Instance.new("TextButton")
spdBtn.Size = UDim2.new(0.85,0,0,34)
spdBtn.Position = UDim2.new(0.075,0,0.22)
spdBtn.Text = "SPEED BOOST (29)"
spdBtn.BackgroundColor3 = grn
spdBtn.TextColor3 = Color3.fromRGB(0,0,0)
spdBtn.Font = Enum.Font.GothamBlack
spdBtn.TextSize = 13
spdBtn.Parent = main
Instance.new("UICorner",spdBtn).CornerRadius = UDim.new(0,7)
spdBtn.MouseButton1Click:Connect(function() boost(29) end)

local giantBtn = Instance.new("TextButton")
giantBtn.Size = UDim2.new(0.85,0,0,34)
giantBtn.Position = UDim2.new(0.075,0,0.38)
giantBtn.Text = "GIANT SPEED (34)"
giantBtn.BackgroundColor3 = pur
giantBtn.TextColor3 = wht
giantBtn.Font = Enum.Font.GothamBlack
giantBtn.TextSize = 13
giantBtn.Parent = main
Instance.new("UICorner",giantBtn).CornerRadius = UDim.new(0,7)
giantBtn.MouseButton1Click:Connect(function() boost(34) end)

local resetBtn = Instance.new("TextButton")
resetBtn.Size = UDim2.new(0.85,0,0,34)
resetBtn.Position = UDim2.new(0.075,0,0.54)
resetBtn.Text = "RESET SPEED (16)"
resetBtn.BackgroundColor3 = red
resetBtn.TextColor3 = wht
resetBtn.Font = Enum.Font.GothamBlack
resetBtn.TextSize = 13
resetBtn.Parent = main
Instance.new("UICorner",resetBtn).CornerRadius = UDim.new(0,7)
resetBtn.MouseButton1Click:Connect(function() resetSpeed() end)

local rspBtn = Instance.new("TextButton")
rspBtn.Size = UDim2.new(0.85,0,0,34)
rspBtn.Position = UDim2.new(0.075,0,0.72)
rspBtn.Text = "FAST RESPAWN (0.5s)"
rspBtn.BackgroundColor3 = pnk
rspBtn.TextColor3 = wht
rspBtn.Font = Enum.Font.GothamBlack
rspBtn.TextSize = 13
rspBtn.Parent = main
Instance.new("UICorner",rspBtn).CornerRadius = UDim.new(0,7)
rspBtn.MouseButton1Click:Connect(function() fastRespawn() end)

-- Enter knop actie
enterBtn.MouseButton1Click:Connect(function()
    sf.Visible = false
    main.Visible = true
    print("Entered hub")
end)

print("NAT SEMI TP - Simple loaded.")

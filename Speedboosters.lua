-- ============================================
-- NAT SEMI TP - SPEED BOOST + RESPAWN + SPEED LOCK
-- Discord: discord.gg/4cXDtZ2J4
-- N toggles GUI | Minimize | Copy Discord
-- ============================================

local player = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")

-- Speed functie
local function setSpeed(v)
    local char = player.Character
    if char then
        local hum = char:FindFirstChild("Humanoid")
        if hum then
            hum.WalkSpeed = v
        end
    end
end

-- Speed locker bypass
local speedLocked = false
local lockedSpeed = 16

spawn(function()
    while true do
        if speedLocked then
            setSpeed(lockedSpeed)
        end
        wait(0.1)
    end
end)

local function applySpeed(v)
    lockedSpeed = v
    speedLocked = true
    setSpeed(v)
end

local function resetSpeed()
    speedLocked = false
    lockedSpeed = 16
    setSpeed(16)
end

-- Auto respawn speed reset
player.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid")
    if speedLocked then
        hum.WalkSpeed = lockedSpeed
    end
end)

-- Fast respawn
local function fastRespawn()
    spawn(function()
        pcall(function()
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character:BreakJoints()
            end
        end)
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
gui.Name = "NatSemiTP"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local bg = Color3.fromRGB(15, 15, 22)
local accent = Color3.fromRGB(0, 255, 170)
local accent2 = Color3.fromRGB(140, 90, 255)
local white = Color3.fromRGB(255, 255, 255)
local dark = Color3.fromRGB(22, 22, 32)
local gray = Color3.fromRGB(130, 130, 145)
local red = Color3.fromRGB(255, 55, 65)
local blue = Color3.fromRGB(88, 101, 242)
local orange = Color3.fromRGB(255, 170, 0)
local pink = Color3.fromRGB(255, 100, 180)

-- ===== D4 MINIMIZE ICON =====
local d4 = Instance.new("TextButton")
d4.Size = UDim2.new(0, 44, 0, 44)
d4.Position = UDim2.new(0.02, 0, 0.02, 0)
d4.Text = "NAT"
d4.BackgroundColor3 = accent
d4.TextColor3 = Color3.fromRGB(0, 0, 0)
d4.Font = Enum.Font.GothamBlack
d4.TextSize = 10
d4.BorderSizePixel = 0
d4.Visible = false
d4.ZIndex = 10
d4.Parent = gui
Instance.new("UICorner", d4).CornerRadius = UDim.new(1, 0)

local drag, moved, sPos, sFrame = false, false, nil, nil
d4.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        drag, moved, sPos, sFrame = true, false, i.Position, d4.Position
    end
end)
d4.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        drag = false
        if not moved then
            sf.Visible = true
            main.Visible = true
        end
    end
end)
uis.InputChanged:Connect(function(i)
    if drag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
        local d = i.Position - sPos
        if math.abs(d.X) > 2 or math.abs(d.Y) > 2 then moved = true end
        d4.Position = UDim2.new(sFrame.X.Scale, sFrame.X.Offset + d.X, sFrame.Y.Scale, sFrame.Y.Offset + d.Y)
    end
end)

-- ===== N TOGGLE =====
local guiVisible = true
uis.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.N then
        guiVisible = not guiVisible
        sf.Visible = guiVisible
        main.Visible = guiVisible
        d4.Visible = not guiVisible
    end
end)

-- ===== START FRAME =====
local sf = Instance.new("Frame")
sf.Size = UDim2.new(0, 350, 0, 260)
sf.Position = UDim2.new(0.5, -175, 0.5, -130)
sf.BackgroundColor3 = bg
sf.BorderSizePixel = 0
sf.Active = true
sf.Draggable = true
sf.Visible = true
sf.Parent = gui
Instance.new("UICorner", sf).CornerRadius = UDim.new(0, 14)

local sfs = Instance.new("UIStroke")
sfs.Color = accent
sfs.Thickness = 1.5
sfs.Transparency = 0.4
sfs.Parent = sf

local sh = Instance.new("Frame")
sh.Size = UDim2.new(1, 0, 0, 50)
sh.BackgroundColor3 = Color3.fromRGB(10, 10, 16)
sh.BorderSizePixel = 0
sh.Parent = sf
Instance.new("UICorner", sh).CornerRadius = UDim.new(0, 14)

local st = Instance.new("TextLabel")
st.Size = UDim2.new(1, -80, 0, 50)
st.Position = UDim2.new(0, 15, 0, 0)
st.Text = "NAT SEMI TP"
st.TextColor3 = white
st.BackgroundTransparency = 1
st.Font = Enum.Font.GothamBlack
st.TextSize = 18
st.Parent = sf

-- Minimize
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 26, 0, 26)
minBtn.Position = UDim2.new(1, -62, 0, 12)
minBtn.Text = "_"
minBtn.BackgroundColor3 = orange
minBtn.TextColor3 = white
minBtn.Font = Enum.Font.GothamBlack
minBtn.TextSize = 16
minBtn.BorderSizePixel = 0
minBtn.AutoButtonColor = false
minBtn.Parent = sf
Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 6)

-- Close
local cb = Instance.new("TextButton")
cb.Size = UDim2.new(0, 26, 0, 26)
cb.Position = UDim2.new(1, -34, 0, 12)
cb.Text = "X"
cb.BackgroundColor3 = red
cb.TextColor3 = white
cb.Font = Enum.Font.GothamBold
cb.TextSize = 14
cb.BorderSizePixel = 0
cb.AutoButtonColor = false
cb.Parent = sf
Instance.new("UICorner", cb).CornerRadius = UDim.new(0, 6)
cb.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Discord label
local dcLabel = Instance.new("TextLabel")
dcLabel.Size = UDim2.new(1, -20, 0, 20)
dcLabel.Position = UDim2.new(0, 10, 0, 0.22)
dcLabel.Text = "Join Discord for updates:"
dcLabel.TextColor3 = gray
dcLabel.BackgroundTransparency = 1
dcLabel.Font = Enum.Font.SourceSans
dcLabel.TextSize = 12
dcLabel.Parent = sf

local dcLink = Instance.new("TextLabel")
dcLink.Size = UDim2.new(1, -20, 0, 24)
dcLink.Position = UDim2.new(0, 10, 0, 0.31)
dcLink.Text = "discord.gg/4cXDtZ2J4"
dcLink.TextColor3 = blue
dcLink.BackgroundTransparency = 1
dcLink.Font = Enum.Font.SourceSansBold
dcLink.TextSize = 13
dcLink.Parent = sf

-- Copy Discord button
local copyBtn = Instance.new("TextButton")
copyBtn.Size = UDim2.new(0.85, 0, 0, 30)
copyBtn.Position = UDim2.new(0.075, 0, 0.42)
copyBtn.Text = "COPY DISCORD LINK"
copyBtn.BackgroundColor3 = blue
copyBtn.TextColor3 = white
copyBtn.Font = Enum.Font.GothamBold
copyBtn.TextSize = 11
copyBtn.BorderSizePixel = 0
copyBtn.Parent = sf
Instance.new("UICorner", copyBtn).CornerRadius = UDim.new(0, 7)
copyBtn.MouseButton1Click:Connect(function()
    pcall(function() setclipboard("https://discord.gg/4cXDtZ2J4") end)
    copyBtn.Text = "COPIED!"
    wait(1.5)
    copyBtn.Text = "COPY DISCORD LINK"
end)

-- Enter button
local enterBtn = Instance.new("TextButton")
enterBtn.Size = UDim2.new(0.85, 0, 0, 34)
enterBtn.Position = UDim2.new(0.075, 0, 0.55)
enterBtn.Text = "ENTER HUB"
enterBtn.BackgroundColor3 = accent
enterBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
enterBtn.Font = Enum.Font.GothamBlack
enterBtn.TextSize = 13
enterBtn.BorderSizePixel = 0
enterBtn.Parent = sf
Instance.new("UICorner", enterBtn).CornerRadius = UDim.new(0, 7)

-- Respawn button
local respawnBtn = Instance.new("TextButton")
respawnBtn.Size = UDim2.new(0.85, 0, 0, 34)
respawnBtn.Position = UDim2.new(0.075, 0, 0.69)
respawnBtn.Text = "FAST RESPAWN (0.5s)"
respawnBtn.BackgroundColor3 = pink
respawnBtn.TextColor3 = white
respawnBtn.Font = Enum.Font.GothamBold
respawnBtn.TextSize = 12
respawnBtn.BorderSizePixel = 0
respawnBtn.Parent = sf
Instance.new("UICorner", respawnBtn).CornerRadius = UDim.new(0, 7)
respawnBtn.MouseButton1Click:Connect(function() fastRespawn() end)

-- ===== MAIN FRAME =====
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 350, 0, 180)
main.Position = UDim2.new(0.5, -175, 0.5, -90)
main.BackgroundColor3 = bg
main.BorderSizePixel = 0
main.Visible = false
main.Active = true
main.Draggable = true
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)

local ms = Instance.new("UIStroke")
ms.Color = accent
ms.Thickness = 1.5
ms.Transparency = 0.4
ms.Parent = main

local mh = Instance.new("Frame")
mh.Size = UDim2.new(1, 0, 0, 50)
mh.BackgroundColor3 = Color3.fromRGB(10, 10, 16)
mh.Parent = main
Instance.new("UICorner", mh).CornerRadius = UDim.new(0, 14)

local mt = Instance.new("TextLabel")
mt.Size = UDim2.new(1, -40, 0, 50)
mt.Position = UDim2.new(0, 15, 0, 0)
mt.Text = "SPEED BOOST"
mt.TextColor3 = white
mt.BackgroundTransparency = 1
mt.Font = Enum.Font.GothamBlack
mt.TextSize = 16
mt.Parent = main

-- Minimize main
local minBtn2 = Instance.new("TextButton")
minBtn2.Size = UDim2.new(0, 26, 0, 26)
minBtn2.Position = UDim2.new(1, -62, 0, 12)
minBtn2.Text = "_"
minBtn2.BackgroundColor3 = orange
minBtn2.TextColor3 = white
minBtn2.Font = Enum.Font.GothamBlack
minBtn2.TextSize = 16
minBtn2.BorderSizePixel = 0
minBtn2.AutoButtonColor = false
minBtn2.Parent = main
Instance.new("UICorner", minBtn2).CornerRadius = UDim.new(0, 6)

local cb2 = Instance.new("TextButton")
cb2.Size = UDim2.new(0, 26, 0, 26)
cb2.Position = UDim2.new(1, -34, 0, 12)
cb2.Text = "X"
cb2.BackgroundColor3 = red
cb2.TextColor3 = white
cb2.Font = Enum.Font.GothamBold
cb2.TextSize = 14
cb2.BorderSizePixel = 0
cb2.AutoButtonColor = false
cb2.Parent = main
Instance.new("UICorner", cb2).CornerRadius = UDim.new(0, 6)
cb2.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Enter actie
enterBtn.MouseButton1Click:Connect(function()
    sf.Visible = false
    main.Visible = true
end)

-- Minimize acties
minBtn.MouseButton1Click:Connect(function()
    sf.Visible = false
    main.Visible = false
    d4.Visible = true
end)

minBtn2.MouseButton1Click:Connect(function()
    sf.Visible = false
    main.Visible = false
    d4.Visible = true
end)

-- Speed Boost (29)
local sp = Instance.new("TextButton")
sp.Size = UDim2.new(0.85, 0, 0, 36)
sp.Position = UDim2.new(0.075, 0, 0.3)
sp.Text = "SPEED BOOST (29)"
sp.BackgroundColor3 = accent
sp.TextColor3 = Color3.fromRGB(0, 0, 0)
sp.Font = Enum.Font.GothamBlack
sp.TextSize = 13
sp.BorderSizePixel = 0
sp.Parent = main
Instance.new("UICorner", sp).CornerRadius = UDim.new(0, 8)
sp.MouseButton1Click:Connect(function() applySpeed(29) end)

-- Giant Speed (34)
local gp = Instance.new("TextButton")
gp.Size = UDim2.new(0.85, 0, 0, 36)
gp.Position = UDim2.new(0.075, 0, 0.5)
gp.Text = "GIANT SPEED (34)"
gp.BackgroundColor3 = accent2
gp.TextColor3 = white
gp.Font = Enum.Font.GothamBlack
gp.TextSize = 13
gp.BorderSizePixel = 0
gp.Parent = main
Instance.new("UICorner", gp).CornerRadius = UDim.new(0, 8)
gp.MouseButton1Click:Connect(function() applySpeed(34) end)

-- Reset (16)
local rp = Instance.new("TextButton")
rp.Size = UDim2.new(0.85, 0, 0, 36)
rp.Position = UDim2.new(0.075, 0, 0.7)
rp.Text = "RESET SPEED (16)"
rp.BackgroundColor3 = red
rp.TextColor3 = white
rp.Font = Enum.Font.GothamBlack
rp.TextSize = 13
rp.BorderSizePixel = 0
rp.Parent = main
Instance.new("UICorner", rp).CornerRadius = UDim.new(0, 8)
rp.MouseButton1Click:Connect(function() resetSpeed() end)

print("NAT SEMI TP Loaded!")

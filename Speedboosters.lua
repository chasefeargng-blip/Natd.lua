-- ============================================
-- NAT SEMI TP - v3.0 LOCKED & LOADED
-- Speed bypass | Lock icon | Clean layout
-- Discord: discord.gg/4cXDtZ2J4
-- ============================================

local player = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")

-- ===== SPEED SYSTEM (Heartbeat bypass) =====
local activeSpeed = 16
local speedLock = false

local function setSpeed(v)
    local c = player.Character
    if c then
        local h = c:FindFirstChild("Humanoid")
        if h then h.WalkSpeed = v end
    end
end

-- Forceer elke frame (Heartbeat) voor anti-speed bypass
game:GetService("RunService").Heartbeat:Connect(function()
    if speedLock then setSpeed(activeSpeed) end
end)

local function boost(v)
    activeSpeed = v
    speedLock = true
    setSpeed(v)
end

local function resetSpd()
    speedLock = false
    activeSpeed = 16
    setSpeed(16)
end

player.CharacterAdded:Connect(function(c)
    local h = c:WaitForChild("Humanoid")
    if speedLock then h.WalkSpeed = activeSpeed end
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

-- ===== GUI =====
local gui = Instance.new("ScreenGui")
gui.Name = "NatSemiTP"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Colors
local bg = Color3.fromRGB(15,15,22)
local grn = Color3.fromRGB(0,255,170)
local pur = Color3.fromRGB(140,90,255)
local wht = Color3.fromRGB(255,255,255)
local drk = Color3.fromRGB(22,22,32)
local gry = Color3.fromRGB(140,140,155)
local red = Color3.fromRGB(255,55,65)
local blu = Color3.fromRGB(88,101,242)
local org = Color3.fromRGB(255,170,0)
local pnk = Color3.fromRGB(255,100,180)

-- ===== MINIMIZE ICON (locked by default) =====
local ico = Instance.new("TextButton")
ico.Size = UDim2.new(0,44,0,44)
ico.Position = UDim2.new(0.02,0,0.02,0)
ico.Text = "NAT"
ico.BackgroundColor3 = grn
ico.TextColor3 = Color3.fromRGB(0,0,0)
ico.Font = Enum.Font.GothamBlack
ico.TextSize = 10
ico.BorderSizePixel = 0
ico.Visible = false
ico.ZIndex = 10
ico.Parent = gui
Instance.new("UICorner",ico).CornerRadius = UDim.new(1,0)

local icoLocked = true   -- standaard vergrendeld
local dragging = false
local moved = false
local sPos, sFrame = nil, nil

ico.InputBegan:Connect(function(i)
    if icoLocked then return end
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dragging = true; moved = false; sPos = i.Position; sFrame = ico.Position
    end
end)
ico.InputEnded:Connect(function(i)
    if icoLocked then return end
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dragging = false
        if not moved then
            -- open de juiste frame
            if entered then main.Visible = true else sf.Visible = true end
            ico.Visible = false
        end
    end
end)
uis.InputChanged:Connect(function(i)
    if dragging and not icoLocked then
        if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
            local d = i.Position - sPos
            if math.abs(d.X) > 2 or math.abs(d.Y) > 2 then moved = true end
            ico.Position = UDim2.new(sFrame.X.Scale, sFrame.X.Offset+d.X, sFrame.Y.Scale, sFrame.Y.Offset+d.Y)
        end
    end
end)

-- ===== N TOGGLE =====
local guiVisible = true
local entered = false
uis.InputBegan:Connect(function(input,gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.N then
        guiVisible = not guiVisible
        if guiVisible then
            if entered then main.Visible = true else sf.Visible = true end
            ico.Visible = false
        else
            sf.Visible = false; main.Visible = false
            ico.Visible = true
        end
    end
end)

-- ===== START FRAME =====
local sf = Instance.new("Frame")
sf.Size = UDim2.new(0,340,0,200)
sf.Position = UDim2.new(0.5,-170,0.5,-100)
sf.BackgroundColor3 = bg
sf.BorderSizePixel = 0
sf.Active = true
sf.Draggable = true
sf.Visible = true
sf.Parent = gui
Instance.new("UICorner",sf).CornerRadius = UDim.new(0,14)

local sfStroke = Instance.new("UIStroke")
sfStroke.Color = grn; sfStroke.Thickness = 1.5; sfStroke.Transparency = 0.4
sfStroke.Parent = sf

-- Header
local sfHdr = Instance.new("Frame")
sfHdr.Size = UDim2.new(1,0,0,46)
sfHdr.BackgroundColor3 = Color3.fromRGB(10,10,16)
sfHdr.BorderSizePixel = 0
sfHdr.Parent = sf
Instance.new("UICorner",sfHdr).CornerRadius = UDim.new(0,14)

local sfTitle = Instance.new("TextLabel")
sfTitle.Size = UDim2.new(1,-40,0,46)
sfTitle.Position = UDim2.new(0,15,0,0)
sfTitle.Text = "NAT SEMI TP"
sfTitle.TextColor3 = wht
sfTitle.BackgroundTransparency = 1
sfTitle.Font = Enum.Font.GothamBlack
sfTitle.TextSize = 18
sfTitle.Parent = sf

local sfClose = Instance.new("TextButton")
sfClose.Size = UDim2.new(0,26,0,26)
sfClose.Position = UDim2.new(1,-34,0,10)
sfClose.Text = "X"
sfClose.BackgroundColor3 = red
sfClose.TextColor3 = wht
sfClose.Font = Enum.Font.GothamBold; sfClose.TextSize = 14
sfClose.BorderSizePixel = 0; sfClose.AutoButtonColor = false
sfClose.Parent = sf
Instance.new("UICorner",sfClose).CornerRadius = UDim.new(0,6)
sfClose.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Discord
local dcLabel = Instance.new("TextLabel")
dcLabel.Size = UDim2.new(1,-30,0,18)
dcLabel.Position = UDim2.new(0,15,0,0.28)
dcLabel.Text = "Join Discord for key:"
dcLabel.TextColor3 = gry
dcLabel.BackgroundTransparency = 1
dcLabel.Font = Enum.Font.SourceSans; dcLabel.TextSize = 12
dcLabel.Parent = sf

local dcLink = Instance.new("TextLabel")
dcLink.Size = UDim2.new(1,-30,0,22)
dcLink.Position = UDim2.new(0,15,0,0.38)
dcLink.Text = "discord.gg/4cXDtZ2J4"
dcLink.TextColor3 = blu
dcLink.BackgroundTransparency = 1
dcLink.Font = Enum.Font.SourceSansBold; dcLink.TextSize = 13
dcLink.Parent = sf

local dcCopy = Instance.new("TextButton")
dcCopy.Size = UDim2.new(0.88,0,0,30)
dcCopy.Position = UDim2.new(0.06,0,0.52)
dcCopy.Text = "COPY DISCORD LINK"
dcCopy.BackgroundColor3 = blu
dcCopy.TextColor3 = wht
dcCopy.Font = Enum.Font.GothamBold; dcCopy.TextSize = 11
dcCopy.BorderSizePixel = 0
dcCopy.Parent = sf
Instance.new("UICorner",dcCopy).CornerRadius = UDim.new(0,7)
dcCopy.MouseButton1Click:Connect(function()
    pcall(function() setclipboard("https://discord.gg/4cXDtZ2J4") end)
    dcCopy.Text = "COPIED!"
    wait(1.5); dcCopy.Text = "COPY DISCORD LINK"
end)

local enterBtn = Instance.new("TextButton")
enterBtn.Size = UDim2.new(0.88,0,0,36)
enterBtn.Position = UDim2.new(0.06,0,0.7)
enterBtn.Text = "ENTER HUB"
enterBtn.BackgroundColor3 = grn
enterBtn.TextColor3 = Color3.fromRGB(0,0,0)
enterBtn.Font = Enum.Font.GothamBlack; enterBtn.TextSize = 14
enterBtn.BorderSizePixel = 0
enterBtn.Parent = sf
Instance.new("UICorner",enterBtn).CornerRadius = UDim.new(0,8)
enterBtn.MouseButton1Click:Connect(function()
    sf.Visible = false
    main.Visible = true
    entered = true
end)

-- ===== MAIN HUB FRAME =====
local main = Instance.new("Frame")
main.Size = UDim2.new(0,340,0,260)
main.Position = UDim2.new(0.5,-170,0.5,-130)
main.BackgroundColor3 = bg
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Visible = false
main.Parent = gui
Instance.new("UICorner",main).CornerRadius = UDim.new(0,14)

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = grn; mainStroke.Thickness = 1.5; mainStroke.Transparency = 0.4
mainStroke.Parent = main

local mainHdr = Instance.new("Frame")
mainHdr.Size = UDim2.new(1,0,0,46)
mainHdr.BackgroundColor3 = Color3.fromRGB(10,10,16)
mainHdr.BorderSizePixel = 0
mainHdr.Parent = main
Instance.new("UICorner",mainHdr).CornerRadius = UDim.new(0,14)

local mainTitle = Instance.new("TextLabel")
mainTitle.Size = UDim2.new(1,-110,0,46)
mainTitle.Position = UDim2.new(0,15,0,0)
mainTitle.Text = "NAT SEMI TP"
mainTitle.TextColor3 = wht
mainTitle.BackgroundTransparency = 1
mainTitle.Font = Enum.Font.GothamBlack; mainTitle.TextSize = 18
mainTitle.Parent = main

-- Aparte lock knop voor de GUI OPENER (icoon)
local lockIcoBtn = Instance.new("TextButton")
lockIcoBtn.Size = UDim2.new(0,28,0,28)
lockIcoBtn.Position = UDim2.new(1,-106,0,9)
lockIcoBtn.Text = "🔓"   -- staat nu unlocked (icoon is locked by default, dus deze toont of de icoon lock aan/uit)
lockIcoBtn.BackgroundColor3 = red   -- rood = unlocked (icoon kan nu gesleept worden) maar we moeten de juiste logica aanpassen
lockIcoBtn.TextColor3 = wht
lockIcoBtn.Font = Enum.Font.GothamBold; lockIcoBtn.TextSize = 14
lockIcoBtn.BorderSizePixel = 0; lockIcoBtn.AutoButtonColor = false
lockIcoBtn.Parent = main
Instance.new("UICorner",lockIcoBtn).CornerRadius = UDim.new(0,6)

-- Default: icoon staat locked (🔒), dus de button moet laten zien dat je kunt unlocken.
-- We passen het aan: icoLocked = true -> toon "🔒" en groene achtergrond; icoLocked = false -> toon "🔓" en rode achtergrond.
local function updateLockButton()
    if icoLocked then
        lockIcoBtn.Text = "🔒"
        lockIcoBtn.BackgroundColor3 = grn
    else
        lockIcoBtn.Text = "🔓"
        lockIcoBtn.BackgroundColor3 = red
    end
end
updateLockButton()

lockIcoBtn.MouseButton1Click:Connect(function()
    icoLocked = not icoLocked
    updateLockButton()
end)

-- Minimize
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0,26,0,26)
minBtn.Position = UDim2.new(1,-72,0,10)
minBtn.Text = "_"
minBtn.BackgroundColor3 = org
minBtn.TextColor3 = wht
minBtn.Font = Enum.Font.GothamBlack; minBtn.TextSize = 16
minBtn.BorderSizePixel = 0; minBtn.AutoButtonColor = false
minBtn.Parent = main
Instance.new("UICorner",minBtn).CornerRadius = UDim.new(0,6)
minBtn.MouseButton1Click:Connect(function()
    main.Visible = false
    ico.Visible = true
end)

-- Close
local mainClose = Instance.new("TextButton")
mainClose.Size = UDim2.new(0,26,0,26)
mainClose.Position = UDim2.new(1,-34,0,10)
mainClose.Text = "X"
mainClose.BackgroundColor3 = red
mainClose.TextColor3 = wht
mainClose.Font = Enum.Font.GothamBold; mainClose.TextSize = 14
mainClose.BorderSizePixel = 0; mainClose.AutoButtonColor = false
mainClose.Parent = main
Instance.new("UICorner",mainClose).CornerRadius = UDim.new(0,6)
mainClose.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Speed section
local spdLabel = Instance.new("TextLabel")
spdLabel.Size = UDim2.new(1,-30,0,18)
spdLabel.Position = UDim2.new(0,15,0,0.22)
spdLabel.Text = "🏃 SPEED BOOST"
spdLabel.TextColor3 = grn
spdLabel.BackgroundTransparency = 1
spdLabel.Font = Enum.Font.GothamBold; spdLabel.TextSize = 12
spdLabel.Parent = main

local spdBtn = Instance.new("TextButton")
spdBtn.Size = UDim2.new(0.88,0,0,34)
spdBtn.Position = UDim2.new(0.06,0,0.3)
spdBtn.Text = "SPEED BOOST (29)"
spdBtn.BackgroundColor3 = grn
spdBtn.TextColor3 = Color3.fromRGB(0,0,0)
spdBtn.Font = Enum.Font.GothamBlack; spdBtn.TextSize = 13
spdBtn.BorderSizePixel = 0
spdBtn.Parent = main
Instance.new("UICorner",spdBtn).CornerRadius = UDim.new(0,8)
spdBtn.MouseButton1Click:Connect(function() boost(29) end)

local giantBtn = Instance.new("TextButton")
giantBtn.Size = UDim2.new(0.88,0,0,34)
giantBtn.Position = UDim2.new(0.06,0,0.44)
giantBtn.Text = "GIANT SPEED (34)"
giantBtn.BackgroundColor3 = pur
giantBtn.TextColor3 = wht
giantBtn.Font = Enum.Font.GothamBlack; giantBtn.TextSize = 13
giantBtn.BorderSizePixel = 0
giantBtn.Parent = main
Instance.new("UICorner",giantBtn).CornerRadius = UDim.new(0,8)
giantBtn.MouseButton1Click:Connect(function() boost(34) end)

local resetBtn = Instance.new("TextButton")
resetBtn.Size = UDim2.new(0.88,0,0,34)
resetBtn.Position = UDim2.new(0.06,0,0.58)
resetBtn.Text = "RESET SPEED (16)"
resetBtn.BackgroundColor3 = red
resetBtn.TextColor3 = wht
resetBtn.Font = Enum.Font.GothamBlack; resetBtn.TextSize = 13
resetBtn.BorderSizePixel = 0
resetBtn.Parent = main
Instance.new("UICorner",resetBtn).CornerRadius = UDim.new(0,8)
resetBtn.MouseButton1Click:Connect(function() resetSpd() end)

-- Respawn section
local rspLabel = Instance.new("TextLabel")
rspLabel.Size = UDim2.new(1,-30,0,18)
rspLabel.Position = UDim2.new(0,15,0,0.72)
rspLabel.Text = "💀 RESPAWN"
rspLabel.TextColor3 = pnk
rspLabel.BackgroundTransparency = 1
rspLabel.Font = Enum.Font.GothamBold; rspLabel.TextSize = 12
rspLabel.Parent = main

local rspBtn = Instance.new("TextButton")
rspBtn.Size = UDim2.new(0.88,0,0,34)
rspBtn.Position = UDim2.new(0.06,0,0.8)
rspBtn.Text = "FAST RESPAWN (0.5s)"
rspBtn.BackgroundColor3 = pnk
rspBtn.TextColor3 = wht
rspBtn.Font = Enum.Font.GothamBlack; rspBtn.TextSize = 12
rspBtn.BorderSizePixel = 0
rspBtn.Parent = main
Instance.new("UICorner",rspBtn).CornerRadius = UDim.new(0,8)
rspBtn.MouseButton1Click:Connect(function() fastRespawn() end)

print("NAT SEMI TP v3.0 loaded!")

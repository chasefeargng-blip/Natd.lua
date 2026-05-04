-- ============================================
-- NAT SEMI TP - v2.5 FINAL
-- Speed: 29 | Giant: 34 | Reset: 16
-- Discord: discord.gg/4cXDtZ2J4
-- Lock GUI positie | N toggle | Minimize
-- ============================================

local player = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")

-- Speed functie
local function setSpeed(v)
    local c = player.Character
    if c then
        local h = c:FindFirstChild("Humanoid")
        if h then h.WalkSpeed = v end
    end
end

-- Speed locker
local activeSpeed = 16
local speedLock = false
spawn(function() while wait(0.05) do if speedLock then setSpeed(activeSpeed) end end end)

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

-- Fast respawn
local function fastRespawn()
    spawn(function()
        pcall(function() if player.Character then player.Character:BreakJoints() end end)
        wait(0.5)
        pcall(function() if player.Character and player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid.Health = 0 end end)
    end)
end

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "NatSemiTP"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

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

-- ===== MINIMIZE ICON =====
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

-- Drag icon (alleen als unlocked)
local icoLocked = true
local dragging = false
local moved = false
local sPos = nil
local sFrame = nil

ico.InputBegan:Connect(function(i)
    if icoLocked then return end
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        moved = false
        sPos = i.Position
        sFrame = ico.Position
    end
end)
ico.InputEnded:Connect(function(i)
    if icoLocked then return end
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dragging = false
        if not moved then
            main.Visible = true
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
local vis = true
uis.InputBegan:Connect(function(input,gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.N then
        vis = not vis
        main.Visible = vis
        ico.Visible = not vis
    end
end)

-- ===== MAIN FRAME =====
local main = Instance.new("Frame")
main.Size = UDim2.new(0,340,0,310)
main.Position = UDim2.new(0.5,-170,0.5,-155)
main.BackgroundColor3 = bg
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Visible = true
main.Parent = gui
Instance.new("UICorner",main).CornerRadius = UDim.new(0,14)

local mss = Instance.new("UIStroke")
mss.Color = grn
mss.Thickness = 1.5
mss.Transparency = 0.4
mss.Parent = main

-- Header
local hdr = Instance.new("Frame")
hdr.Size = UDim2.new(1,0,0,52)
hdr.BackgroundColor3 = Color3.fromRGB(10,10,16)
hdr.BorderSizePixel = 0
hdr.Parent = main
Instance.new("UICorner",hdr).CornerRadius = UDim.new(0,14)

-- Title
local ttl = Instance.new("TextLabel")
ttl.Size = UDim2.new(1,-100,0,52)
ttl.Position = UDim2.new(0,15,0,0)
ttl.Text = "NAT SEMI TP"
ttl.TextColor3 = wht
ttl.BackgroundTransparency = 1
ttl.Font = Enum.Font.GothamBlack
ttl.TextSize = 19
ttl.Parent = main

-- Lock positie knop
local lockBtn = Instance.new("TextButton")
lockBtn.Size = UDim2.new(0,26,0,26)
lockBtn.Position = UDim2.new(1,-94,0,13)
lockBtn.Text = "🔒"
lockBtn.BackgroundColor3 = org
lockBtn.TextColor3 = wht
lockBtn.Font = Enum.Font.GothamBold
lockBtn.TextSize = 14
lockBtn.BorderSizePixel = 0
lockBtn.AutoButtonColor = false
lockBtn.Parent = main
Instance.new("UICorner",lockBtn).CornerRadius = UDim.new(0,6)

local isLocked = false
lockBtn.MouseButton1Click:Connect(function()
    isLocked = not isLocked
    icoLocked = not icoLocked
    main.Draggable = not isLocked
    if isLocked then
        lockBtn.Text = "🔓"
        lockBtn.BackgroundColor3 = red
    else
        lockBtn.Text = "🔒"
        lockBtn.BackgroundColor3 = org
    end
end)

-- Minimize
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0,26,0,26)
minBtn.Position = UDim2.new(1,-62,0,13)
minBtn.Text = "_"
minBtn.BackgroundColor3 = org
minBtn.TextColor3 = wht
minBtn.Font = Enum.Font.GothamBlack
minBtn.TextSize = 16
minBtn.BorderSizePixel = 0
minBtn.AutoButtonColor = false
minBtn.Parent = main
Instance.new("UICorner",minBtn).CornerRadius = UDim.new(0,6)
minBtn.MouseButton1Click:Connect(function()
    main.Visible = false
    ico.Visible = true
end)

-- Close
local cls = Instance.new("TextButton")
cls.Size = UDim2.new(0,26,0,26)
cls.Position = UDim2.new(1,-34,0,13)
cls.Text = "X"
cls.BackgroundColor3 = red
cls.TextColor3 = wht
cls.Font = Enum.Font.GothamBold
cls.TextSize = 14
cls.BorderSizePixel = 0
cls.AutoButtonColor = false
cls.Parent = main
Instance.new("UICorner",cls).CornerRadius = UDim.new(0,6)
cls.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Discord sectie
local dcTxt = Instance.new("TextLabel")
dcTxt.Size = UDim2.new(1,-30,0,18)
dcTxt.Position = UDim2.new(0,15,0,0.20)
dcTxt.Text = "📢 discord.gg/4cXDtZ2J4"
dcTxt.TextColor3 = blu
dcTxt.BackgroundTransparency = 1
dcTxt.Font = Enum.Font.SourceSansBold
dcTxt.TextSize = 12
dcTxt.Parent = main

local dcBtn = Instance.new("TextButton")
dcBtn.Size = UDim2.new(0.88,0,0,30)
dcBtn.Position = UDim2.new(0.06,0,0.27)
dcBtn.Text = "COPY DISCORD"
dcBtn.BackgroundColor3 = blu
dcBtn.TextColor3 = wht
dcBtn.Font = Enum.Font.GothamBold
dcBtn.TextSize = 11
dcBtn.BorderSizePixel = 0
dcBtn.Parent = main
Instance.new("UICorner",dcBtn).CornerRadius = UDim.new(0,7)
dcBtn.MouseButton1Click:Connect(function()
    pcall(function() setclipboard("https://discord.gg/4cXDtZ2J4") end)
    dcBtn.Text = "COPIED!"
    wait(1.5)
    dcBtn.Text = "COPY DISCORD"
end)

-- ===== SPEED BOOST SECTION =====
local spdTxt = Instance.new("TextLabel")
spdTxt.Size = UDim2.new(1,-30,0,18)
spdTxt.Position = UDim2.new(0,15,0,0.39)
spdTxt.Text = "🏃 SPEED BOOST"
spdTxt.TextColor3 = grn
spdTxt.BackgroundTransparency = 1
spdTxt.Font = Enum.Font.GothamBold
spdTxt.TextSize = 12
spdTxt.Parent = main

local sp = Instance.new("TextButton")
sp.Size = UDim2.new(0.88,0,0,34)
sp.Position = UDim2.new(0.06,0,0.45)
sp.Text = "SPEED BOOST (29)"
sp.BackgroundColor3 = grn
sp.TextColor3 = Color3.fromRGB(0,0,0)
sp.Font = Enum.Font.GothamBlack
sp.TextSize = 13
sp.BorderSizePixel = 0
sp.Parent = main
Instance.new("UICorner",sp).CornerRadius = UDim.new(0,8)
sp.MouseButton1Click:Connect(function() boost(29) end)

local gp = Instance.new("TextButton")
gp.Size = UDim2.new(0.88,0,0,34)
gp.Position = UDim2.new(0.06,0,0.56)
gp.Text = "GIANT SPEED (34)"
gp.BackgroundColor3 = pur
gp.TextColor3 = wht
gp.Font = Enum.Font.GothamBlack
gp.TextSize = 13
gp.BorderSizePixel = 0
gp.Parent = main
Instance.new("UICorner",gp).CornerRadius = UDim.new(0,8)
gp.MouseButton1Click:Connect(function() boost(34) end)

local rp = Instance.new("TextButton")
rp.Size = UDim2.new(0.88,0,0,34)
rp.Position = UDim2.new(0.06,0,0.67)
rp.Text = "RESET SPEED (16)"
rp.BackgroundColor3 = red
rp.TextColor3 = wht
rp.Font = Enum.Font.GothamBlack
rp.TextSize = 13
rp.BorderSizePixel = 0
rp.Parent = main
Instance.new("UICorner",rp).CornerRadius = UDim.new(0,8)
rp.MouseButton1Click:Connect(function() resetSpd() end)

-- ===== RESPAWN SECTION =====
local rspTxt = Instance.new("TextLabel")
rspTxt.Size = UDim2.new(1,-30,0,18)
rspTxt.Position = UDim2.new(0,15,0,0.80)
rspTxt.Text = "💀 RESPAWN"
rspTxt.TextColor3 = pnk
rspTxt.BackgroundTransparency = 1
rspTxt.Font = Enum.Font.GothamBold
rspTxt.TextSize = 12
rspTxt.Parent = main

local rspBtn = Instance.new("TextButton")
rspBtn.Size = UDim2.new(0.88,0,0,34)
rspBtn.Position = UDim2.new(0.06,0,0.86)
rspBtn.Text = "FAST RESPAWN (0.5s)"
rspBtn.BackgroundColor3 = pnk
rspBtn.TextColor3 = wht
rspBtn.Font = Enum.Font.GothamBlack
rspBtn.TextSize = 12
rspBtn.BorderSizePixel = 0
rspBtn.Parent = main
Instance.new("UICorner",rspBtn).CornerRadius = UDim.new(0,8)
rspBtn.MouseButton1Click:Connect(function() fastRespawn() end)

print("NAT SEMI TP v2.5 Final Loaded!")

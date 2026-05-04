-- ============================================
-- NATHUB x D4VE - ULTRA PREMIUM ANIMATED
-- Key: Davey | Smooth Animations | Cinema Feel
-- ============================================

local player = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")
local ts = game:GetService("TweenService")
local ti = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- Key
local key = "Davey"
local unlocked = false
if readfile and pcall(function() return readfile("NatD4Key.txt") end) then
    if readfile("NatD4Key.txt") == key then unlocked = true end
end

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "NatD4Premium"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local function getHum()
    local c = player.Character
    return c and c:FindFirstChild("Humanoid")
end

local function setSpeed(v)
    local h = getHum()
    if h then h.WalkSpeed = v end
end

-- Colors
local bg = Color3.fromRGB(12, 12, 18)
local accent = Color3.fromRGB(0, 255, 170)
local accent2 = Color3.fromRGB(140, 80, 255)
local gold = Color3.fromRGB(255, 200, 60)
local white = Color3.fromRGB(255, 255, 255)
local dark = Color3.fromRGB(20, 20, 28)
local red = Color3.fromRGB(255, 55, 65)

-- ===== ANIMATION HELPERS =====
local function fadeIn(obj)
    obj.BackgroundTransparency = 1
    if obj:IsA("TextLabel") or obj:IsA("TextButton") then obj.TextTransparency = 1 end
    obj.Position = obj.Position + UDim2.new(0, 0, 0, 30)
    ts:Create(obj, ti, {BackgroundTransparency = 0}):Play()
    if obj:IsA("TextLabel") or obj:IsA("TextButton") then ts:Create(obj, ti, {TextTransparency = 0}):Play() end
    ts:Create(obj, ti, {Position = obj.Position - UDim2.new(0, 0, 0, 30)}):Play()
end

local function pulse(obj)
    spawn(function()
        while obj and obj.Parent do
            ts:Create(obj, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = obj.Size + UDim2.new(0, 4, 0, 4)}):Play()
            wait(1)
            ts:Create(obj, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = obj.Size - UDim2.new(0, 4, 0, 4)}):Play()
            wait(1)
        end
    end)
end

-- ===== KEY FRAME =====
local kf = Instance.new("Frame")
kf.Size = UDim2.new(0, 300, 0, 210)
kf.Position = UDim2.new(0.5, -150, 0.5, -135)
kf.BackgroundColor3 = bg
kf.BorderSizePixel = 0
kf.BackgroundTransparency = 1
kf.Visible = not unlocked
kf.Active = true
kf.Draggable = true
kf.Parent = gui

Instance.new("UICorner", kf).CornerRadius = UDim.new(0, 16)
local kfs = Instance.new("UIStroke")
kfs.Color = accent
kfs.Thickness = 1
kfs.Transparency = 0.6
kfs.Parent = kf

-- Glow top
local g1 = Instance.new("Frame")
g1.Size = UDim2.new(1, 0, 0, 2)
g1.BackgroundColor3 = accent
g1.BorderSizePixel = 0
g1.Parent = kf

-- Glow bottom
local g2 = Instance.new("Frame")
g2.Size = UDim2.new(1, 0, 0, 2)
g2.Position = UDim2.new(0, 0, 1, -2)
g2.BackgroundColor3 = accent
g2.BorderSizePixel = 0
g2.Parent = kf

-- Title
local kt = Instance.new("TextLabel")
kt.Size = UDim2.new(1, 0, 0, 45)
kt.Text = "NATHUB x D4VE"
kt.TextColor3 = white
kt.BackgroundColor3 = Color3.fromRGB(8, 8, 14)
kt.Font = Enum.Font.GothamBlack
kt.TextSize = 16
kt.TextTransparency = 1
kt.Parent = kf
Instance.new("UICorner", kt).CornerRadius = UDim.new(0, 16)

local kt2 = Instance.new("TextLabel")
kt2.Size = UDim2.new(1, 0, 0, 16)
kt2.Position = UDim2.new(0, 0, 0.24, 0)
kt2.Text = "✦ PREMIUM ACCESS ✦"
kt2.TextColor3 = gold
kt2.BackgroundTransparency = 1
kt2.Font = Enum.Font.GothamBold
kt2.TextSize = 9
kt2.TextTransparency = 1
kt2.Parent = kf

local dc = Instance.new("TextLabel")
dc.Size = UDim2.new(1, 0, 0, 14)
dc.Position = UDim2.new(0, 0, 0.35, 0)
dc.Text = "Join for key: discord.gg/kqfvs9ndJ"
dc.TextColor3 = Color3.fromRGB(160, 160, 180)
dc.BackgroundTransparency = 1
dc.Font = Enum.Font.SourceSans
dc.TextSize = 10
dc.TextTransparency = 1
dc.Parent = kf

local dc2 = Instance.new("TextLabel")
dc2.Size = UDim2.new(1, 0, 0, 14)
dc2.Position = UDim2.new(0, 0, 0.42, 0)
dc2.Text = "discord.gg/z2H9a75UZn"
dc2.TextColor3 = Color3.fromRGB(160, 160, 180)
dc2.BackgroundTransparency = 1
dc2.Font = Enum.Font.SourceSans
dc2.TextSize = 10
dc2.TextTransparency = 1
dc2.Parent = kf

local ki = Instance.new("TextBox")
ki.Size = UDim2.new(0.85, 0, 0, 36)
ki.Position = UDim2.new(0.075, 0, 0.55, 0)
ki.PlaceholderText = "Enter key..."
ki.Text = ""
ki.BackgroundColor3 = dark
ki.TextColor3 = white
ki.Font = Enum.Font.SourceSans
ki.TextSize = 12
ki.BorderSizePixel = 0
ki.BackgroundTransparency = 1
ki.TextTransparency = 1
ki.Parent = kf
Instance.new("UICorner", ki).CornerRadius = UDim.new(0, 8)

local ku = Instance.new("TextButton")
ku.Size = UDim2.new(0.85, 0, 0, 38)
ku.Position = UDim2.new(0.075, 0, 0.75, 0)
ku.Text = "AUTHENTICATE"
ku.BackgroundColor3 = accent
ku.TextColor3 = Color3.fromRGB(0, 0, 0)
ku.Font = Enum.Font.GothamBlack
ku.TextSize = 13
ku.BorderSizePixel = 0
ku.BackgroundTransparency = 1
ku.TextTransparency = 1
ku.Parent = kf
Instance.new("UICorner", ku).CornerRadius = UDim.new(0, 8)

-- Animate key frame in
fadeIn(kf)
fadeIn(kt)
fadeIn(kt2)
fadeIn(dc)
fadeIn(dc2)
fadeIn(ki)
fadeIn(ku)
pulse(ku)

ku.MouseButton1Click:Connect(function()
    if ki.Text == key then
        unlocked = true
        if writefile then pcall(function() writefile("NatD4Key.txt", key) end) end
        
        -- Animate out
        ts:Create(kf, TweenInfo.new(0.5), {BackgroundTransparency = 1, Position = kf.Position + UDim2.new(0, 0, 0, -60)}):Play()
        for _, v in pairs(kf:GetChildren()) do
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                ts:Create(v, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
            end
        end
        wait(0.5)
        kf.Visible = false
        main.Visible = true
        
        -- Animate main in
        spawn(function()
            for _, v in pairs(main:GetChildren()) do
                if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
                    fadeIn(v)
                end
            end
        end)
    else
        ki.Text = ""
        ki.PlaceholderText = "Invalid key"
        wait(1)
        ki.PlaceholderText = "Enter key..."
    end
end)

-- ===== MAIN FRAME =====
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 300, 0, 170)
main.Position = UDim2.new(0.5, -150, 0.5, -105)
main.BackgroundColor3 = bg
main.BorderSizePixel = 0
main.BackgroundTransparency = 1
main.Visible = unlocked
main.Active = true
main.Draggable = true
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 16)
local ms = Instance.new("UIStroke")
ms.Color = accent
ms.Thickness = 1
ms.Transparency = 0.6
ms.Parent = main

-- Glows
local mg1 = Instance.new("Frame")
mg1.Size = UDim2.new(1, 0, 0, 2)
mg1.BackgroundColor3 = accent
mg1.Parent = main
local mg2 = Instance.new("Frame")
mg2.Size = UDim2.new(1, 0, 0, 2)
mg2.Position = UDim2.new(0, 0, 1, -2)
mg2.BackgroundColor3 = accent
mg2.Parent = main

-- Title
local mt = Instance.new("TextLabel")
mt.Size = UDim2.new(1, 0, 0, 45)
mt.Text = "✦ SPEED BOOST ✦"
mt.TextColor3 = white
mt.BackgroundColor3 = Color3.fromRGB(8, 8, 14)
mt.Font = Enum.Font.GothamBlack
mt.TextSize = 15
mt.TextTransparency = 1
mt.Parent = main
Instance.new("UICorner", mt).CornerRadius = UDim.new(0, 16)

-- Close
local cb = Instance.new("TextButton")
cb.Size = UDim2.new(0, 26, 0, 26)
cb.Position = UDim2.new(1, -34, 0, 10)
cb.Text = "×"
cb.TextColor3 = white
cb.BackgroundColor3 = red
cb.Font = Enum.Font.GothamBold
cb.TextSize = 18
cb.BorderSizePixel = 0
cb.AutoButtonColor = false
cb.BackgroundTransparency = 1
cb.TextTransparency = 1
cb.Parent = main
Instance.new("UICorner", cb).CornerRadius = UDim.new(0, 7)
cb.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Speed Input
local si = Instance.new("TextBox")
si.Size = UDim2.new(0.44, 0, 0, 36)
si.Position = UDim2.new(0.04, 0, 0.35, 0)
si.Text = "29"
si.PlaceholderText = "Speed"
si.BackgroundColor3 = dark
si.TextColor3 = white
si.Font = Enum.Font.SourceSans
si.TextSize = 14
si.BorderSizePixel = 0
si.BackgroundTransparency = 1
si.TextTransparency = 1
si.Parent = main
Instance.new("UICorner", si).CornerRadius = UDim.new(0, 8)

local sp = Instance.new("TextButton")
sp.Size = UDim2.new(0.44, 0, 0, 36)
sp.Position = UDim2.new(0.52, 0, 0.35, 0)
sp.Text = "BOOST"
sp.BackgroundColor3 = accent
sp.TextColor3 = Color3.fromRGB(0, 0, 0)
sp.Font = Enum.Font.GothamBlack
sp.TextSize = 13
sp.BorderSizePixel = 0
sp.BackgroundTransparency = 1
sp.TextTransparency = 1
sp.Parent = main
Instance.new("UICorner", sp).CornerRadius = UDim.new(0, 8)
sp.MouseButton1Click:Connect(function()
    local v = tonumber(si.Text)
    if v and v >= 16 and v <= 30 then setSpeed(v) end
end)

-- Giant Input
local gi = Instance.new("TextBox")
gi.Size = UDim2.new(0.44, 0, 0, 36)
gi.Position = UDim2.new(0.04, 0, 0.6, 0)
gi.Text = "12"
gi.PlaceholderText = "Giant"
gi.BackgroundColor3 = dark
gi.TextColor3 = white
gi.Font = Enum.Font.SourceSans
gi.TextSize = 14
gi.BorderSizePixel = 0
gi.BackgroundTransparency = 1
gi.TextTransparency = 1
gi.Parent = main
Instance.new("UICorner", gi).CornerRadius = UDim.new(0, 8)

local gp = Instance.new("TextButton")
gp.Size = UDim2.new(0.44, 0, 0, 36)
gp.Position = UDim2.new(0.52, 0, 0.6, 0)
gp.Text = "GIANT"
gp.BackgroundColor3 = accent2
gp.TextColor3 = white
gp.Font = Enum.Font.GothamBlack
gp.TextSize = 13
gp.BorderSizePixel = 0
gp.BackgroundTransparency = 1
gp.TextTransparency = 1
gp.Parent = main
Instance.new("UICorner", gp).CornerRadius = UDim.new(0, 8)
gp.MouseButton1Click:Connect(function()
    local v = tonumber(gi.Text)
    if v and v >= 10 and v <= 34.5 then setSpeed(v) end
end)

-- Pulse the buttons
pulse(sp)
pulse(gp)

-- Initial fade in for main
if unlocked then
    spawn(function()
        fadeIn(main)
        for _, v in pairs(main:GetChildren()) do
            if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
                fadeIn(v)
            end
        end
    end)
end

print("✦ NATHUB x D4VE Premium Loaded ✦")

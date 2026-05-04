-- ============================================
-- NATHUB x D4VE - PREMIUM SPEED BOOST V2
-- Strak Design, Direct Werkend, Smooth Load
-- ============================================

local player = game.Players.LocalPlayer
local ts = game:GetService("TweenService")
local ti = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- Key
local key = "Davey"
local unlocked = false
if readfile and pcall(function() return readfile("NatD4Key.txt") end) then
    if readfile("NatD4Key.txt") == key then unlocked = true end
end

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "NatD4"
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
local bg = Color3.fromRGB(15, 15, 22)
local accent = Color3.fromRGB(0, 255, 170)
local accent2 = Color3.fromRGB(140, 90, 255)
local white = Color3.fromRGB(255, 255, 255)
local dark = Color3.fromRGB(22, 22, 32)
local gray = Color3.fromRGB(130, 130, 145)
local red = Color3.fromRGB(255, 55, 65)

-- ===== KEY FRAME =====
local kf = Instance.new("Frame")
kf.Size = UDim2.new(0, 280, 0, 180)
kf.Position = UDim2.new(0.5, -140, 0.5, -90)
kf.BackgroundColor3 = bg
kf.BorderSizePixel = 0
kf.Visible = not unlocked
kf.Active = true
kf.Draggable = true
kf.Parent = gui
Instance.new("UICorner", kf).CornerRadius = UDim.new(0, 12)

local kfs = Instance.new("UIStroke")
kfs.Color = accent
kfs.Thickness = 1
kfs.Transparency = 0.5
kfs.Parent = kf

-- Header
local kh = Instance.new("Frame")
kh.Size = UDim2.new(1, 0, 0, 42)
kh.BackgroundColor3 = Color3.fromRGB(10, 10, 16)
kh.BorderSizePixel = 0
kh.Parent = kf
Instance.new("UICorner", kh).CornerRadius = UDim.new(0, 12)

local kt = Instance.new("TextLabel")
kt.Size = UDim2.new(1, -20, 0, 42)
kt.Position = UDim2.new(0, 10, 0, 0)
kt.Text = "NATHUB x D4VE"
kt.TextColor3 = white
kt.BackgroundTransparency = 1
kt.Font = Enum.Font.GothamBlack
kt.TextSize = 14
kt.Parent = kf

local ktver = Instance.new("TextLabel")
ktver.Size = UDim2.new(1, -20, 0, 14)
ktver.Position = UDim2.new(0, 10, 0, 0.25)
ktver.Text = "✦ PREMIUM v2.5 ✦"
ktver.TextColor3 = accent
ktver.BackgroundTransparency = 1
ktver.Font = Enum.Font.GothamBold
ktver.TextSize = 8
ktver.Parent = kf

local dc = Instance.new("TextLabel")
dc.Size = UDim2.new(1, -20, 0, 14)
dc.Position = UDim2.new(0, 10, 0, 0.38)
dc.Text = "Key in Discord"
dc.TextColor3 = gray
dc.BackgroundTransparency = 1
dc.Font = Enum.Font.SourceSans
dc.TextSize = 10
dc.Parent = kf

local dc1 = Instance.new("TextLabel")
dc1.Size = UDim2.new(1, -20, 0, 14)
dc1.Position = UDim2.new(0, 10, 0, 0.46)
dc1.Text = "discord.gg/kqfvs9ndJ"
dc1.TextColor3 = Color3.fromRGB(88, 101, 242)
dc1.BackgroundTransparency = 1
dc1.Font = Enum.Font.SourceSansBold
dc1.TextSize = 9
dc1.Parent = kf

local dc2 = Instance.new("TextLabel")
dc2.Size = UDim2.new(1, -20, 0, 14)
dc2.Position = UDim2.new(0, 10, 0, 0.54)
dc2.Text = "discord.gg/z2H9a75UZn"
dc2.TextColor3 = Color3.fromRGB(88, 101, 242)
dc2.BackgroundTransparency = 1
dc2.Font = Enum.Font.SourceSansBold
dc2.TextSize = 9
dc2.Parent = kf

local ki = Instance.new("TextBox")
ki.Size = UDim2.new(0.85, 0, 0, 34)
ki.Position = UDim2.new(0.075, 0, 0.65)
ki.PlaceholderText = "Enter key..."
ki.Text = ""
ki.BackgroundColor3 = dark
ki.TextColor3 = white
ki.Font = Enum.Font.SourceSans
ki.TextSize = 12
ki.BorderSizePixel = 0
ki.Parent = kf
Instance.new("UICorner", ki).CornerRadius = UDim.new(0, 7)

local ku = Instance.new("TextButton")
ku.Size = UDim2.new(0.85, 0, 0, 36)
ku.Position = UDim2.new(0.075, 0, 0.78)
ku.Text = "AUTHENTICATE"
ku.BackgroundColor3 = accent
ku.TextColor3 = Color3.fromRGB(0, 0, 0)
ku.Font = Enum.Font.GothamBlack
ku.TextSize = 12
ku.BorderSizePixel = 0
ku.Parent = kf
Instance.new("UICorner", ku).CornerRadius = UDim.new(0, 7)

ku.MouseButton1Click:Connect(function()
    if ki.Text == key then
        unlocked = true
        if writefile then pcall(function() writefile("NatD4Key.txt", key) end) end
        kf.Visible = false
        main.Visible = true
    else
        ki.Text = ""
        ki.PlaceholderText = "Invalid key"
        wait(1)
        ki.PlaceholderText = "Enter key..."
    end
end)

-- ===== MAIN FRAME =====
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 280, 0, 150)
main.Position = UDim2.new(0.5, -140, 0.5, -75)
main.BackgroundColor3 = bg
main.BorderSizePixel = 0
main.Visible = unlocked
main.Active = true
main.Draggable = true
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

local ms = Instance.new("UIStroke")
ms.Color = accent
ms.Thickness = 1
ms.Transparency = 0.5
ms.Parent = main

-- Header
local mh = Instance.new("Frame")
mh.Size = UDim2.new(1, 0, 0, 42)
mh.BackgroundColor3 = Color3.fromRGB(10, 10, 16)
mh.Parent = main
Instance.new("UICorner", mh).CornerRadius = UDim.new(0, 12)

local mt = Instance.new("TextLabel")
mt.Size = UDim2.new(1, -40, 0, 42)
mt.Position = UDim2.new(0, 15, 0, 0)
mt.Text = "SPEED BOOST"
mt.TextColor3 = white
mt.BackgroundTransparency = 1
mt.Font = Enum.Font.GothamBlack
mt.TextSize = 14
mt.Parent = main

-- Close
local cb = Instance.new("TextButton")
cb.Size = UDim2.new(0, 26, 0, 26)
cb.Position = UDim2.new(1, -32, 0, 8)
cb.Text = "×"
cb.TextColor3 = white
cb.BackgroundColor3 = red
cb.Font = Enum.Font.GothamBold
cb.TextSize = 16
cb.BorderSizePixel = 0
cb.AutoButtonColor = false
cb.Parent = main
Instance.new("UICorner", cb).CornerRadius = UDim.new(0, 6)
cb.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Speed label
local sl = Instance.new("TextLabel")
sl.Size = UDim2.new(1, -20, 0, 16)
sl.Position = UDim2.new(0, 10, 0, 0.32)
sl.Text = "Walk Speed"
sl.TextColor3 = gray
sl.BackgroundTransparency = 1
sl.Font = Enum.Font.SourceSans
sl.TextSize = 10
sl.Parent = main

-- Speed Input + Button
local si = Instance.new("TextBox")
si.Size = UDim2.new(0.55, 0, 0, 34)
si.Position = UDim2.new(0.04, 0, 0.44)
si.Text = "29"
si.PlaceholderText = "16-30"
si.BackgroundColor3 = dark
si.TextColor3 = white
si.Font = Enum.Font.SourceSans
si.TextSize = 14
si.BorderSizePixel = 0
si.Parent = main
Instance.new("UICorner", si).CornerRadius = UDim.new(0, 7)

local sp = Instance.new("TextButton")
sp.Size = UDim2.new(0.35, 0, 0, 34)
sp.Position = UDim2.new(0.615, 0, 0.44)
sp.Text = "BOOST"
sp.BackgroundColor3 = accent
sp.TextColor3 = Color3.fromRGB(0, 0, 0)
sp.Font = Enum.Font.GothamBlack
sp.TextSize = 12
sp.BorderSizePixel = 0
sp.Parent = main
Instance.new("UICorner", sp).CornerRadius = UDim.new(0, 7)
sp.MouseButton1Click:Connect(function()
    local v = tonumber(si.Text)
    if v and v >= 16 and v <= 30 then setSpeed(v) end
end)

-- Giant label
local gl = Instance.new("TextLabel")
gl.Size = UDim2.new(1, -20, 0, 16)
gl.Position = UDim2.new(0, 10, 0, 0.58)
gl.Text = "Giant Speed"
gl.TextColor3 = gray
gl.BackgroundTransparency = 1
gl.Font = Enum.Font.SourceSans
gl.TextSize = 10
gl.Parent = main

-- Giant Input + Button
local gi = Instance.new("TextBox")
gi.Size = UDim2.new(0.55, 0, 0, 34)
gi.Position = UDim2.new(0.04, 0, 0.7)
gi.Text = "12"
gi.PlaceholderText = "10-34.5"
gi.BackgroundColor3 = dark
gi.TextColor3 = white
gi.Font = Enum.Font.SourceSans
gi.TextSize = 14
gi.BorderSizePixel = 0
gi.Parent = main
Instance.new("UICorner", gi).CornerRadius = UDim.new(0, 7)

local gp = Instance.new("TextButton")
gp.Size = UDim2.new(0.35, 0, 0, 34)
gp.Position = UDim2.new(0.615, 0, 0.7)
gp.Text = "GIANT"
gp.BackgroundColor3 = accent2
gp.TextColor3 = white
gp.Font = Enum.Font.GothamBlack
gp.TextSize = 12
gp.BorderSizePixel = 0
gp.Parent = main
Instance.new("UICorner", gp).CornerRadius = UDim.new(0, 7)
gp.MouseButton1Click:Connect(function()
    local v = tonumber(gi.Text)
    if v and v >= 10 and v <= 34.5 then setSpeed(v) end
end)

print("✦ NATHUB x D4VE v2.5 Loaded ✦")

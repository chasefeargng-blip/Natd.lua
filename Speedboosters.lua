-- ============================================
-- NATHUB x D4VE - PREMIUM v2.5 | Delta Ready
-- Key: Davey | Speed: 29 | Giant: 34
-- ============================================

local player = game.Players.LocalPlayer

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

local bg = Color3.fromRGB(15, 15, 22)
local accent = Color3.fromRGB(0, 255, 170)
local accent2 = Color3.fromRGB(140, 90, 255)
local white = Color3.fromRGB(255, 255, 255)
local dark = Color3.fromRGB(22, 22, 32)
local gray = Color3.fromRGB(130, 130, 145)
local red = Color3.fromRGB(255, 55, 65)

-- ===== KEY FRAME =====
local kf = Instance.new("Frame")
kf.Size = UDim2.new(0, 280, 0, 200)
kf.Position = UDim2.new(0.5, -140, 0.5, -100)
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

local kt2 = Instance.new("TextLabel")
kt2.Size = UDim2.new(1, -20, 0, 14)
kt2.Position = UDim2.new(0, 10, 0, 0.24)
kt2.Text = "v2.5 PREMIUM"
kt2.TextColor3 = accent
kt2.BackgroundTransparency = 1
kt2.Font = Enum.Font.GothamBold
kt2.TextSize = 8
kt2.Parent = kf

local dc = Instance.new("TextLabel")
dc.Size = UDim2.new(1, -20, 0, 14)
dc.Position = UDim2.new(0, 10, 0, 0.36)
dc.Text = "Key in Discord:"
dc.TextColor3 = gray
dc.BackgroundTransparency = 1
dc.Font = Enum.Font.SourceSans
dc.TextSize = 10
dc.Parent = kf

local dc1 = Instance.new("TextLabel")
dc1.Size = UDim2.new(1, -20, 0, 14)
dc1.Position = UDim2.new(0, 10, 0, 0.44)
dc1.Text = "discord.gg/kqfvs9ndJ"
dc1.TextColor3 = Color3.fromRGB(88, 101, 242)
dc1.BackgroundTransparency = 1
dc1.Font = Enum.Font.SourceSansBold
dc1.TextSize = 9
dc1.Parent = kf

local dc2 = Instance.new("TextLabel")
dc2.Size = UDim2.new(1, -20, 0, 14)
dc2.Position = UDim2.new(0, 10, 0, 0.52)
dc2.Text = "discord.gg/z2H9a75UZn"
dc2.TextColor3 = Color3.fromRGB(88, 101, 242)
dc2.BackgroundTransparency = 1
dc2.Font = Enum.Font.SourceSansBold
dc2.TextSize = 9
dc2.Parent = kf

local ki = Instance.new("TextBox")
ki.Size = UDim2.new(0.85, 0, 0, 34)
ki.Position = UDim2.new(0.075, 0, 0.63)
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
ku.Text = "UNLOCK"
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
main.Size = UDim2.new(0, 280, 0, 130)
main.Position = UDim2.new(0.5, -140, 0.5, -65)
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

local cb = Instance.new("TextButton")
cb.Size = UDim2.new(0, 26, 0, 26)
cb.Position = UDim2.new(1, -32, 0, 8)
cb.Text = "X"
cb.TextColor3 = white
cb.BackgroundColor3 = red
cb.Font = Enum.Font.GothamBold
cb.TextSize = 15
cb.BorderSizePixel = 0
cb.AutoButtonColor = false
cb.Parent = main
Instance.new("UICorner", cb).CornerRadius = UDim.new(0, 6)
cb.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Speed Boost knop (29)
local sp = Instance.new("TextButton")
sp.Size = UDim2.new(0.85, 0, 0, 38)
sp.Position = UDim2.new(0.075, 0, 0.35)
sp.Text = "SPEED BOOST (29)"
sp.BackgroundColor3 = accent
sp.TextColor3 = Color3.fromRGB(0, 0, 0)
sp.Font = Enum.Font.GothamBlack
sp.TextSize = 13
sp.BorderSizePixel = 0
sp.Parent = main
Instance.new("UICorner", sp).CornerRadius = UDim.new(0, 8)
sp.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = 29
    end
end)

-- Giant knop (34)
local gp = Instance.new("TextButton")
gp.Size = UDim2.new(0.85, 0, 0, 38)
gp.Position = UDim2.new(0.075, 0, 0.6)
gp.Text = "GIANT SPEED (34)"
gp.BackgroundColor3 = accent2
gp.TextColor3 = white
gp.Font = Enum.Font.GothamBlack
gp.TextSize = 13
gp.BorderSizePixel = 0
gp.Parent = main
Instance.new("UICorner", gp).CornerRadius = UDim.new(0, 8)
gp.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = 34
    end
end)

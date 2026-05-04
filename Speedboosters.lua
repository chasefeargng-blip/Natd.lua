-- ============================================
-- NAT SEMI TP - SPEED BOOST
-- Discord: discord.gg/4cXDtZ2J4
-- Speed: 29 | Giant: 34 | Reset: 16
-- ============================================

local player = game.Players.LocalPlayer

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

-- ===== START FRAME (Discord) =====
local sf = Instance.new("Frame")
sf.Size = UDim2.new(0, 280, 0, 160)
sf.Position = UDim2.new(0.5, -140, 0.5, -80)
sf.BackgroundColor3 = bg
sf.BorderSizePixel = 0
sf.Active = true
sf.Draggable = true
sf.Parent = gui
Instance.new("UICorner", sf).CornerRadius = UDim.new(0, 12)

local sfs = Instance.new("UIStroke")
sfs.Color = accent
sfs.Thickness = 1
sfs.Transparency = 0.5
sfs.Parent = sf

local sh = Instance.new("Frame")
sh.Size = UDim2.new(1, 0, 0, 42)
sh.BackgroundColor3 = Color3.fromRGB(10, 10, 16)
sh.BorderSizePixel = 0
sh.Parent = sf
Instance.new("UICorner", sh).CornerRadius = UDim.new(0, 12)

local st = Instance.new("TextLabel")
st.Size = UDim2.new(1, -20, 0, 42)
st.Position = UDim2.new(0, 10, 0, 0)
st.Text = "NAT SEMI TP"
st.TextColor3 = white
st.BackgroundTransparency = 1
st.Font = Enum.Font.GothamBlack
st.TextSize = 15
st.Parent = sf

local st2 = Instance.new("TextLabel")
st2.Size = UDim2.new(1, -20, 0, 14)
st2.Position = UDim2.new(0, 10, 0, 0.32)
st2.Text = "Join our Discord:"
st2.TextColor3 = gray
st2.BackgroundTransparency = 1
st2.Font = Enum.Font.SourceSans
st2.TextSize = 11
st2.Parent = sf

local dc = Instance.new("TextLabel")
dc.Size = UDim2.new(1, -20, 0, 18)
dc.Position = UDim2.new(0, 10, 0, 0.44)
dc.Text = "discord.gg/4cXDtZ2J4"
dc.TextColor3 = Color3.fromRGB(88, 101, 242)
dc.BackgroundTransparency = 1
dc.Font = Enum.Font.SourceSansBold
dc.TextSize = 11
dc.Parent = sf

local enter = Instance.new("TextButton")
enter.Size = UDim2.new(0.85, 0, 0, 38)
enter.Position = UDim2.new(0.075, 0, 0.65)
enter.Text = "ENTER"
enter.BackgroundColor3 = accent
enter.TextColor3 = Color3.fromRGB(0, 0, 0)
enter.Font = Enum.Font.GothamBlack
enter.TextSize = 13
enter.BorderSizePixel = 0
enter.Parent = sf
Instance.new("UICorner", enter).CornerRadius = UDim.new(0, 8)

-- ===== MAIN FRAME =====
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 280, 0, 170)
main.Position = UDim2.new(0.5, -140, 0.5, -85)
main.BackgroundColor3 = bg
main.BorderSizePixel = 0
main.Visible = false
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

-- Enter knop actie
enter.MouseButton1Click:Connect(function()
    sf.Visible = false
    main.Visible = true
end)

-- Speed Boost (29)
local sp = Instance.new("TextButton")
sp.Size = UDim2.new(0.85, 0, 0, 34)
sp.Position = UDim2.new(0.075, 0, 0.28)
sp.Text = "SPEED BOOST (29)"
sp.BackgroundColor3 = accent
sp.TextColor3 = Color3.fromRGB(0, 0, 0)
sp.Font = Enum.Font.GothamBlack
sp.TextSize = 12
sp.BorderSizePixel = 0
sp.Parent = main
Instance.new("UICorner", sp).CornerRadius = UDim.new(0, 8)
sp.MouseButton1Click:Connect(function() setSpeed(29) end)

-- Giant Speed (34)
local gp = Instance.new("TextButton")
gp.Size = UDim2.new(0.85, 0, 0, 34)
gp.Position = UDim2.new(0.075, 0, 0.48)
gp.Text = "GIANT SPEED (34)"
gp.BackgroundColor3 = accent2
gp.TextColor3 = white
gp.Font = Enum.Font.GothamBlack
gp.TextSize = 12
gp.BorderSizePixel = 0
gp.Parent = main
Instance.new("UICorner", gp).CornerRadius = UDim.new(0, 8)
gp.MouseButton1Click:Connect(function() setSpeed(34) end)

-- Reset (16)
local rp = Instance.new("TextButton")
rp.Size = UDim2.new(0.85, 0, 0, 34)
rp.Position = UDim2.new(0.075, 0, 0.68)
rp.Text = "RESET SPEED (16)"
rp.BackgroundColor3 = red
rp.TextColor3 = white
rp.Font = Enum.Font.GothamBlack
rp.TextSize = 12
rp.BorderSizePixel = 0
rp.Parent = main
Instance.new("UICorner", rp).CornerRadius = UDim.new(0, 8)
rp.MouseButton1Click:Connect(function() setSpeed(16) end)

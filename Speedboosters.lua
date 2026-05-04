-- ============================================
-- D4VE HUB x NATHUB - SPEED BOOST ONLY
-- Speed (16-30) + Giant Speed (10-34.5)
-- Key: Davey | Auto-save key
-- Discord: discord.gg/kqfvs9ndJ & discord.gg/z2H9a75UZn
-- ============================================

local player = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")

-- Key
local correctKey = "Davey"
local keyOk = false
if readfile and pcall(function() return readfile("D4veHub_Key.txt") end) then
    if readfile("D4veHub_Key.txt") == correctKey then keyOk = true end
end

local gui = Instance.new("ScreenGui")
gui.Name = "D4veHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local function getHum()
    local char = player.Character
    if char then return char:FindFirstChild("Humanoid") end
    return nil
end

local function setSpeed(val)
    local hum = getHum()
    if hum then hum.WalkSpeed = val end
end

-- ===== KEY FRAME =====
local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 240, 0, 200)
keyFrame.Position = UDim2.new(0.5, -120, 0.5, -100)
keyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
keyFrame.BorderSizePixel = 0
keyFrame.Visible = not keyOk
keyFrame.Parent = gui

local kt = Instance.new("TextLabel")
kt.Size = UDim2.new(1, -20, 0, 30)
kt.Position = UDim2.new(0, 10, 0, 10)
kt.Text = "D4VE HUB x NATHUB"
kt.TextColor3 = Color3.fromRGB(0, 255, 170)
kt.BackgroundTransparency = 1
kt.Font = Enum.Font.GothamBlack
kt.TextSize = 16
kt.Parent = keyFrame

local dc = Instance.new("TextLabel")
dc.Size = UDim2.new(1, -20, 0, 16)
dc.Position = UDim2.new(0, 10, 0, 42)
dc.Text = "Join Discord for Key:"
dc.TextColor3 = Color3.fromRGB(180, 180, 180)
dc.BackgroundTransparency = 1
dc.Font = Enum.Font.SourceSans
dc.TextSize = 10
dc.Parent = keyFrame

local dc1 = Instance.new("TextButton")
dc1.Size = UDim2.new(1, -20, 0, 22)
dc1.Position = UDim2.new(0, 10, 0, 60)
dc1.Text = "discord.gg/kqfvs9ndJ"
dc1.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
dc1.TextColor3 = Color3.fromRGB(255, 255, 255)
dc1.Font = Enum.Font.SourceSans
dc1.TextSize = 9
dc1.Parent = keyFrame

local dc2 = Instance.new("TextButton")
dc2.Size = UDim2.new(1, -20, 0, 22)
dc2.Position = UDim2.new(0, 10, 0, 86)
dc2.Text = "discord.gg/z2H9a75UZn"
dc2.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
dc2.TextColor3 = Color3.fromRGB(255, 255, 255)
dc2.Font = Enum.Font.SourceSans
dc2.TextSize = 9
dc2.Parent = keyFrame

local ki = Instance.new("TextBox")
ki.Size = UDim2.new(1, -20, 0, 32)
ki.Position = UDim2.new(0, 10, 0, 118)
ki.PlaceholderText = "Enter key..."
ki.Text = ""
ki.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
ki.TextColor3 = Color3.fromRGB(255, 255, 255)
ki.Font = Enum.Font.SourceSans
ki.TextSize = 12
ki.Parent = keyFrame

local ku = Instance.new("TextButton")
ku.Size = UDim2.new(1, -20, 0, 36)
ku.Position = UDim2.new(0, 10, 0, 156)
ku.Text = "UNLOCK"
ku.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
ku.TextColor3 = Color3.fromRGB(255, 255, 255)
ku.Font = Enum.Font.GothamBlack
ku.TextSize = 14
ku.Parent = keyFrame
ku.MouseButton1Click:Connect(function()
    if ki.Text == correctKey then
        keyOk = true
        if writefile then pcall(function() writefile("D4veHub_Key.txt", correctKey) end) end
        keyFrame.Visible = false
        main.Visible = true
    else
        ki.Text = ""
        ki.PlaceholderText = "Wrong key!"
        wait(1.5)
        ki.PlaceholderText = "Enter key..."
    end
end)

-- ===== MAIN FRAME =====
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 240, 0, 200)
main.Position = UDim2.new(0.5, -120, 0.5, -100)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
main.BorderSizePixel = 0
main.Visible = keyOk
main.Parent = gui

local mt = Instance.new("TextLabel")
mt.Size = UDim2.new(1, -20, 0, 30)
mt.Position = UDim2.new(0, 10, 0, 10)
mt.Text = "SPEED BOOST"
mt.TextColor3 = Color3.fromRGB(0, 255, 170)
mt.BackgroundTransparency = 1
mt.Font = Enum.Font.GothamBlack
mt.TextSize = 16
mt.Parent = main

-- Speed Boost
local speedInput = Instance.new("TextBox")
speedInput.Size = UDim2.new(1, -20, 0, 32)
speedInput.Position = UDim2.new(0, 10, 0, 48)
speedInput.Text = "29"
speedInput.PlaceholderText = "Speed (16-30)"
speedInput.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
speedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
speedInput.Font = Enum.Font.SourceSans
speedInput.TextSize = 13
speedInput.Parent = main

local speedBtn = Instance.new("TextButton")
speedBtn.Size = UDim2.new(1, -20, 0, 34)
speedBtn.Position = UDim2.new(0, 10, 0, 84)
speedBtn.Text = "SET SPEED"
speedBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 130)
speedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
speedBtn.Font = Enum.Font.GothamBold
speedBtn.TextSize = 13
speedBtn.Parent = main
speedBtn.MouseButton1Click:Connect(function()
    local val = tonumber(speedInput.Text)
    if val and val >= 16 and val <= 30 then setSpeed(val) end
end)

-- Giant Speed
local giantInput = Instance.new("TextBox")
giantInput.Size = UDim2.new(1, -20, 0, 32)
giantInput.Position = UDim2.new(0, 10, 0, 126)
giantInput.Text = "12"
giantInput.PlaceholderText = "Giant (10-34.5)"
giantInput.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
giantInput.TextColor3 = Color3.fromRGB(255, 255, 255)
giantInput.Font = Enum.Font.SourceSans
giantInput.TextSize = 13
giantInput.Parent = main

local giantBtn = Instance.new("TextButton")
giantBtn.Size = UDim2.new(1, -20, 0, 34)
giantBtn.Position = UDim2.new(0, 10, 0, 162)
giantBtn.Text = "SET GIANT SPEED"
giantBtn.BackgroundColor3 = Color3.fromRGB(100, 60, 255)
giantBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
giantBtn.Font = Enum.Font.GothamBold
giantBtn.TextSize = 13
giantBtn.Parent = main
giantBtn.MouseButton1Click:Connect(function()
    local val = tonumber(giantInput.Text)
    if val and val >= 10 and val <= 34.5 then setSpeed(val) end
end)

print("D4VE HUB x NATHUB - Ready!")

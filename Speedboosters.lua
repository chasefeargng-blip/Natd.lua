local player = game.Players.LocalPlayer
local rs = game:GetService("RunService")

local active = false
local speedVal = 16

-- Force speed elke 0.01 sec
spawn(function()
    while true do
        if active then
            local c = player.Character
            if c then
                local h = c:FindFirstChild("Humanoid")
                if h then
                    h.WalkSpeed = speedVal
                end
            end
        end
        wait(0.01)
    end
end)

player.CharacterAdded:Connect(function(c)
    local h = c:WaitForChild("Humanoid")
    if active then
        h.WalkSpeed = speedVal
    end
end)

-- GUI
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

local f = Instance.new("Frame")
f.Size = UDim2.new(0, 220, 0, 200)
f.Position = UDim2.new(0, 10, 0, 10)
f.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
f.Draggable = true
f.Active = true
f.Parent = gui
Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)

local t = Instance.new("TextLabel")
t.Size = UDim2.new(1, 0, 0, 30)
t.Text = "NAT SEMI TP"
t.TextColor3 = Color3.fromRGB(0, 255, 170)
t.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
t.Font = Enum.Font.GothamBlack
t.TextSize = 14
t.Parent = f

-- Speed 29
local b1 = Instance.new("TextButton")
b1.Size = UDim2.new(1, -20, 0, 35)
b1.Position = UDim2.new(0, 10, 0, 40)
b1.Text = "SPEED (29)"
b1.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
b1.TextColor3 = Color3.fromRGB(0, 0, 0)
b1.Font = Enum.Font.GothamBlack
b1.TextSize = 13
b1.Parent = f
Instance.new("UICorner", b1).CornerRadius = UDim.new(0, 6)
b1.MouseButton1Click:Connect(function()
    active = true
    speedVal = 29
end)

-- Giant 34
local b2 = Instance.new("TextButton")
b2.Size = UDim2.new(1, -20, 0, 35)
b2.Position = UDim2.new(0, 10, 0, 82)
b2.Text = "GIANT (34)"
b2.BackgroundColor3 = Color3.fromRGB(140, 90, 255)
b2.TextColor3 = Color3.fromRGB(255, 255, 255)
b2.Font = Enum.Font.GothamBlack
b2.TextSize = 13
b2.Parent = f
Instance.new("UICorner", b2).CornerRadius = UDim.new(0, 6)
b2.MouseButton1Click:Connect(function()
    active = true
    speedVal = 34
end)

-- Reset
local b3 = Instance.new("TextButton")
b3.Size = UDim2.new(1, -20, 0, 35)
b3.Position = UDim2.new(0, 10, 0, 124)
b3.Text = "RESET (16)"
b3.BackgroundColor3 = Color3.fromRGB(255, 55, 65)
b3.TextColor3 = Color3.fromRGB(255, 255, 255)
b3.Font = Enum.Font.GothamBlack
b3.TextSize = 13
b3.Parent = f
Instance.new("UICorner", b3).CornerRadius = UDim.new(0, 6)
b3.MouseButton1Click:Connect(function()
    active = false
    speedVal = 16
    local c = player.Character
    if c then
        local h = c:FindFirstChild("Humanoid")
        if h then h.WalkSpeed = 16 end
    end
end)

-- Close
local x = Instance.new("TextButton")
x.Size = UDim2.new(0, 20, 0, 20)
x.Position = UDim2.new(1, -24, 0, 5)
x.Text = "X"
x.TextColor3 = Color3.fromRGB(255, 255, 255)
x.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
x.Font = Enum.Font.GothamBold
x.TextSize = 11
x.Parent = f
Instance.new("UICorner", x).CornerRadius = UDim.new(0, 4)
x.MouseButton1Click:Connect(function() gui:Destroy() end)

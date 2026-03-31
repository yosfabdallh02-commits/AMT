local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
if playerGui:FindFirstChild("AMT_PlayerInfoUI") then
    playerGui.AMT_PlayerInfoUI:Destroy()
end
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AMT_PlayerInfoUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
bg.BorderSizePixel = 0
bg.Parent = screenGui
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 25)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 5, 8))
}
gradient.Rotation = 90
gradient.Parent = bg
local introFrame = Instance.new("Frame")
introFrame.Size = UDim2.new(1, 0, 1, 0)
introFrame.BackgroundTransparency = 1
introFrame.Parent = bg
local amtText = Instance.new("TextLabel")
amtText.Size = UDim2.new(0.6, 0, 0.4, 0)
amtText.Position = UDim2.new(0.2, 0, 0.3, 0)
amtText.BackgroundTransparency = 1
amtText.Text = "AMT"
amtText.TextColor3 = Color3.fromRGB(255, 30, 60)
amtText.TextScaled = true
amtText.Font = Enum.Font.GothamBlack
amtText.TextStrokeTransparency = 0
amtText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
amtText.Parent = introFrame
local strikeLine = Instance.new("Frame")
strikeLine.Size = UDim2.new(0, 0, 0, 12)
strikeLine.Position = UDim2.new(0.25, 0, 0.48, 0)
strikeLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
strikeLine.BorderSizePixel = 0
strikeLine.ZIndex = 2
strikeLine.Parent = introFrame
local lineStroke = Instance.new("UIStroke")
lineStroke.Thickness = 12
lineStroke.Color = Color3.fromRGB(255, 30, 60)
lineStroke.Transparency = 0
lineStroke.Parent = strikeLine
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 780, 0, 660)
mainFrame.Position = UDim2.new(0.5, -390, 0.5, -330)
mainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = bg
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 18)
local mainStroke = Instance.new("UIStroke")
mainStroke.Thickness = 2
mainStroke.Color = Color3.fromRGB(255, 30, 60)
mainStroke.Transparency = 0.6
mainStroke.Parent = mainFrame
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 80)
title.BackgroundTransparency = 1
title.Text = "AMT"
title.TextColor3 = Color3.fromRGB(255, 30, 60)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.Parent = mainFrame
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 30)
subtitle.Position = UDim2.new(0, 0, 0, 70)
subtitle.BackgroundTransparency = 1
subtitle.Text = "PLAYER INFO • SAFE UI"
subtitle.TextColor3 = Color3.fromRGB(180, 180, 190)
subtitle.TextScaled = true
subtitle.Font = Enum.Font.Gotham
subtitle.Parent = mainFrame
local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(0.8, 0, 0, 65)
inputBox.Position = UDim2.new(0.1, 0, 0.29, 0)
inputBox.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
inputBox.PlaceholderText = "  
inputBox.Text = ""
inputBox.TextColor3 = Color3.new(1,1,1)
inputBox.TextScaled = true
inputBox.Font = Enum.Font.Gotham
inputBox.ClearTextOnFocus = true
inputBox.Parent = mainFrame
"
Instance.new("UICorner", inputBox).CornerRadius = UDim.new(0, 12)
local inputStroke = Instance.new("UIStroke")
inputStroke.Color = Color3.fromRGB(255, 30, 60)
inputStroke.Transparency = 0.7
inputStroke.Parent = inputBox
local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(0.8, 0, 0, 65)
submitBtn.Position = UDim2.new(0.1, 0, 0.48, 0)
submitBtn.BackgroundColor3 = Color3.fromRGB(255, 30, 60)
submitBtn.Text = " 
"
submitBtn.TextColor3 = Color3.new(1,1,1)
submitBtn.TextScaled = true
submitBtn.Font = Enum.Font.GothamBold
submitBtn.Parent = mainFrame
Instance.new("UICorner", submitBtn).CornerRadius = UDim.new(0, 12)
local resultFrame = Instance.new("Frame")
resultFrame.Size = UDim2.new(0.93, 0, 0.52, 0)
resultFrame.Position = UDim2.new(0.035, 0, 0.62, 0)
resultFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
resultFrame.BorderSizePixel = 0
resultFrame.Visible = false
resultFrame.Parent = mainFrame
Instance.new("UICorner", resultFrame).CornerRadius = UDim.new(0, 14)
local resStroke = Instance.new("UIStroke")
resStroke.Color = Color3.fromRGB(80, 80, 90)
resStroke.Parent = resultFrame
local function createInfoLabel(text, yPos, color)
    color = color or Color3.fromRGB(220, 220, 230)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -40, 0, 34)
    lbl.Position = UDim2.new(0, 20, 0, yPos)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = color
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextScaled = true
    lbl.Font = Enum.Font.Gotham
    lbl.Parent = resultFrame
    if yPos > 40 then
        local divider = Instance.new("Frame")
        divider.Size = UDim2.new(1, -40, 0, 1)
        divider.Position = UDim2.new(0, 20, 0, yPos + 35)
        divider.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
        divider.BorderSizePixel = 0
        divider.Parent = resultFrame
    end
    return lbl
end
local function findTarget(name)
    for _, plr in ipairs(Players:GetPlayers()) do
        if string.find(string.lower(plr.Name), string.lower(name), 1, true)
        or string.find(string.lower(plr.DisplayName), string.lower(name), 1, true) then
            return plr
        end
    end
end
local function generatePlayerInfo(target)
    resultFrame.Visible = true
    resultFrame.BackgroundTransparency = 1
    TweenService:Create(resultFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {BackgroundTransparency = 0}):Play()
    for _, child in ipairs(resultFrame:GetChildren()) do
        if child:IsA("TextLabel") or child:IsA("Frame") then
            child:Destroy()
        end
    end
    local character = target.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local root = character and character:FindFirstChild("HumanoidRootPart")
    local y = 15
    local spacing = 41
    createInfoLabel(" 
: " .. target.Name, y); y += spacing
    createInfoLabel("Display Name: " .. target.DisplayName, y); y += spacing
    createInfoLabel("User ID: " .. target.UserId, y); y += spacing
    createInfoLabel("
: " .. (humanoid and math.floor(humanoid.Health) or " 
    createInfoLabel("
    createInfoLabel("
    createInfoLabel("  
: " .. (humanoid and humanoid.WalkSpeed or " 
: " .. (humanoid and humanoid.JumpPower or " 
"), y, Color3.fromRGB(120,255,140)); y += spacing
"), y); y += spacing
"), y); y += spacing
: " .. #Players:GetPlayers(), y); y += spacing
    createInfoLabel("
    if root then
: " .. (target == player and "
        local pos = root.Position
        createInfoLabel(string.format("
" or " 
"), y, Color3.fromRGB(100,200,255)); y += spacing
: X %.1f | Y %.1f | Z %.1f", pos.X, pos.Y, pos.Z), y); y += spacing
    end
    createInfoLabel(" 
    task.wait(0.8)
: " .. os.date("%H:%M:%S"), y); y += spacing
    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(1, 0, 0, 65)
    statusLabel.Position = UDim2.new(0, 0, 1, -80)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = "SCAN COMPLETE • SAFE DATA DISPLAYED"
    statusLabel.TextColor3 = Color3.fromRGB(255, 50, 80)
    statusLabel.TextScaled = true
    statusLabel.Font = Enum.Font.GothamBlack
    statusLabel.Parent = resultFrame
end
local function playIntro()
    amtText.TextTransparency = 1
    TweenService:Create(amtText, TweenInfo.new(1.2, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
    strikeLine.Size = UDim2.new(0, 0, 0, 12)
    TweenService:Create(strikeLine, TweenInfo.new(1.8, Enum.EasingStyle.Quart), {Size = UDim2.new(0.5, 0, 0, 12)}):Play()
    task.wait(2.2)
    TweenService:Create(strikeLine, TweenInfo.new(0.8, Enum.EasingStyle.Back), {Size = UDim2.new(0.5, 0, 0, 4), Rotation = 12}):Play()
    TweenService:Create(strikeLine, TweenInfo.new(1.2, Enum.EasingStyle.Quint), {BackgroundTransparency = 1}):Play()
    task.wait(1.4)
    introFrame:Destroy()
    mainFrame.Visible = true
end
submitBtn.MouseButton1Click:Connect(function()
    local name = inputBox.Text:match("^%s*(.-)%s*$")
    if name == "" or #name < 2 then
        inputBox.Text = "   
        task.wait(1.4)
        inputBox.Text = ""
        return
    end
    local target = findTarget(name)
    if not target then
        inputBox.Text = "  
        task.wait(1.4)
        inputBox.Text = ""
        return
    end
    submitBtn.Text = " 
"
..."
"
    TweenService:Create(submitBtn, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 4, true), {
        BackgroundColor3 = Color3.fromRGB(180, 20, 40)
    }):Play()
    task.wait(1.8)
    submitBtn.Text = " 
    generatePlayerInfo(target)
end)
playIntro()

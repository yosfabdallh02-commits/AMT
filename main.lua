local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

if playerGui:FindFirstChild("AMT_CinematicUI") then
    playerGui.AMT_CinematicUI:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AMT_CinematicUI"
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
mainFrame.Size = UDim2.new(0, 760, 0, 620)  -- زدت الحجم شوي
mainFrame.Position = UDim2.new(0.5, -380, 0.5, -310)
mainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = bg

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 18)
mainCorner.Parent = mainFrame

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
subtitle.Text = "PLAYER SCAN • v2.8"
subtitle.TextColor3 = Color3.fromRGB(180, 180, 190)
subtitle.TextScaled = true
subtitle.Font = Enum.Font.Gotham
subtitle.Parent = mainFrame

local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(0.8, 0, 0, 65)
inputBox.Position = UDim2.new(0.1, 0, 0.32, 0)
inputBox.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
inputBox.PlaceholderText = "حط اسم اللاعب"
inputBox.Text = ""
inputBox.TextColor3 = Color3.new(1,1,1)
inputBox.TextScaled = true
inputBox.Font = Enum.Font.Gotham
inputBox.ClearTextOnFocus = true
inputBox.Parent = mainFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 12)
inputCorner.Parent = inputBox

local inputStroke = Instance.new("UIStroke")
inputStroke.Color = Color3.fromRGB(255, 30, 60)
inputStroke.Transparency = 0.7
inputStroke.Parent = inputBox

local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(0.8, 0, 0, 65)
submitBtn.Position = UDim2.new(0.1, 0, 0.52, 0)
submitBtn.BackgroundColor3 = Color3.fromRGB(255, 30, 60)
submitBtn.Text = "تشغيل التحليل"
submitBtn.TextColor3 = Color3.new(1,1,1)
submitBtn.TextScaled = true
submitBtn.Font = Enum.Font.GothamBold
submitBtn.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 12)
btnCorner.Parent = submitBtn

local resultFrame = Instance.new("Frame")
resultFrame.Size = UDim2.new(0.92, 0, 0.48, 0)  -- أكبر عشان المعلومات الكثيرة
resultFrame.Position = UDim2.new(0.04, 0, 0.68, 0)
resultFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
resultFrame.BorderSizePixel = 0
resultFrame.Visible = false
resultFrame.Parent = mainFrame

local resCorner = Instance.new("UICorner")
resCorner.CornerRadius = UDim.new(0, 14)
resCorner.Parent = resultFrame

local resStroke = Instance.new("UIStroke")
resStroke.Color = Color3.fromRGB(80, 80, 90)
resStroke.Parent = resultFrame

-- دالة لإنشاء ليبل مع خط فاصل
local function createFakeLabel(text, yPos, color)
    color = color or Color3.fromRGB(220, 220, 230)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -40, 0, 36)
    lbl.Position = UDim2.new(0, 20, 0, yPos)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = color
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextScaled = true
    lbl.Font = Enum.Font.Gotham
    lbl.Parent = resultFrame
    
    -- خط فاصل خفيف
    if yPos > 30 then
        local divider = Instance.new("Frame")
        divider.Size = UDim2.new(1, -40, 0, 1)
        divider.Position = UDim2.new(0, 20, 0, yPos + 38)
        divider.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
        divider.BorderSizePixel = 0
        divider.Parent = resultFrame
    end
    return lbl
end

-- توليد بيانات كذابة كثيرة وعشوائية
local function generateFakeResults(playerName)
    resultFrame.Visible = true
    resultFrame.BackgroundTransparency = 1

    TweenService:Create(resultFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
        BackgroundTransparency = 0
    }):Play()

    -- حذف الليبلز القديمة
    for _, child in ipairs(resultFrame:GetChildren()) do
        if child:IsA("TextLabel") or child:IsA("Frame") then
            child:Destroy()
        end
    end

    local y = 15
    local spacing = 44

    createFakeLabel("اسم اللاعب: " .. playerName, y); y += spacing
    createFakeLabel("User ID: " .. math.random(100000000, 999999999999), y); y += spacing
    createFakeLabel("Display Name: " .. playerName .. math.random(11,99), y); y += spacing
    
    -- رقم جوال كذاب (سعودي + خليجي)
    local phones = {
        "+9665" .. math.random(1000000,9999999),
        "+96650" .. math.random(100000,999999),
        "+965" .. math.random(50000000,59999999),
        "+9715" .. math.random(1000000,9999999),
        "+974" .. math.random(30000000,39999999)
    }
    createFakeLabel("رقم الجوال: " .. phones[math.random(1,#phones)], y, Color3.fromRGB(255, 100, 100)); y += spacing

    createFakeLabel("الإيميل: " .. string.lower(playerName:gsub("%s+","")) .. math.random(100,9999) .. "@" .. ({"gmail.com","hotmail.com","outlook.com","yahoo.com","proton.me"})[math.random(1,5)], y); y += spacing
    createFakeLabel("تاريخ الميلاد: " .. math.random(1998,2008) .. "-" .. math.random(1,12) .. "-" .. math.random(1,28), y); y += spacing
    createFakeLabel("الدولة: " .. ({"السعودية","الإمارات","مصر","الكويت","قطر","الأردن","لبنان"})[math.random(1,7)], y); y += spacing
    createFakeLabel("IP Address: " .. math.random(10,255) .. "." .. math.random(10,255) .. "." .. math.random(10,255) .. "." .. math.random(10,255), y); y += spacing
    createFakeLabel("آخر تسجيل دخول: " .. math.random(1,23) .. " ساعة مضت", y); y += spacing
    createFakeLabel("الجهاز الحالي: " .. ({"iPhone 16 Pro","Samsung Galaxy S25","Windows 11 PC","MacBook Pro","Android 15"})[math.random(1,5)], y); y += spacing
    createFakeLabel("مستوى اللاعب: " .. math.random(45, 342), y); y += spacing
    createFakeLabel("تاريخ الانضمام إلى Roblox: " .. math.random(2018,2025) .. "-" .. math.random(1,12) .. "-" .. math.random(1,28), y); y += spacing
    createFakeLabel("اللعبة المفضلة: " .. ({"Blox Fruits","Brookhaven","Adopt Me","Arsenal","Phantom Forces","Murder Mystery 2","Tower of Hell"})[math.random(1,7)], y); y += spacing
    createFakeLabel("عدد الأصدقاء: " .. math.random(87, 1243), y); y += spacing
    createFakeLabel("أجهزة مسجلة: " .. math.random(2,6), y); y += spacing
    createFakeLabel("Status: " .. ({"Online","Away","In Game","Do Not Disturb"})[math.random(1,4)], y, Color3.fromRGB(100, 255, 120))

    wait(1.2)

    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(1, 0, 0, 70)
    statusLabel.Position = UDim2.new(0, 0, 1, -85)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = "SCAN COMPLETE • THREAT LEVEL: MEDIUM"
    statusLabel.TextColor3 = Color3.fromRGB(255, 40, 70)
    statusLabel.TextScaled = true
    statusLabel.Font = Enum.Font.GothamBlack
    statusLabel.TextStrokeTransparency = 0.4
    statusLabel.Parent = resultFrame

    TweenService:Create(statusLabel, TweenInfo.new(0.4, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
        Position = statusLabel.Position + UDim2.new(0, 0, 0, -8)
    }):Play()
end

local function playIntro()
    amtText.TextTransparency = 1
    TweenService:Create(amtText, TweenInfo.new(1.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        TextTransparency = 0
    }):Play()

    strikeLine.Size = UDim2.new(0, 0, 0, 12)
    TweenService:Create(strikeLine, TweenInfo.new(1.8, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Size = UDim2.new(0.5, 0, 0, 12)
    }):Play()

    wait(2.2)

    TweenService:Create(strikeLine, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0.5, 0, 0, 4),
        Rotation = 12
    }):Play()

    TweenService:Create(strikeLine, TweenInfo.new(1.2, Enum.EasingStyle.Quint), {
        BackgroundTransparency = 1
    }):Play()

    TweenService:Create(introFrame, TweenInfo.new(1.2, Enum.EasingStyle.Quint), {
        BackgroundTransparency = 1
    }):Play()

    wait(1.4)
    introFrame:Destroy()
    mainFrame.Visible = true
end

submitBtn.MouseButton1Click:Connect(function()
    local name = inputBox.Text:match("^%s*(.-)%s*$")  -- تنظيف الفراغات
    if name == "" or #name < 3 then
        inputBox.Text = "اكتب اسم أولاً (3 أحرف على الأقل)"
        wait(1.5)
        inputBox.Text = ""
        return
    end

    submitBtn.Text = "جاري التحليل..."
    TweenService:Create(submitBtn, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 4, true), {
        BackgroundColor3 = Color3.fromRGB(180, 20, 40)
    }):Play()

    wait(2.3)

    submitBtn.Text = "تشغيل التحليل"
    generateFakeResults(name)
end)

playIntro()

-- Left (tab list)
local Left = Instance.new("Frame", Main)
Left.Name = "Left"
Left.Size = UDim2.new(0.22, 0, 1, -50)    -- nhỏ gọn
Left.Position = UDim2.new(0, 10, 0, 45)   -- cách lề
Left.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Left.BackgroundTransparency = 0.15

-- Bo góc
local cornerL = Instance.new("UICorner")
cornerL.CornerRadius = UDim.new(0, 10)
cornerL.Parent = Left

-- layout dọc
local layout = Instance.new("UIListLayout", Left)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 8)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Hàm tạo nút tab với icon
function createTabButton(name, iconText)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = Left
    btn.Size = UDim2.new(1, -12, 0, 36)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.Text = ""
    
    -- Bo góc
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    -- Icon label
    local icon = Instance.new("TextLabel")
    icon.Parent = btn
    icon.Size = UDim2.new(0, 24, 1, 0)
    icon.Position = UDim2.new(0, 6, 0, 0)
    icon.BackgroundTransparency = 1
    icon.Text = iconText
    icon.TextSize = 20
    icon.Font = Enum.Font.GothamBold
    icon.TextColor3 = Color3.fromRGB(255, 200, 100)

    -- Text label
    local lbl = Instance.new("TextLabel")
    lbl.Parent = btn
    lbl.Size = UDim2.new(1, -30, 1, 0)
    lbl.Position = UDim2.new(0, 32, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = name
    lbl.TextColor3 = Color3.fromRGB(240, 240, 240)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 18
    lbl.TextXAlignment = Enum.TextXAlignment.Left

    -- Hover effect
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    end)

    return btn
end

-- Tạo tab có icon
local MainTab = createTabButton("Main", "⚙")
local ItemTab = createTabButton("Item", "📦")

-- Global
getgenv().Left = Left
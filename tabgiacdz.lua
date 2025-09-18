-- Thêm UIListLayout để sắp xếp nút tab
local listLayout = Instance.new("UIListLayout", Left)
listLayout.Padding = UDim.new(0, 5)
listLayout.FillDirection = Enum.FillDirection.Vertical
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
listLayout.VerticalAlignment = Enum.VerticalAlignment.Top

-- Tạo function để tạo button tab
local function createTab(name, callback)
    local btn = Instance.new("TextButton", Left)
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Text = name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

    btn.MouseButton1Click:Connect(function()
        callback()
    end)
end

-- Tạo các tab
createTab("Main", function()
    Right:ClearAllChildren()
    local label = Instance.new("TextLabel", Right)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "Nội dung Main hiển thị ở đây"
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 18
end)

createTab("Item", function()
    Right:ClearAllChildren()
    local label = Instance.new("TextLabel", Right)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "Nội dung Item ở đây"
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 18
end)

createTab("Stats", function()
    Right:ClearAllChildren()
    local label = Instance.new("TextLabel", Right)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "Nội dung Stats ở đây"
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 18
end)
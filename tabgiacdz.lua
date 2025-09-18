-- tabgiacdz.lua

-- Hàm tạo tab
local function CreateTab(tabName, textContent)
    -- Nút bên trái
    local btn = Instance.new("TextButton")
    btn.Name = tabName .. "_Button"
    btn.Text = tabName
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Parent = getgenv().Left

    -- Khung nội dung bên phải
    local page = Instance.new("Frame")
    page.Name = tabName .. "_Page"
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.Parent = getgenv().Pages

    -- Nội dung (TextLabel)
    local label = Instance.new("TextLabel")
    label.Text = textContent
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 24
    label.Parent = page

    -- Sự kiện click nút
    btn.MouseButton1Click:Connect(function()
        -- Ẩn tất cả page
        for _, p in pairs(getgenv().Pages:GetChildren()) do
            p.Visible = false
        end
        -- Hiện page của tab này
        page.Visible = true
    end)
end

-- Tạo tab Main + tab Item
CreateTab("Main", "Xin chào")
CreateTab("Item", "Hello")
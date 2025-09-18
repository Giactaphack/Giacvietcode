-- Tabs.lua
local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui"):WaitForChild("NeonUI")

-- Lấy ra Left (khung tab) và Right (khung nội dung)
local Main = gui:WaitForChild("Frame")
local Left = Main:FindFirstChildOfClass("Frame")
local Right = Main:FindFirstChildWhichIsA("Frame")

-- Xóa nội dung cũ của Right (nếu có)
for _, child in ipairs(Right:GetChildren()) do
    if not child:IsA("UICorner") then
        child:Destroy()
    end
end

-- Hàm tạo tab
local function createTab(name, text)
    local button = Instance.new("TextButton", Left)
    button.Size = UDim2.new(1, -10, 0, 35)
    button.Position = UDim2.new(0, 5, 0, (#Left:GetChildren()-1) * 40)
    button.BackgroundColor3 = Color3.fromRGB(40,40,40)
    button.Text = name
    button.Font = Enum.Font.Gotham
    button.TextColor3 = Color3.fromRGB(200,200,200)
    button.TextSize = 18
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

    button.MouseButton1Click:Connect(function()
        -- Clear nội dung Right
        for _, child in ipairs(Right:GetChildren()) do
            if not child:IsA("UICorner") then
                child:Destroy()
            end
        end
        -- Hiện nội dung mới
        local label = Instance.new("TextLabel", Right)
        label.Size = UDim2.new(1, -20, 1, -20)
        label.Position = UDim2.new(0, 10, 0, 10)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Color3.fromRGB(220,220,220)
        label.Font = Enum.Font.Gotham
        label.TextSize = 20
        label.TextWrapped = true
    end)
end

-- Tạo tab mẫu
createTab("Farm", "⚡ Đây là phần Farm Settings")
createTab("Config", "⚙️ Đây là phần Config Settings")
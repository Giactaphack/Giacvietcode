-- Tab system gắn vào menu đã có
local gui = game.Players.LocalPlayer.PlayerGui:WaitForChild("NeonUI")
local Main = gui:WaitForChild("Main")
local Left = Main:WaitForChild("Left")
local Right = Main:WaitForChild("Right")

-- Tạo nút tab
local function createTab(name, contentText)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 40)
    button.Position = UDim2.new(0, 5, 0, (#Left:GetChildren()-1) * 45) -- auto xuống hàng
    button.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    button.Text = name
    button.TextColor3 = Color3.fromRGB(0, 255, 0)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 18
    button.Parent = Left
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)
    local stroke = Instance.new("UIStroke", button)
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(0, 255, 0)

    -- Nội dung bên phải
    local content = Instance.new("TextLabel")
    content.Size = UDim2.new(1, -20, 1, -20)
    content.Position = UDim2.new(0, 10, 0, 10)
    content.BackgroundTransparency = 1
    content.Text = contentText
    content.TextColor3 = Color3.fromRGB(200, 200, 200)
    content.Font = Enum.Font.Gotham
    content.TextSize = 20
    content.TextWrapped = true
    content.Visible = false
    content.Parent = Right

    -- Chuyển tab
    button.MouseButton1Click:Connect(function()
        for _,v in pairs(Right:GetChildren()) do
            if v:IsA("TextLabel") then
                v.Visible = false
            end
        end
        content.Visible = true
    end)
end

-- Tạo các tab mẫu
createTab("Main", "Nội dung Main hiển thị ở đây")
createTab("Item", "Danh sách Item")
createTab("Stats", "Điểm chỉ số Stats")
createTab("Race V4", "Nâng cấp Race V4")
createTab("PVP", "Chế độ PvP")
-- LocalScript (StarterGui)
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- Gui gốc
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "NeonUI"
gui.ResetOnSpawn = false

-- Welcome
local Welcome = Instance.new("TextLabel", gui)
Welcome.Size = UDim2.new(1, 0, 0, 100)
Welcome.Position = UDim2.new(0, 0, 0.4, 0)
Welcome.BackgroundTransparency = 1
Welcome.Text = "✨ Chào mừng đến với Giacdzhub ✨"
Welcome.TextColor3 = Color3.fromRGB(0, 200, 255)
Welcome.Font = Enum.Font.FredokaOne
Welcome.TextSize = 32
Welcome.TextTransparency = 1
TweenService:Create(Welcome, TweenInfo.new(1), {TextTransparency = 0}):Play()
task.wait(2)
TweenService:Create(Welcome, TweenInfo.new(1), {TextTransparency = 1}):Play()
task.wait(1)
Welcome:Destroy()

-- Main Menu
local Main = Instance.new("Frame", gui)
Main.Size = UDim2.new(0, 520, 0, 300)
Main.Position = UDim2.new(0.3, 0, 0.2, 0)
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.BackgroundTransparency = 0.4
Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)
local stroke = Instance.new("UIStroke", Main)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(255, 165, 0)

-- Header
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundTransparency = 1
local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Position = UDim2.new(0, 8, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Farm Settings"
Title.TextColor3 = Color3.fromRGB(240,240,240)
Title.TextSize = 22
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Close button
local Close = Instance.new("TextButton", Header)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -35, 0.1, 0)
Close.BackgroundTransparency = 1
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 80, 80)
Close.Font = Enum.Font.GothamBold
Close.TextSize = 20
Close.MouseButton1Click:Connect(function()
	Main.Visible = false
end)

-- Left (tab)
local Left = Instance.new("Frame", Main)
Left.Size = UDim2.new(0.25, 0, 1, -40)
Left.Position = UDim2.new(0, 0, 0, 40)
Left.BackgroundColor3 = Color3.fromRGB(20,20,20)
Left.BackgroundTransparency = 0.3
Instance.new("UICorner", Left).CornerRadius = UDim.new(0, 10)

-- Right (content)
local Right = Instance.new("Frame", Main)
Right.Size = UDim2.new(0.75, -10, 1, -40)
Right.Position = UDim2.new(0.25, 10, 0, 40)
Right.BackgroundColor3 = Color3.fromRGB(30,30,30)
Right.BackgroundTransparency = 0.3
Instance.new("UICorner", Right).CornerRadius = UDim.new(0, 10)
local Content = Instance.new("TextLabel", Right)
Content.Size = UDim2.new(1, -20, 1, -20)
Content.Position = UDim2.new(0, 10, 0, 10)
Content.BackgroundTransparency = 1
Content.Text = "Nội dung sẽ hiển thị ở đây..."
Content.TextColor3 = Color3.fromRGB(200,200,200)
Content.Font = Enum.Font.Gotham
Content.TextSize = 20
Content.TextWrapped = true

-- Icon toggle
local Icon = Instance.new("ImageButton", gui)
Icon.Size = UDim2.new(0, 50, 0, 50)
Icon.Position = UDim2.new(0.05, 0, 0.1, 0)
Icon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Icon.BackgroundTransparency = 0.4
Instance.new("UICorner", Icon).CornerRadius = UDim.new(0, 10)
Icon.Image = "rbxassetid://9532783173"

Icon.MouseButton1Click:Connect(function()
	Main.Visible = not Main.Visible
end)

-- Drag function chuẩn
local function makeDraggable(frame, dragArea)
    local dragging, dragInput, dragStart, startPos

    dragArea.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    dragArea.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end
-- Gán drag cho menu & icon
makeDraggable(Main, Header) -- Kéo menu bằng Header
makeDraggable(Icon, Icon)   -- Kéo icon bằng chính nó
loadstring(game:HttpGet("https://raw.githubusercontent.com/Giactaphack/Giacvietcode/refs/heads/main/tabgiacdz.lua"))()
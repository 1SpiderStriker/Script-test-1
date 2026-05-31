-- Blox Fruits Trade Freeze + Force Confirm | Optimized for Cosmic Executor
-- Level 7 Optimized - Better stability, faster hooks

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local getgc = getgc or getgenv().getgc
local hookfunction = hookfunction or getgenv().hookfunction

local TradeFreezeEnabled = false
local ForceConfirmEnabled = false

-- Advanced Trade Freeze (using Level 7 capabilities)
local function FreezeTrade()
    TradeFreezeEnabled = true
    print("🔒 Trade Frozen (Cosmic Optimized)")
    
    -- Disable cancel/decline buttons more aggressively
    local tradeGui = LocalPlayer.PlayerGui:FindFirstChild("TradeGui") or LocalPlayer.PlayerGui:FindFirstChild("TradingFrame")
    if tradeGui then
        for _, obj in pairs(tradeGui:GetDescendants()) do
            if obj:IsA("TextButton") or obj:IsA("ImageButton") then
                local name = obj.Name:lower()
                if name:find("cancel") or name:find("decline") or name:find("close") then
                    obj.Active = false
                    obj.AutoButtonColor = false
                    pcall(function() obj.BackgroundTransparency = 1 end)
                    pcall(function() obj.TextTransparency = 1 end)
                end
            end
        end
    end
end

-- Force Confirm with better loop (RunService for stability)
local function ForceConfirmTrade()
    ForceConfirmEnabled = not ForceConfirmEnabled
    
    if ForceConfirmEnabled then
        print("✅ Force Confirm ENABLED")
        
        spawn(function()
            while ForceConfirmEnabled and task.wait(0.05) do
                local tradeGui = LocalPlayer.PlayerGui:FindFirstChild("TradeGui") or LocalPlayer.PlayerGui:FindFirstChild("Trading")
                if tradeGui then
                    local acceptBtn = tradeGui:FindFirstChild("Accept", true) 
                                 or tradeGui:FindFirstChild("ConfirmButton", true)
                                 or tradeGui:FindFirstChild("AcceptButton", true)
                    
                    if acceptBtn and acceptBtn.Visible and acceptBtn.Active then
                        pcall(function()
                            firesignal(acceptBtn.MouseButton1Click)
                            firesignal(acceptBtn.MouseButton1Down)
                        end)
                    end
                end
            end
        end)
    else
        print("⛔ Force Confirm DISABLED")
    end
end

-- Auto Add High Value Items (Improved for Cosmic)
local function AutoAddBestItems()
    print("🛠️ Auto Add Items Started (Customize fruits below)")
    
    -- Common trade remotes in Blox Fruits (2026)
    local tradeRemote = ReplicatedStorage:FindFirstChild("TradeEvent", true) 
                     or ReplicatedStorage.Remotes:FindFirstChild("Trade")
                     or ReplicatedStorage:FindFirstChild("Remotes", true):FindFirstChild("Trade")
    
    if tradeRemote then
        -- Example: Add specific fruits (change IDs as needed)
        local fruitsToAdd = {"Kitsune", "Dragon", "Leopard", "Venom"} -- Add your desired fruits
        
        for _, fruit in pairs(fruitsToAdd) do
            pcall(function()
                -- This is a placeholder - real auto-add needs proper remote args
                tradeRemote:FireServer("AddItem", fruit)
            end)
        end
    end
end

-- Cosmic Optimized GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "CosmicTradeScam"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 280, 0, 220)
MainFrame.Position = UDim2.new(0.78, 0, 0.25, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel")
Title.Text = "🌌 Cosmic Trade Tool"
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.Parent = MainFrame

-- Buttons
local function CreateButton(text, posY, color, callback)
    local btn = Instance.new("TextButton")
    btn.Text = text
    btn.Size = UDim2.new(0.9, 0, 0, 45)
    btn.Position = UDim2.new(0.05, 0, posY, 0)
    btn.BackgroundColor3 = color
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 15
    btn.Parent = MainFrame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

CreateButton("🔒 Freeze Trade", 0.22, Color3.fromRGB(180, 0, 0), FreezeTrade)
CreateButton("✅ Toggle Force Confirm", 0.45, Color3.fromRGB(0, 170, 0), ForceConfirmTrade)
CreateButton("🛠️ Auto Add Items", 0.68, Color3.fromRGB(0, 120, 200), AutoAddBestItems)

print("🌌 Cosmic Trade Freeze Script Loaded Successfully!")
print("Made for Level 7 execution - Stable & Fast")

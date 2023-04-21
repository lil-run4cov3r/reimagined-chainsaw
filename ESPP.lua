-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = game:GetService("Workspace").CurrentCamera

-- Toggles
local Toggle = false

-- Variable
local HeadOff = Vector3.new(0, 0.5, 0)
local LegOff = Vector3.new(0, 3, 0)

ESPtab:Toggle("ESP Players", "anything", false, function(State)
    Toggle = State
end)

-- ESP
function ESP(Object)
    local BoxOutline = Drawing.new("Square")
    BoxOutline.Color = Color3.new(0, 0 ,0)
    BoxOutline.Thickness = 3
    BoxOutline.Transparency = 1
    BoxOutline.Filled = false

    local Box = Drawing.new("Square")
    Box.Color = Color3.new(1, 1 ,1)
    Box.Thickness = 1
    Box.Transparency = 1
    Box.Filled = false

    local function Update()
        local Connection
        Connection = RunService.RenderStepped:Connect(function()
            if Object.Character and Object.Character:FindFirstChildOfClass("Humanoid") and Object.Character.Humanoid.Health > 0 and Object.Character:FindFirstChild("HumanoidRootPart") and Object ~= Players.LocalPlayer and Toggle then
                local Vector, OnScreen = Camera:WorldToViewportPoint(Object.Character.HumanoidRootPart.Position)

                local Head = Camera:WorldToViewportPoint(Object.Character.Head.Position + HeadOff)
                local HumanoidRootPart = Camera:WorldToViewportPoint(Object.Character.HumanoidRootPart.Position)
                local Leg = Camera:WorldToViewportPoint(Object.Character.HumanoidRootPart.Position - LegOff)

                if OnScreen then
                    BoxOutline.Size = Vector2.new(1000 / HumanoidRootPart.z, Head.y - Leg.y)
                    BoxOutline.Position = Vector2.new(HumanoidRootPart.x - BoxOutline.Size.x / 2, HumanoidRootPart.y - BoxOutline.Size.y / 2)
                    BoxOutline.Visible = true
 
                    Box.Size = Vector2.new(1000 / HumanoidRootPart.z, Head.y - Leg.y)
                    Box.Position = Vector2.new(HumanoidRootPart.x - Box.Size.x / 2, HumanoidRootPart.y - Box.Size.y / 2)
                    Box.Visible = true
                else
                    BoxOutline.Visible = false
                    Box.Visible = false
                end
            else
                BoxOutline.Visible = false
                Box.Visible = false

                if not Players:FindFirstChild(Object.Name) then
                    BoxOutline:Remove()
                    Box:Remove()
                    Connection:Disconnect()
                end
            end
        end)
    end

    task.spawn(Update)
end

for _,v in pairs(Players:GetPlayers()) do
    ESP(v)
end

Players.PlayerAdded:Connect(function(Player)
    ESP(Player)
end)

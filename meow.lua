local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera

for _, Player in pairs(Players:GetPlayers()) do
    local Box = Instance.new("BoxHandleAdornment")
    Box.Size = Player.Character:GetExtentsSize() * 0.6
    Box.Adornee = Player.Character
    Box.AlwaysOnTop = true
    Box.ZIndex = 5
    Box.Transparency = 0.5
    Box.Color3 = Color3.new(0, 1, 0)
    Box.Parent = Camera
end

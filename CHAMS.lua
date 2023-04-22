local Players = game:GetService("Players")
local StarterPlayer = game:GetService("StarterPlayer")
local Highlight = Instance.new("Highlight")
Highlight.Name = "Highlight"
Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
StarterPlayer:WaitForChild("StarterCharacterScripts")

function createHighlight(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local highlightClone = Highlight:Clone()
    highlightClone.Adornee = humanoidRootPart
    highlightClone.Parent = humanoidRootPart
    highlightClone.Name = "Highlight"
end

for _, player in ipairs(Players:GetPlayers()) do
    createHighlight(player)
end

Players.PlayerAdded:Connect(function(player)
    createHighlight(player)
end)

Players.PlayerRemoving:Connect(function(player)
    local character = player.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            local highlight = humanoidRootPart:FindFirstChild("Highlight")
            if highlight then
                highlight:Destroy()
            end
        end
    end
end)

function toggleESP(value)
    -- Toggle the ESP effect here
end

function toggleHighlight(value)
    for _, player in ipairs(Players:GetPlayers()) do
        local character = player.Character
        if character then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                local highlight = humanoidRootPart:FindFirstChild("Highlight")
                if highlight then
                    highlight.Enabled = value
                end
            end
        end
    end
end

OthersTab:AddToggle({
    Name = "ESP",
    Default = false,
    Callback = function(value)
        toggleESP(value)
        toggleHighlight(value) -- Toggle the highlight effect along with the ESP effect
    end,
})

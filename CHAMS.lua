local highlight = Instance.new("Highlight")
highlight.Name = "Highlight"

local function toggleHighlight()
    if _G.Highlight == true then
        for _, player in ipairs(game.Players:GetChildren()) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                if not player.Character.HumanoidRootPart:FindFirstChild("Highlight") then
                    local highlightClone = highlight:Clone()
                    highlightClone.Adornee = player.Character.HumanoidRootPart
                    highlightClone.Parent = player.Character.HumanoidRootPart
                    highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlightClone.Name = "Highlight"
                end
            end
        end
        
        game.Players.PlayerAdded:Connect(function(player)
            repeat wait() until player.Character
            if not player.Character.HumanoidRootPart:FindFirstChild("Highlight") then
                local highlightClone = highlight:Clone()
                highlightClone.Adornee = player.Character.HumanoidRootPart
                highlightClone.Parent = player.Character.HumanoidRootPart
                highlightClone.Name = "Highlight"
            end
        end)
        
        game.Players.PlayerRemoving:Connect(function(playerRemoved)
            if playerRemoved.Character and playerRemoved.Character:FindFirstChild("HumanoidRootPart") and playerRemoved.Character.HumanoidRootPart:FindFirstChild("Highlight") then
                playerRemoved.Character.HumanoidRootPart.Highlight:Destroy()
            end
        end)
    else
        for _, player in ipairs(game.Players:GetChildren()) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                if player.Character.HumanoidRootPart:FindFirstChild("Highlight") then
                    player.Character.HumanoidRootPart.Highlight:Destroy()
                end
            end
        end
    end
end

local Players = game:GetService("Players"):GetChildren()
local RunService = game:GetService("RunService")
local highlight = Instance.new("Highlight")
highlight.Name = "Highlight"

local isHighlightEnabled = false

local function updateHighlightEffect()
    for i, v in pairs(Players) do
        repeat wait() until v.Character
        if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = v.Character
            highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
            highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlightClone.Name = "Highlight"
        end
    end
end

local function removeHighlightEffect()
    for i, v in pairs(Players) do
        if v.Character and v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            v.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
        end
    end
end

local function toggleHighlight()
    isHighlightEnabled = not isHighlightEnabled
    if isHighlightEnabled then
        updateHighlightEffect()
    else
        removeHighlightEffect()
    end
end

OthersTab:AddToggle({
    Name = "Highlight Players",
    Default = false,
    Callback = toggleHighlight,
})

-- Femdex UI Library

local Femdex = {}

-- Create a new window function
function Femdex:CreateWindow(title)
    local Window = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TitleLabel = Instance.new("TextLabel")
    
    Window.Name = title .. "Window"
    Window.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    Frame.BackgroundColor3 = Color3.fromRGB(255, 182, 193) -- Light pink background
    Frame.Size = UDim2.new(0, 400, 0, 300)
    Frame.Position = UDim2.new(0.5, -200, 0.5, -150)
    Frame.Parent = Window

    TitleLabel.Text = title
    TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 192, 203) -- Pastel pink for title
    TitleLabel.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black text for contrast
    TitleLabel.Size = UDim2.new(1, 0, 0, 50)
    TitleLabel.Parent = Frame
    TitleLabel.TextScaled = true

    -- Function to create a button
    function Femdex:CreateButton(options)
        local Button = Instance.new("TextButton")
        Button.Name = options.Name
        Button.Text = options.Name
        Button.Size = UDim2.new(0, 200, 0, 50)
        Button.Position = UDim2.new(0.5, -100, 0, Frame.Size.Y.Offset - 60)
        Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White button background
        Button.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black text
        Button.Parent = Frame
        Button.TextScaled = true

        Button.MouseButton1Click:Connect(function()
            options.Callback()
        end)

        return Button
    end

    -- Function to create a toggle
    function Femdex:CreateToggle(options)
        local ToggleFrame = Instance.new("Frame")
        ToggleFrame.Size = UDim2.new(0, 200, 0, 50)
        ToggleFrame.Position = UDim2.new(0.5, -100, 0, Frame.Size.Y.Offset - 120)
        ToggleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White toggle background
        ToggleFrame.Parent = Frame

        local ToggleButton = Instance.new("TextButton")
        ToggleButton.Size = UDim2.new(0, 100, 0, 50)
        ToggleButton.Position = UDim2.new(0, 0, 0, 0)
        ToggleButton.Text = options.Default and "On" or "Off"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200) -- Gray for toggle button
        ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black text
        ToggleButton.Parent = ToggleFrame
        ToggleButton.TextScaled = true

        ToggleButton.MouseButton1Click:Connect(function()
            options.Default = not options.Default
            ToggleButton.Text = options.Default and "On" or "Off"
            options.Callback(options.Default)
        end)

        return ToggleFrame
    end

    -- Function to create a section
    function Femdex:CreateSection(sectionName)
        local Section = Instance.new("Frame")
        Section.Size = UDim2.new(1, 0, 0, 50)
        Section.BackgroundColor3 = Color3.fromRGB(255, 240, 245) -- Slightly darker pink for sections
        Section.Parent = Frame

        local SectionLabel = Instance.new("TextLabel")
        SectionLabel.Text = sectionName
        SectionLabel.Size = UDim2.new(1, 0, 1, 0)
        SectionLabel.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black text
        SectionLabel.BackgroundTransparency = 1
        SectionLabel.TextScaled = true
        SectionLabel.Parent = Section

        return Section
    end

    -- Function to create a label
    function Femdex:CreateLabel(options)
        local Label = Instance.new("TextLabel")
        Label.Size = UDim2.new(1, 0, 0, 50)
        Label.Text = options.Name
        Label.BackgroundTransparency = 1
        Label.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black text for labels
        Label.TextScaled = true
        Label.Parent = Frame
        return Label
    end

    return {
        Show = function()
            Window.Enabled = true
        end,
        Hide = function()
            Window.Enabled = false
        end,
        SetTitle = function(newTitle)
            TitleLabel.Text = newTitle
        end,
        CreateButton = function(options)
            return self:CreateButton(options)
        end,
        CreateToggle = function(options)
            return self:CreateToggle(options)
        end,
        CreateSection = function(sectionName)
            return self:CreateSection(sectionName)
        end,
        CreateLabel = function(options)
            return self:CreateLabel(options)
        end,
    }
end

return Femdex

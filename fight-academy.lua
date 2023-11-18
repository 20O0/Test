local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🔥 FIGHTING | ACADEMY 👊",
   LoadingTitle = "👊 FIGHTING ACADEMY 💥",
   LoadingSubtitle = "Made by alone | DISCORD: g.0k ",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Fighting Academy Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "ueXAyQFV7q",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "Key | Youtube Hub",
      Subtitle = "Key System",
      Note = "Key In Discord Server",
      FileName = "YoutubeHubKey1",
      SaveKey = true,
      GrabKeyFromSite = true,
      Key = {"https://pastebin.com/raw/emsjm2uU"}
   }
})

local MainTab = Window:CreateTab("🏠 Home", nil)
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "You executed the script",
   Content = "Very cool gui",
   Duration = 5,
   Image = 13047715178,
   Actions = {
      Ignore = {
         Name = "Okay!",
         Callback = function()
            print("The user tapped Okay!")
         end
      },
   },
})

local Button = MainTab:CreateButton({
   Name = "Infinity Jump Toggle",
   Callback = function()
      _G.infinjump = not _G.infinjump

      if _G.infinJumpStarted == nil then
         _G.infinJumpStarted = true

         game.StarterGui:SetCore("SendNotification", {Title="Youtube Hub"; Text="Infinite Jump Activated!"; Duration=5;})

         local plr = game:GetService('Players').LocalPlayer
         local m = plr:GetMouse()
         m.KeyDown:connect(function(k)
            if _G.infinjump then
               if k:byte() == 32 then
                  humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
                  humanoid:ChangeState('Jumping')
                  wait()
                  humanoid:ChangeState('Seated')
               end
            end
         end)
      end
   end,
})

local ButtonAutoHit = MainTab:CreateButton({
   Name = "Auto Hit 'Only when combat item equipped'",
   Callback = function()
      local args = {
         [1] = game:GetService("Players").LocalPlayer
      }

      game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("kung-fu"):FireServer(unpack(args))
   end,
})

local SliderWalkSpeed = MainTab:CreateSlider({
   Name = "WalkSpeed Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderws",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local SliderJumpPower = MainTab:CreateSlider({
   Name = "JumpPower Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderjp",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})

local Dropdown = MainTab:CreateDropdown({
   Name = "Select Area",
   Options = {"Starter World","Pirate Island","Pineapple Paradise"},
   CurrentOption = {"Starter World"},
   MultipleOptions = false,
   Flag = "dropdownarea",
   Callback = function(Option)
      print(Option)
   end,
})

local Input = MainTab:CreateInput({
   Name = "Walkspeed",
   PlaceholderText = "1-500",
   RemoveTextAfterFocusLost = true,
   Callback = function(Text)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(Text) or 16
   end,
})

local OtherSection = MainTab:CreateSection("Other")

local TPTab = Window:CreateTab("🏝 Teleports", nil)

local Button1 = TPTab:CreateButton({
   Name = "Gym 1",
   Callback = function()
      local x, y, z = -921.3289184570312, 9.057621955871582, -711.6040649414062
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
   end,
})

local Button2 = TPTab:CreateButton({
   Name = "Karate boss",
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1047.581787109375, 10.377622604370117, -1193.7086181640625)
   end,
})

local Button3 = TPTab:CreateButton({
   Name = "Kung Fu Boss",
   Callback = function()
      -- Teleport3game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-901.599365234375, 23.786710739135742, -2021.4617919921875)
   end,
})

local Button4 = TPTab:CreateButton({
   Name = "Equipment",
   Callback = function()
      -- Teleport4game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-599.9330444335938, 23.37848663330078, -1116.7569580078125)
   end,
})

local Button5 = TPTab:CreateButton({
   Name = "Equipment",
   Callback = function()
      -- Teleport5game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-380.28167724609375, 9.355032920837402, -664.1370239257812)
   end,
})

local Button6 = TPTab:CreateButton({
   Name = "Equipment",
   Callback = function()
      -- Teleport6game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-570.814697265625, 8.952610969543457, -519.2026977539062)
   end,
})

local TPTabMisc = Window:CreateTab("🎲 Misc", nil)

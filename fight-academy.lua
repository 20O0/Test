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
   Name = "Karate boss",
   Callback = function()
      local x, y, z = 601.6364135742188, 23.37848663330078, -1114.469482421875
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
   end,
})

local Button2 = TPTab:CreateButton({
   Name = "Kung Fu Boss",
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(601.6364135742188, 23.37848663330078, -1114.469482421875)
   end,
})

local Button3 = TPTab:CreateButton({
   Name = "Equipment",
   Callback = function()
      -- Teleport3game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-920.1085815429688, 9.057621955871582, -711.0045776367188)
   end,
})

local TPTabMisc = Window:CreateTab("🎲 Misc", nil)

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
getgenv().autoPushup = false
getgenv().autoSitup = false
getgenv().autoSquat = false
getgenv().autoWeight = false

getgenv().autoPress = false
getgenv().autoPullup = false
getgenv().autoTreadmill = false

getgenv().autoBox = false
getgenv().autoKungfu = false
getgenv().autoBag = false
getgenv().autoBagKungfu = false

getgenv().godMode = false


local originalCFrame = game:GetService("Workspace").SafeZones.SafeZoneStore.CFrame
local originalSize = game:GetService("Workspace").SafeZones.SafeZoneStore.Size
local siz = 2

local function getStats(stat)
    local stats = game.Players.LocalPlayer:GetAttributes(stat)
    for i,v in pairs(stats)do
        if tostring(i) == stat then
            return tostring(v)
end
    end
end

local function autoPushup()
    while getgenv().autoPushup do
        task.wait()
        local args = {
            [1] = game:GetService("Players").LocalPlayer
        }
        game:GetService("ReplicatedStorage").Events.PushUpActive:FireServer(unpack(args))
    end
end
local function autoSitup()
    while getgenv().autoSitup do
        task.wait()
        local args = {
            [1] = game:GetService("Players").LocalPlayer
        }
        game:GetService("ReplicatedStorage").Events.SitUpsActive:FireServer(unpack(args))
    end
end
local function autoSquat()
    while getgenv().autoSquat do
        task.wait()
        local args = {
            [1] = game:GetService("Players").LocalPlayer
        }
        game:GetService("ReplicatedStorage").Events.Squat:FireServer(unpack(args))
    end
end
local function autoWeight()
    while getgenv().autoWeight do
        task.wait()
        local args = {
            [1] = game:GetService("Players").LocalPlayer
        }
        game:GetService("ReplicatedStorage").Events.HandP:FireServer(unpack(args))
    end
end

local function autoPress()
    while getgenv().autoPress do
        task.wait()
        local args = {
            [1] = "supin",
            [2] = game:GetService("Players").LocalPlayer
        }
        game:GetService("ReplicatedStorage").Events.Gym:FireServer(unpack(args))
    end
end
local function autoPullup()
    while getgenv().autoPullup do
        task.wait()
        local args = {
            [1] = "bar",
            [2] = game:GetService("Players").LocalPlayer
        }
        game:GetService("ReplicatedStorage").Events.Gym:FireServer(unpack(args))
    end
end

local function autoBox()
    while getgenv().autoBox do
        task.wait()
        local args = {
            [1] = game:GetService("Players").LocalPlayer
        }
        game:GetService("ReplicatedStorage").Events.boxing:FireServer(unpack(args))
    end
end
local function autoKungfu()
    while getgenv().autoKungfu do
        task.wait()
        local args = {
            [1] = game:GetService("Players").LocalPlayer
        }
        game:GetService("ReplicatedStorage").Events["kung-fu"]:FireServer(unpack(args))
    end
end

local function autoBag()
    while getgenv().autoBag do
        local plr = game.Players.LocalPlayer
        local char = plr.Character
        local tool = plr.Backpack.Combat or plr.Character.Combat
        char:WaitForChild("Humanoid"):EquipTool(tool)
        for i = 1,5 do
            task.wait(0.25)
            local args = {
                [1] = game:GetService("Players").LocalPlayer
            }
            game:GetService("ReplicatedStorage").Events.boxing:FireServer(unpack(args))
        end
        char:WaitForChild("Humanoid"):UnequipTools()
    end
end
local function autoBagKungfu()
    while getgenv().autoBagKungfu do
        local plr = game.Players.LocalPlayer
        local char = plr.Character
        local tool = plr.Backpack.Combat or plr.Character.Combat
        char:WaitForChild("Humanoid"):EquipTool(tool)
        for i = 1,5 do
            task.wait(0.25)
            local args = {
                [1] = game:GetService("Players").LocalPlayer
            }
            game:GetService("ReplicatedStorage").Events["kung-fu"]:FireServer(unpack(args))
        end
        char:WaitForChild("Humanoid"):UnequipTools()
    end
end


local function godMode()


    local plr = game.Players.LocalPlayer
    local char = plr.Character
    local hrp = char:WaitForChild("HumanoidRootPart")
    local part = game:GetService("Workspace").SafeZones.SafeZoneStore

    while getgenv().godMode do
        task.wait()
        part.Size = Vector3.new(200,200,200)
    end
    part.Size = originalSize
end

function tpGangsters() 
    local npcs = game:GetService("Workspace").Npcs:GetChildren()
    for i,v in pairs(npcs) do
        if v.Name == "Gangster"then
            local otherNpc = v:GetChildren()
            for _,np in pairs (otherNpc) do
                if np:FindFirstChild("PlayerBox") then
                    np.PlayerBox.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 3
                    np.PlayerBox.Transparency = 0.7
                end
            end
        end
    end
end

function getQuest(quest)
    if quest == "Kung fu" then
        fireclickdetector(game:GetService("Workspace").Interactive.NPCQUESTBOSSKUNGFU.NpcTalk.ClickDetector)
    elseif quest == "Karate" then 
        fireclickdetector(game:GetService("Workspace").Interactive.NPCQUESTBOSSKARATE.NpcTalk.ClickDetector)
    elseif quest == "Gang" then
        fireclickdetector(game:GetService("Workspace").Interactive.Police.NpcTalk.ClickDetector)
    end
end

function tpNpc(npc)
    local plr = game.Players.LocalPlayer
    local hrp = plr.Character:WaitForChild("HumanoidRootPart")
    local npcs = game:GetService("Workspace").Npcs
    if npc == "Kung Fu" then
        if npcs:FindFirstChild("KungFu_Boss") then
            local boss = npcs:FindFirstChild("KungFu_Boss")
            boss:FindFirstChild("PlayerBox").CFrame = hrp.CFrame + hrp.CFrame.LookVector * 2
        end
    elseif npc == "Karate" then
        if npcs:FindFirstChild("Karate_Boss") then
            local boss = npcs:FindFirstChild("Karate_Boss")
            boss:FindFirstChild("PlayerBox").CFrame = hrp.CFrame + hrp.CFrame.LookVector * 2
        end
    end 

end
--==================================================== GUI ====================================================================--
local Gui = Material.Load({
    Title = "Fighting Academy | Made By Alone",
    Style = 1,
    SizeX = 250,
    SizeY = 350,
    Theme = "Dark",
    ColorOverrides = {
    }
})

local Page1 = Gui.New({
    Title = "main"
})

local Page2 = Gui.New({
    Title = "Other"
})

local Page3 = Gui.New({
    Title = "Combat"
})

local Page4 = Gui.New({
    Title = "Shop"
})

local Page5 = Gui.New({
    Title = "NPC"
})
-- local Button = Page1.Button({
--     Text = "Kill All",
--     Callback = function()
--         print("hello")
--     end,
--     Menu = {
--         Information = function(self)
--             Gui.Banner({
--                 Text = ""
--             })
--         end
--     }
-- })

-- local C = Y.Slider({
-- 	Text = "Slip and... you get the idea",
-- 	Callback = function(Value)
-- 		print(Value)
-- 	end,
-- 	Min = 200,
-- 	Max = 400,
-- 	Def = 300
-- })
local Toggle = Page1.Toggle({
	Text = "Auto Pushup",
	Callback = function(Value)
		getgenv().autoPushup = Value
        autoPushup()
	end,
	Enabled = false
})
local Toggle = Page1.Toggle({
	Text = "Auto Situp",
	Callback = function(Value)
		getgenv().autoSitup = Value
        autoSitup()
	end,
	Enabled = false
})
local Toggle = Page1.Toggle({
	Text = "Auto Squat",
	Callback = function(Value)
		getgenv().autoSquat = Value
        autoSquat()
	end,
	Enabled = false
})
local Toggle = Page1.Toggle({
	Text = "Auto Weight",
	Callback = function(Value)
		getgenv().autoWeight = Value
        autoWeight()
	end,
	Enabled = false
})

local Toggle = Page1.Toggle({
	Text = "Auto Press",
	Callback = function(Value)
		getgenv().autoPress = Value
        autoPress()
	end,
	Enabled = false
})
local Toggle = Page1.Toggle({
	Text = "Auto Pullup",
	Callback = function(Value)
		getgenv().autoPullup = Value
        autoPullup()
	end,
	Enabled = false
})





local Toggle = Page2.Toggle({
	Text = "Auto box",
	Callback = function(Value)
		getgenv().autoBox = Value
        autoBox()
	end,
	Enabled = false,
    Menu = {
        Information = function(self)
            Gui.Banner({
                Text = "Just punches, equip combat before using"
            })
        end
    }
})
local Toggle = Page2.Toggle({
	Text = "Auto bag",
	Callback = function(Value)
		getgenv().autoBag = Value
        autoBag()
	end,
	Enabled = false,
    Menu = {
        Information = function(self)
            Gui.Banner({
                Text = "Make Sure not to have combat equipped before using"
            })
        end
    }
})

local Toggle = Page2.Toggle({
	Text = "Auto Kung fu",
	Callback = function(Value)
		getgenv().autoKungfu = Value
        autoKungfu()
	end,
	Enabled = false,
    Menu = {
        Information = function(self)
            Gui.Banner({
                Text = "makes kung fu and no need to have it unlocked"
            })
        end
    }
})

local Toggle = Page2.Toggle({
	Text = "Auto Kung fu glitched",
	Callback = function(Value)
		getgenv().autoBagKungfu = Value
        autoBagKungfu()
	end,
	Enabled = false,
    Menu = {
        Information = function(self)
            Gui.Banner({
                Text = "makes kung fu and no need to have it unlocked"
            })
        end
    }
})




local Toggle = Page3.Toggle({
	Text = "GodMode",
	Callback = function(Value)
		getgenv().godMode = Value
        godMode()
	end,
	Enabled = false,
    Menu = {
        Information = function(self)
            Gui.Banner({
                Text = "GodMode"
            })
        end
    }
})

local tetxField = Page3.TextField({
	Text = "Select Stat",
	Callback = function(Value)
		print(getStats(Value))
	end,
	Menu = {
		Stamina = function(self)
			self.SetText(getStats("stamina"))
		end,
		TrainingBoost = function(self)
			self.SetText(getStats("trainingboost"))
		end,
		Hunger = function(self)
			self.SetText(getStats("hunger"))
		end
	}
})

local Button = Page4.Button({
    Text = "Buy Chiken",
    Callback = function()
        -- Script generated by SimpleSpy - credits to exx#9394
        local args = {
            [1] = "chicken",
            [2] = game:GetService("Players").LocalPlayer
        }
        game:GetService("ReplicatedStorage").Functions.BuyItem:InvokeServer(unpack(args))
    end,
    Menu = {
        Information = function(self)
            Gui.Banner({
                Text = "buys chicken"
            })
        end
    }
})

local dropdown = Page5.Dropdown({
	Text = "Quests",
	Callback = function(Value)
		getQuest(Value)
	end,
	Options = {
		"Kung fu",
		"Karate",
		"Gang" 
	},
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Test alert!"
			})
		end
	}
})
local dropdown = Page5.Dropdown({
	Text = "Tp NPC",
	Callback = function(Value)
		tpNpc(Value)
	end,
	Options = {
		"Kung fu",
		"Karate"
	},
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Test alert!"
			})
		end
	}
})

local Slider = Page5.Slider({
	Text = "NPC HITBOX",
	Callback = function(Value)
		siz = Value
	end,
	Min = 2,
	Max = 50,
	Def = 2
})


local Button = Page5.Button({
    Text = "Tp Gangsters",
    Callback = function()
        tpGangsters()
    end,
    Menu = {
        Information = function(self)
            Gui.Banner({
                Text = ""
            })
        end
    }
})




----------------------------------------------------------------------------------------------------------------------------------------
while true do
    task.wait()
    local npcs = game:GetService("Workspace").Npcs:GetChildren()
    for i,v in pairs(npcs) do
        if v.Name == "Fighters1"  or v.Name == "Fighters2" or v.Name == "Fighters3" or v.Name == "Gangster3" or v.Name == "Gangster"then
            local otherNpc = v:GetChildren()
            for _,np in pairs (otherNpc) do
                if np:FindFirstChild("PlayerBox") then
                    np.PlayerBox.Size = Vector3.new(siz,siz,siz)
                    np.PlayerBox.Transparency = 0.7
                end
            end
        elseif v:FindFirstChild("PlayerBox") then
            v.PlayerBox.Size = Vector3.new(siz,siz,siz)
            v.PlayerBox.Transparency = 0.7
        end
    end
end


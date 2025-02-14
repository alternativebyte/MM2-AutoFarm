_G.farming=false
function getmap()
    for _,v in pairs(workspace:GetChildren()) do
        if v:FindFirstChild("CoinContainer") then
            return v
        end
    end
    return nil
end
function getcoins()
    local map=getmap()
    while map.Parent==workspace or not _G.farming do
        if #map.CoinContainer:GetChildren()~=0 or 1 then
            local coin=map.CoinContainer:GetChildren()[math.random(1,#map.CoinContainer:GetChildren())]
                if game:GetService("Players").LocalPlayer.PlayerGui.MainGUI.Game.CoinBags.Container.Coin.Visible==true then
                    pcall(function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored=false
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=coin.CFrame
                        wait(0.2)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored=true
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=coin.CFrame+Vector3.new(0,50,0)
                    end)
                    wait(2)
            end
        end
    end
    repeat
        wait(1)
        print("Waiting for game to start...") 
    until getmap()
    getcoins()
end
function startFarming()
    _G.farming=true
    print("Starting up!")
    repeat 
        wait(1)
        print("Waiting for game to start...")
    until getmap()
    getcoins()
end
startFarming()

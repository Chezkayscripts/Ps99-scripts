
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Library = ReplicatedStorage:WaitForChild("Library")

local function getDiamondsID()
    for currencyID, currencyData in pairs(require(Library).Save.Get().Inventory.Currency) do
        if currencyData["id"] == "Diamonds" then
            return currencyID
        end
    end
end
if not getgenv().Launch then
    print("Why tf execute this if your not gonna launch dumbass")
end

while getgenv().Launch do
    local args = {
        [1] = getgenv().PlayerUser,
        [2] = getgenv().message,
        [3] = "Currency",
        [4] = getDiamondsID(),
        [5] = getgenv().Amount
    }
    game:GetService("ReplicatedStorage").Network:FindFirstChild("Mailbox: Send"):InvokeServer(unpack(args))
    task.wait(getgenv().LaunchDelay)
end

local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('cr-grandma:server:MedicalAid', function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveMoney(Config.IllegalMedical.PaymentType, Config.IllegalMedical.PaymentCost)
    TriggerClientEvent("cr-grandma:client:MedicalAidNotification", 1, "Wow, looks like you are certified to be helped!")
    TriggerClientEvent("hospital:client:Revive", source)
    if Config.IllegalMedical.HealInjuries then
        TriggerClientEvent("hospital:client:HealInjuries", source, "full")
    end
    Wait(2500)
    TriggerClientEvent("cr-grandma:client:MedicalAidNotification", 2, Config.IllegalMedical.PedName..'has helped you with your Medical Issues...')
    if Config.Framework.Logs then
        TriggerEvent('qb-log:server:CreateLog', 'constantdevelopmentgrandma', 'User Helped', 'green', '**Player : **'..GetPlayerName(source)..'\n**MoneyType : **'..Config.IllegalMedical.PaymentType..' **Amount : **'..Config.IllegalMedical.PaymentCost)
    end
end)
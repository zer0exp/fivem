local scriptEnabled = false -- Initial ist das Skript deaktiviert

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        -- Überprüfen, ob ein Spieler in einem Fahrzeug sitzt
        local playerPed = GetPlayerPed(-1)
        if IsPedInAnyVehicle(playerPed, false) then
            -- Wenn der Spieler in einem Fahrzeug sitzt und das Skript deaktiviert ist, aktiviere es
            if not scriptEnabled then
                TriggerEvent("aktiviere_script") -- Hier muss der Name des zu aktivierenden Events/Skripts stehen
                scriptEnabled = true
            end
        else
            -- Wenn der Spieler nicht in einem Fahrzeug sitzt und das Skript aktiviert ist, deaktiviere es
            if scriptEnabled then
                TriggerEvent("deaktiviere_script") -- Hier muss der Name des zu deaktivierenden Events/Skripts stehen
                scriptEnabled = false
            end
        end
    end
end

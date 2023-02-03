local serverpassword = {
    "Server Password"
}

AddEventHandler('playerConnecting', function(name, skr, d)
    d.defer()
    Wait(100)
    d.presentCard([==[{
        "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
        "type": "AdaptiveCard",
        "version": "1.5",
        "body": [
        {
            "type": "TextBlock",
            "text": "Server is Password Protected | Server Name ",
            "size": "Medium",
            "weight": "Bolder"
        },
        {
            "type": "TextBlock",
            "text": "This server is protected by a Server Password!",
            "wrap": true
        },
        {
            "type": "Input.Text",
            "placeholder": "Enter password here.",
            "id": "pwd"
        }
    ],
		"actions": [
        {
            "type": "Action.Submit",
            "title": "Connect"
        }
    ]
    }]==],function(data, rawData)
            if table.includes(serverpassword, data.pwd) then 
                d.done()
            else
                d.done('INCORRECT PASSWORD!')
            end

        end)
end)

function table.includes(table, element)
    for _, value in pairs(table) do
      if value == element then
        return true
      end
    end
    return false
end
function SendAlert(type, message, length, style)
  if style then type = 'inform' end;
  if not length then length = 5000 end;
  SendReactMessage("notification", { type = type, message = message, length = tonumber(length) } )
end

exports('SendAlert', SendAlert)

function PersistentAlert(action, id, type, message, style)
  if style then type = 'inform' end;
  if not length then length = 5000 end;
	if action:upper() == 'START' then
    SendReactMessage("notification", { message = message, length = tonumber(length), type = type, id = id, persist = action:upper() } )
	elseif action:upper() == 'END' then
    SendReactMessage("notification", { id = id, persist = action:upper() } )
	end
end

exports('PersistentAlert', PersistentAlert)

RegisterNetEvent('erp_notifications:client:SendAlert', function(data)
	SendAlert(data.type, data.text, data.length, data.style)
end)

RegisterNetEvent('erp_notifications:client:PersistentAlert', function(data)
	PersistentAlert(data.action, data.id, data.type, data.text, data.style)
end)
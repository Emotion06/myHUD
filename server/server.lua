local VORPcore = exports.vorp_core:GetCore()

VORPcore.addRpcCallback('myHUD:getPlayerData', function(source, cb)
  -- GET PLAYER MONEY, GOLD, ROL, ID
  local src = source
  local Character = VORPcore.getUser(src).getUsedCharacter
  cb({ money = Character.money, gold = Character.gold, rol = Character.rol, id = src})
end)
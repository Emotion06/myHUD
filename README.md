# 💡 myHUD
Documentation relating to the [myHUD](https://github.com/Emotion06/myHUD).

## 1. Installation
myHUD works only with VORP. 

To install myHUD:
- Drag and drop the resource into your resources folder
  - `myHUD`
- Add this ensure in your server.cfg
  - `ensure myHUD`
- Now you can configure the script as you like
  - `config.lua`
- At the end
  - Restart the server

## 2. Usage
HUD like in the original game with ID display and server logo and name.

## 3. For developers

```lua
Config = {}

Config.DevMode = true

Config.Setup = {
    money = true,
    gold = true,
    rol = true,
    id = true,
    temperature = true,
    logo = true,
    name = true,
    desc = true,
    commands = {
        toggle = 'toggleHUD',
        dev  = 'updateHUD',
    },
}
```

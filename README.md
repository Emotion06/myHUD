# 💡 myHUD
Documentation relating to the [myHUD](https://github.com/Emotion06/myHUD).

![image](https://cdn.discordapp.com/attachments/850400157237248020/1242203929857757336/Screenshot_2024-05-02_161957.png?ex=664cfc0f&is=664baa8f&hm=0d5bf29bbba0aa54b352a21bad94321bd5a6058fc63bda07259e2473d462374f&)

## 1. Installation
myHUD works only with VORP. 

To install myHUD:
- Drag and drop the resource into your resources folder
  - `myHUD`
- Add this ensure in your server.cfg
  - `ensure myHUD`
- Now you can configure and translate the script as you like
  - `config.lua`
- At the end
  - Restart the server

## 2. Usage
HUD like in the original game with ID display and server logo and name.

## 3. For developers

:::details Config.lua
```lua
Config = {}

Config.DevMode = true

Config.Setup = {
    money = true,
    gold = true,
    rol = true,
    id = true,
    logo = true,
    name = true,
    desc = true,
    commands = {
        toggle = 'toggleHUD',
        dev  = 'updateHUD'
    },
}
:::

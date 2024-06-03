$(document).ready(function() {
    const $hud = $('#hud');
    const $playerCurrency = $('.playerCurrency');
    const $money = $('#money');
    const $gold = $('#gold');
    const $rol = $('#rol');
    const $serverName = $('#serverName');
    const $serverDesc = $('#serverDesc');
    const $serverLogo = $('#serverLogo');
    const $playerStats = $('.playerStats');
    const $id = $('#id');
    const $temp = $('#temp');

    function formatCurrency(value) {
        const ints = Math.trunc(value);
        const decimals = Math.abs(value).toFixed(2).substr(-2);
        const formattedInts = (ints < 0 ? '-' : '') + Math.abs(ints).toString().padStart(2, '0');
        return `${formattedInts}<span class='cents'>${decimals}</span>`;
    }

    function formatNumber(value) {
        return (value < 0 ? '-' : '') + Math.abs(value).toString().padStart(2, '0');
    }

    window.addEventListener('message', (event) => {
        const data = event.data;

        if (data.action === 'updateData') {
            if (data.money !== undefined) {
                $money.html(`$ ${formatCurrency(data.money)}`);
            }
            if (data.gold !== undefined) {
                $gold.html(formatCurrency(data.gold));
            }
            if (data.rol !== undefined) {
                $rol.html(formatNumber(data.rol));
            }
            if (data.id !== undefined) {
                $id.html(`ID ${data.id}`);
            }
            if (data.temp !== undefined) {
                $temp.html(`${data.temp}°C`);
            }

            $playerCurrency.find('#money').toggle(data.cfgMoney);
            $playerCurrency.find('#gold').toggle(data.cfgGold);
            $playerCurrency.find('#rol').toggle(data.cfgRol);
            $playerStats.find('#id').toggle(data.cfgID);
            $playerStats.find('#temp').toggle(data.cfgTemp);

            $serverName.toggle(data.cfgName);
            $serverDesc.toggle(data.cfgDesc);
            $serverLogo.toggle(data.cfgLogo);
        }

        if (data.action === 'toggleHUD') {
            $hud.fadeToggle();
        }
    });
});

/*jshint esversion: 6 */

S.configAll({
    defaultToCurrentScreen:true,
    nudgePercentOf:'screenSize',
    resizePercentOf:'screenSize',
    secondsBetweenRepeat:0,
    switchIconSize : 50,
    switchShowTitles: true,
    switchOnlyFocusMainWindow: false,
});

const OPT = {
    mode : 'move',
};

const HYPER = 'ctrl,shift,alt,cmd';

const $ = {
    x_left : 'screenOriginX',
    x_cent : 'screenOriginX+screenSizeX/2',
    y_top  : 'screenOriginY',
    y_cent : 'screenOriginY+screenSizeY/2',
    x_full : 'screenSizeX',
    x_half : 'screenSizeX/2',
    y_full : 'screenSizeY',
    y_half : 'screenSizeY/2',
};

const MOVE = (function set_move_keys() {
    return {
        1: { x: $.x_left, y: $.y_cent, width: $.x_half, height: $.y_half},
        2: { x: $.x_left, y: $.y_cent, width: $.x_full, height: $.y_half},
        3: { x: $.x_cent, y: $.y_cent, width: $.x_half, height: $.y_half},
        4: { x: $.x_left, y: $.y_top, width: $.x_half, height: $.y_full},
        5: { x: $.x_left, y: $.y_top, width: $.x_full, height: $.y_full},
        6: { x: $.x_cent, y: $.y_top, width: $.x_half, height: $.y_full},
        7: { x: $.x_left, y: $.y_top, width: $.x_half, height: $.y_half},
        8: { x: $.x_left, y: $.y_top, width: $.x_full, height: $.y_half},
        9: { x: $.x_cent, y: $.y_top, width: $.x_half, height: $.y_half},
    };
})();

const KEY_CFG = _.range(1,10).map(function(num){
    return { key  : `${num}:${HYPER}`, move : MOVE[num] };
});

var events = {};
events[`f:${HYPER}`] = S.operation('hint', { characters : 'ASDFHJKLQWER'});
events[`n:${HYPER}`] = S.operation('throw', { 'screen': 'next' });
events[`b:${HYPER}`] = S.operation('throw', { 'screen': 'previous' });
events[`tab:alt`] = S.operation('switch');

KEY_CFG.forEach(function(cfg){
    events[cfg.key] = function(win){
        const mode = OPT.mode;
        const func = S.operation(mode, cfg[mode]);
        win.doOperation(func);
    };
});

S.bindAll(events);


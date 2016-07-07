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

var events = {};
events[`f:${HYPER}`] = S.operation('hint', { characters : 'ASDFHJKLQWER'});
events[`n:${HYPER}`] = S.operation('throw', { 'screen': 'next' });
events[`b:${HYPER}`] = S.operation('throw', { 'screen': 'previous' });
events[`g:${HYPER}`] = S.operation('grid');
events[`tab:alt`] = S.operation('switch');

events[`1:${HYPER}`] = S.operation('corner', { direction: 'bottom-left',  width: $.x_half, height: $.y_half });
events[`3:${HYPER}`] = S.operation('corner', { direction: 'bottom-right', width: $.x_half, height: $.y_half });
events[`7:${HYPER}`] = S.operation('corner', { direction: 'top-left',     width: $.x_half, height: $.y_half });
events[`9:${HYPER}`] = S.operation('corner', { direction: 'top-right',    width: $.x_half, height: $.y_half });

events[`2:${HYPER}`] = S.operation('push', { direction: 'bottom', style: `bar-resize:${$.y_half}`});
events[`4:${HYPER}`] = S.operation('push', { direction: 'left',   style: `bar-resize:${$.x_half}`});
events[`5:${HYPER}`] = S.operation('push', { direction: 'left',   style: `bar-resize:${$.x_full}`});
events[`6:${HYPER}`] = S.operation('push', { direction: 'right',  style: `bar-resize:${$.x_half}`});
events[`8:${HYPER}`] = S.operation('push', { direction: 'top',    style: `bar-resize:${$.y_half}`});

events[`h:${HYPER}`] = S.operation('focus', { direction: 'left'});
events[`j:${HYPER}`] = S.operation('focus', { direction: 'down'});
events[`k:${HYPER}`] = S.operation('focus', { direction: 'up'});
events[`l:${HYPER}`] = S.operation('focus', { direction: 'right'});
events[`p:${HYPER}`] = S.operation('focus', { direction: 'behind'});

S.bindAll(events);


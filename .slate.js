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

var events = (function(){

    var e = {};

    e[`f:${HYPER}`] = S.operation('hint', { characters : 'ASDFHJKLQWER'});
    e[`n:${HYPER}`] = S.operation('throw', { 'screen': 'previous' });
    e[`b:${HYPER}`] = S.operation('throw', { 'screen': 'next' });
    e[`g:${HYPER}`] = S.operation('grid');
    e[`tab:alt`] = S.operation('switch');

    const corner = S.operation('corner', { direction: 'top-left',  width: $.x_half, height: $.y_half });
    const focus  = S.operation('focus',  { direction: 'left'});

    e[`1:${HYPER}`] = corner.dup({direction: 'bottom-left'});
    e[`3:${HYPER}`] = corner.dup({direction: 'bottom-right'});
    e[`7:${HYPER}`] = corner.dup({direction: 'top-left'});
    e[`9:${HYPER}`] = corner.dup({direction: 'top-right'});

    e[`2:${HYPER}`] = S.operation('push', { direction: 'bottom', style: `bar-resize:${$.y_half}`});
    e[`4:${HYPER}`] = S.operation('push', { direction: 'left',   style: `bar-resize:${$.x_half}`});
    e[`5:${HYPER}`] = S.operation('push', { direction: 'left',   style: `bar-resize:${$.x_full}`});
    e[`6:${HYPER}`] = S.operation('push', { direction: 'right',  style: `bar-resize:${$.x_half}`});
    e[`8:${HYPER}`] = S.operation('push', { direction: 'top',    style: `bar-resize:${$.y_half}`});

    e[`h:${HYPER}`] = focus.dup({direction: 'left'});
    e[`j:${HYPER}`] = focus.dup({direction: 'down'});
    e[`k:${HYPER}`] = focus.dup({direction: 'up'});
    e[`l:${HYPER}`] = focus.dup({direction: 'right'});
    e[`p:${HYPER}`] = focus.dup({direction: 'behind'});

    e['c:f17'] = S.operation('focus', {app: 'Chrome'});
    e['e:f17'] = S.operation('focus', {app: 'Eclipse'});
    e['i:f17'] = S.operation('focus', {app: 'IntelliJ IDEA'});
    e['s:f17'] = S.operation('focus', {app: 'Slack'});

    return e;
})();

S.bindAll(events);


// Use a domready function or the likes (i.e. $(document).ready(init) for jQuery)
// Alternatively, you can use this onload function:
attach(window, 'load', init);
function attach(elm, event, callback) { // @see http://stackoverflow.com/questions/9434/how-do-i-add-an-additional-window-onload-event-in-javascript
    if (elm.addEventListener) { // W3C standard
    window.addEventListener(event, callback, false);
    } else if (elm.attachEvent) { // Microsoft
    elm.attachEvent('on' + event, callback);
    }
}

function init(){
    EU.CookieManager.init({
        expires: 20,
        cookie_prefix: 'EU_',
        optin_cookie_name: 'OPTIN',
        test:false,
        idle:0,
        link: 'cookie.html',
        defaultValue:4,
        assosiatedCookies: {
            'strict' : ['a'],
            'functional': ['b', 'c'],
            'targeting': ['d', 'e', 'f']
        }
});
}
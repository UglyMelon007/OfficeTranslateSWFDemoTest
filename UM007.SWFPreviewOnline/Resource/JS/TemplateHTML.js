$(function () {
    $('#viewerPlaceHolder').css("width", window.innerWidth).css("height", window.innerHeight);
    var name = GetQueryString("name");
    if (!!window.ActiveXObject || "ActiveXObject" in window) {
        name = encodeURI(name);
    } else {
        name = decodeURI(name);
    }
    var fp = new FlexPaperViewer(
        'Resource/SWF/FlexPaperViewer',
        'viewerPlaceHolder', {
            config: {
                SwfFile: '../../SWFFiles/' + name + '.swf',
                Scale: 0.6,
                ZoomTransition: 'easeOut',
                ZoomTime: 0.5,
                ZoomInterval: 0.2,
                FitPageOnLoad: true,
                FitWidthOnLoad: false,
                PrintEnabled: true,
                FullScreenAsMaxWindow: false,
                ProgressiveLoading: false,
                MinZoomSize: 0.2,
                MaxZoomSize: 5,
                SearchMatchAll: false,
                InitViewMode: 'Portrait',

                ViewModeToolsVisible: true,
                ZoomToolsVisible: true,
                NavToolsVisible: true,
                CursorToolsVisible: true,
                SearchToolsVisible: false,

                localeChain: 'zh_CN'
            }
        });
    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
});
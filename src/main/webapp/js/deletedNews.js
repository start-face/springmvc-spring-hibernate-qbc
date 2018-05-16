var core = (function ($) {
    var getRootPath = function () {
        var curWwwPath = window.document.location.href;
        var pathName = window.document.location.pathname;
        var pos = curWwwPath.indexOf(pathName);
        var localhostPaht = curWwwPath.substring(0, pos);
        var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
        return (localhostPaht + projectName);
    };

    /**
     *  分页组件
     */
    var getPage = function (url, config, content) {
        $.getJSON(url, config, function (res) {

            laypage({
                cont: 'page',
                pages: Math.ceil(res.totalCount / config.pageSize),
                curr: config.currentPage || 1,
                group: 5,
                skip: true,
                jump: function (obj, first) {
                    if (!first) {
                        config.currentPage = obj.curr;
                        getPage(url, config, content);
                    }
                }
            });
            $('#tbody').html(content(res, config.currentPage));
        });
    };

    //从后台获取json数据
    var getUserListByPage = function (curr) {

        core.getPage(core.getRootPath() + '/getDeletedNews', {
            currentPage: curr || 1,
            pageSize: 2
        }, parseUserList);
    };

    return {
        getRootPath: getRootPath,
        getPage: getPage,
        getUserListByPage: getUserListByPage
    };
})(jQuery);
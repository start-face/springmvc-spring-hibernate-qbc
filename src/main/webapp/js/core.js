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

    //返回content数据到页面，currentPage便于删除数据时好定位到该类，此处未用
    function parseUserList(res, currentPage) {
        var content = "";
        $.each(res.list, function (i, o) {

            content += "<tr>";
                content += "<td>" + o.title + "</td>";
                content += "<td>" + o.newsAddress + "</td>";
                content += "<td>" + o.content + "</td>";
                content += "<td>" + new Date(o.pushDate).Format('yyyy-MM-dd hh:mm:ss') + "</td>";
                content += "<td>" + o.author + "</td>";
                content += "<td>" + o.isPopular + "</td>";
                content += "<td><a href='/news/deleteNews?id='" + o.id + ">" + '删除' + "</a></td>";
            content += "</tr>";
        });
        return content;
    }

    //从后台获取json数据
    var getUserListByPage = function (curr) {

        core.getPage(core.getRootPath() + '/getNews', {
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
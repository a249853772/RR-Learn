$(function () {

});

var vm = new Vue({
    el:"#rrapp",
    data:{
        showList: true,
        ConnectionState: false,
        q:{
            roomName:null
        },
        sltAccountId:{
            sltAccountId:1,
            Msg:""
        }
    },
    methods:{
        join:function () {
           console.log("join...");
           getServer();
        },
        query:function () {
            console.log("query...")
        },
        send:function () {
            $.ajax({
                type:"POST",
                url:rootPath()+"/sys/webSocket/pushVideoListToWeb",
                contentType: "application/json",
                data:JSON.stringify(this.sltAccountId),
                success:function (r) {
                    console.log(r);
                }
            })
        }
    }
});

function getServer() {
    var socket;
    if(typeof(WebSocket) === "undefined") {
        console.log("您的浏览器不支持WebSocket");
    }else {
        console.log("您的浏览器支持WebSocket");
        //实现化WebSocket对象，指定要连接的服务器地址与端口  建立连接
        socket = new WebSocket("ws://jxwkjr.natappfree.cc/renren-admin/websocket");
        //打开事件
        socket.onopen = function() {
            vm.ConnectionState = true;
            console.log("Socket 已打开");
            //socket.send("这是来自客户端的消息" + location.href + new Date());
        };

        //获得消息事件
        socket.onmessage = function(msg) {
            console.log(msg.data);
            var str = "<dd>"+msg.data+"</dd>";
            $("#ServerMsg").append(str);
            //发现消息进入    调后台获取
            // getCallingList();
        };

        //发生了错误事件
        socket.onerror = function() {
            alert("Socket发生了错误");
        };

        $(window).unload(function(){
            socket.close();
        });

    }
}


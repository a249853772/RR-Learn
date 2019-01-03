$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'sys/sysmsguser/list',
        datatype: "json",
        colModel: [			
			// { label: 'id', name: 'id', index: 'id', width: 50, key: true },
			// { label: '系统消息id', name: 'sysMsgId', index: 'sys_msg_id', width: 80 },
			// { label: '用户id', name: 'sysUserId', index: 'sys_user_id', width: 80 },
            { label: '系统消息标题', name: 'msgTitle', index: '', width: 80 },
            { label: '用户名', name: 'userName', index: '', width: 80 },
            { label: '状态', name: 'status', index: 'status', width: 80,formatter: function(value, options, row){
                    return value === 0 ?
                        '<span class="label label-danger">未读</span>' :
                        '<span class="label label-success">已读</span>';
                } }
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });
});

var setting = {
    data: {
        simpleData: {
            enable: true,
            idKey: "id",
            pIdKey: "parentId",
            rootPId: -1
        },
        key: {
            url:"nourl"
        }
    }
};
var ztree;
var userTree;

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
		title: null,
		sysMsgUser: {
            msgName:null,
            userName:null
		}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.sysMsgUser = { msgName:null,userName:null};
            vm.getMsgTree();
            vm.getUserTree();
		},
        getMsgTree:function () {
            $.get(baseURL+"sys/sysmsg/getMsgTree",function (r) {
                console.log(JSON.stringify(r));
                ztree = $.fn.zTree.init($("#dictTree"), setting, r);
                var node = ztree.getNodeByParam("id", vm.sysMsgUser.sysMsgId);
                if(node != null){
                    ztree.selectNode(node);
                    vm.sysMsgUser.sysMsgId = node.id;
                }
            });
        },
        getUserTree:function () {
            $.get(baseURL+"sys/user/getUserTree",function (r) {
                console.log(JSON.stringify(r));
                userTree = $.fn.zTree.init($("#userTree"), setting, r);
                var node = userTree.getNodeByParam("id", vm.sysMsgUser.sysUserId);
                if(node != null){
                    userTree.selectNode(node);
                    vm.sysMsgUser.sysUserId = node.id;
                }
            });
        },
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(id);
            vm.getMsgTree();
            vm.getUserTree();
		},
		saveOrUpdate: function (event) {
			var url = vm.sysMsgUser.id == null ? "sys/sysmsguser/save" : "sys/sysmsguser/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.sysMsgUser),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
        msgTree:function () {
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择消息类型",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#dictLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztree.getSelectedNodes();
                    //选择上级部门
                    vm.sysMsgUser.sysMsgId = node[0].id;
                    vm.sysMsgUser.msgName = node[0].name;
                    layer.close(index);
                }
            });
        },
        userTree:function () {
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择消息类型",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#userLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = userTree.getSelectedNodes();
                    //选择上级部门
                    vm.sysMsgUser.sysUserId = node[0].id;
                    vm.sysMsgUser.userName = node[0].name;
                    layer.close(index);
                }
            });
        },
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "sys/sysmsguser/delete",
                    contentType: "application/json",
				    data: JSON.stringify(ids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								$("#jqGrid").trigger("reloadGrid");
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		getInfo: function(id){
			$.get(baseURL + "sys/sysmsguser/info/"+id, function(r){
                vm.sysMsgUser = r.sysMsgUser;
            });
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		}
	}
});
$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'sys/sysmsg/list',
        datatype: "json",
        colModel: [			
			// { label: 'id', name: 'id', index: 'id', width: 50, key: true },
			// { label: '消息类型', name: 'msgType', index: 'msg_type', width: 80 },
            { label: '消息类型', name: 'typeName', index: 'typeName', width: 80 },
            { label: '标题', name: 'title', index: 'title', width: 80 },
			{ label: '文本内容', name: 'text', index: 'text', width: 80 }, 			
			// { label: '创建时间', name: 'createtime', index: 'createtime', width: 80 },
			// { label: '更新时间', name: 'updatetime', index: 'updatetime', width: 80 },
			{ label: '上传者', name: 'uploaderName', index: 'username', width: 80 }
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

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
		title: null,
		sysMsg: {
            msgTypeName:null,
            msgType:null
		}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.sysMsg = {
				msgTypeName:null,
                msgType:null};
            vm.getDict();
		},
        getDict:function () {
            $.get(baseURL+"sys/dict/msgTreeList",function (r) {
                console.log(JSON.stringify(r));
                ztree = $.fn.zTree.init($("#dictTree"), setting, r);
                var node = ztree.getNodeByParam("id", vm.sysMsg.msgType);
                if(node != null){
                    ztree.selectNode(node);

                    vm.sysMsg.msgType = node.id;
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
            vm.getDict();
		},
		saveOrUpdate: function (event) {
			var url = vm.sysMsg.id == null ? "sys/sysmsg/save" : "sys/sysmsg/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.sysMsg),
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
        msgTypeTree:function () {
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
                    vm.sysMsg.msgType = node[0].id;
                    vm.sysMsg.msgTypeName = node[0].name;
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
				    url: baseURL + "sys/sysmsg/delete",
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
			$.get(baseURL + "sys/sysmsg/info/"+id, function(r){
                vm.sysMsg = r.sysMsg;
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
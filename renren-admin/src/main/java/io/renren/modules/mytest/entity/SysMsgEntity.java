package io.renren.modules.mytest.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 系统消息表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-12-27 11:32:11
 */
@TableName("sys_msg")
public class SysMsgEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Long id;
	/**
	 * 消息类型
	 */
	private String msgType;
	/**
	 * 标题
	 */
	private String title;
	/**
	 * 文本内容
	 */
	private String text;
	/**
	 * 创建时间
	 */
	private Date createtime;
	/**
	 * 更新时间
	 */
	private Date updatetime;
	/**
	 * 上传者id
	 */
	private Long uploaderId;

	@TableField(exist = false)
	private String uploaderName;

	@TableField(exist = false)
	private String typeName;

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getUploaderName() {
		return uploaderName;
	}

	public void setUploaderName(String uploaderName) {
		this.uploaderName = uploaderName;
	}

	/**
	 * 设置：
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：
	 */
	public Long getId() {
		return id;
	}
	/**
	 * 设置：消息类型
	 */
	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}
	/**
	 * 获取：消息类型
	 */
	public String getMsgType() {
		return msgType;
	}
	/**
	 * 设置：标题
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * 获取：标题
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * 设置：文本内容
	 */
	public void setText(String text) {
		this.text = text;
	}
	/**
	 * 获取：文本内容
	 */
	public String getText() {
		return text;
	}
	/**
	 * 设置：创建时间
	 */
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	/**
	 * 获取：创建时间
	 */
	public Date getCreatetime() {
		return createtime;
	}
	/**
	 * 设置：更新时间
	 */
	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	/**
	 * 获取：更新时间
	 */
	public Date getUpdatetime() {
		return updatetime;
	}
	/**
	 * 设置：上传者id
	 */
	public void setUploaderId(Long uploaderId) {
		this.uploaderId = uploaderId;
	}
	/**
	 * 获取：上传者id
	 */
	public Long getUploaderId() {
		return uploaderId;
	}
}

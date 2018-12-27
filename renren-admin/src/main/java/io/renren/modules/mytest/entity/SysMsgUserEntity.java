package io.renren.modules.mytest.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 系统消息用户关系表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-12-27 11:32:11
 */
@TableName("sys_msg_user")
public class SysMsgUserEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Long id;
	/**
	 * 系统消息id
	 */
	private Long sysMsgId;
	/**
	 * 用户id
	 */
	private Long sysUserId;
	/**
	 * 状态  0：未读   1：已读
	 */
	private Integer status;

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
	 * 设置：系统消息id
	 */
	public void setSysMsgId(Long sysMsgId) {
		this.sysMsgId = sysMsgId;
	}
	/**
	 * 获取：系统消息id
	 */
	public Long getSysMsgId() {
		return sysMsgId;
	}
	/**
	 * 设置：用户id
	 */
	public void setSysUserId(Long sysUserId) {
		this.sysUserId = sysUserId;
	}
	/**
	 * 获取：用户id
	 */
	public Long getSysUserId() {
		return sysUserId;
	}
	/**
	 * 设置：状态  0：未读   1：已读
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}
	/**
	 * 获取：状态  0：未读   1：已读
	 */
	public Integer getStatus() {
		return status;
	}
}

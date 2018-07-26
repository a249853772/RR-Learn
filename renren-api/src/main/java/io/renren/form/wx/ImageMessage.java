package io.renren.form.wx;

/**
 * 图片消息
 * @author huhao
 */
public class ImageMessage extends BaseMessage{

    /**
     * Image节点
     */
    private Image Image;

    public io.renren.form.wx.Image getImage() {
        return Image;
    }

    public void setImage(io.renren.form.wx.Image image) {
        Image = image;
    }
}

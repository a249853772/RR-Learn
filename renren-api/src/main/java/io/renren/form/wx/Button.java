package io.renren.form.wx;

/**
 * @author huhao
 */
public class Button {

    /**
     * 菜单标题
     */
    private String name;

    /**
     * 菜单的响应动作类型
     */
    private String type;

    /**
     * 子菜单按钮
     */
    private Button[] sub_button;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Button[] getSub_button() {
        return sub_button;
    }

    public void setSub_button(Button[] sub_button) {
        this.sub_button = sub_button;
    }
}

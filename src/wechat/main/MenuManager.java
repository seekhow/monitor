package wechat.main;


import wechat.menu.Button;
import wechat.menu.ClickButton;
import wechat.menu.ComplexButton;
import wechat.menu.Menu;
import wechat.menu.ViewButton;
import wechat.pojo.Token;
import wechat.util.CommonUtil;
import wechat.util.MenuUtil;
/**
 * Created by asua-pc on 2017/6/19.
 */
public class MenuManager {
    /**
     * 定义菜单结构
     *
     * @return
     */
    private static Menu getMenu() {
        ClickButton btn11 = new ClickButton();
        btn11.setName("有些话说");
        btn11.setType("click");
        btn11.setKey("Swords");

        ViewButton btn21 = new ViewButton();
        btn21.setName("Our site");
        btn21.setType("view");
        btn21.setUrl("http://39.108.100.228/monitor");

        ViewButton btn22 = new ViewButton();
        btn22.setName("用户信息");
        btn22.setType("view");
        btn22.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx910747018a8e50c5&redirect_uri=http%3A%2F%2F0.weixinmptest.duapp.com%2FoauthServlet&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect");

        ComplexButton mainBtn1 = new ComplexButton();
        mainBtn1.setName("关于我们");
        mainBtn1.setSub_button(new Button[] { btn11});

        ComplexButton mainBtn2 = new ComplexButton();
        mainBtn2.setName("项目地址");
        mainBtn2.setSub_button(new Button[] { btn21,btn22});

        Menu menu = new Menu();
        menu.setButton(new Button[] { mainBtn1, mainBtn2 });

        return menu;
    }

    public static void main(String[] args) {
        // 第三方用户唯一凭证
        String appId = "wx910747018a8e50c5";
        // 第三方用户唯一凭证密钥
        String appSecret = "4171e997e5fada7a31ca62a9ad6154b5";

        // 调用接口获取凭证
        Token token = CommonUtil.getToken(appId, appSecret);
        System.out.println("test1");
        System.out.println("token:" + token);
        if (token!=null) {
            // 创建菜单
            System.out.println("test2");
            boolean result = MenuUtil.createMenu(getMenu(), token.getAccessToken());

            // 判断菜单创建结果
            if (result)
                System.out.println("OKOK!");
            else
                System.out.println("Fail!");
        }
    }
}

package io.renren.utils;

import io.renren.form.wx.AccessToken;
import net.sf.json.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import redis.clients.jedis.Jedis;

import java.io.IOException;

/**
 * @author huhao
 */
public class WeiXinUtil {

    /**
     * 开发者id
     */
    //private static final String APPID = "wx11985942e88b2106";
    private static final String APPID = "wx37228c7b374419bf";
    /**
     * 开发者秘钥
     */
    //private static final String APPSECRET="1c5dc39929608e5d656e3853669b1a57";
    private static final String APPSECRET="0741cd0388c7e2a9f54789e315260f27";

    private static final String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?"
            + "grant_type=client_credential&appid=APPID&secret=APPSECRET";

    private static final String REDIS_ACCESS_TOKEN = "access_token";

    private static Logger logger = LoggerFactory.getLogger(WeiXinUtil.class);


    /**
     * 处理doget请求
     * @param url
     * @return
     */
    public static JSONObject doGetstr(String url){
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet(url);
        JSONObject jsonObject = null;
        try {
            CloseableHttpResponse response = httpclient.execute(httpGet);
            HttpEntity entity = response.getEntity();
            if(entity!=null){
                String result = EntityUtils.toString(entity);
                jsonObject = JSONObject.fromObject(result);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return jsonObject;

    }


    /**
     * 处理post请求
     * @param url
     * @return
     */
    public static JSONObject doPoststr(String url,String outStr){
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(url);
        JSONObject jsonObject = null;
        try {
            httpPost.setEntity(new StringEntity(outStr, "utf-8"));
            CloseableHttpResponse response = httpclient.execute(httpPost);
            String result = EntityUtils.toString(response.getEntity(),"utf-8");
            jsonObject =JSONObject.fromObject(result);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return jsonObject;
    }

    public static AccessToken getAccessToken(){
        logger.debug("从接口中获取AccessToken");
        Jedis jedis  = RedisUtil.getJedis();
        AccessToken token = new AccessToken();
        String url = ACCESS_TOKEN_URL.replace("APPID", APPID).replace("APPSECRET", APPSECRET);
        JSONObject json = doGetstr(url);
        if(json!=null){
            token.setAccess_token(json.getString("access_token"));
            token.setExpires_in(json.getInt("expires_in"));
            jedis.set(REDIS_ACCESS_TOKEN, json.getString("access_token"));
            jedis.expire(REDIS_ACCESS_TOKEN, 60*60*2);
        }
        RedisUtil.returnResource(jedis);
        return token;
    }

    /**
     * 获取凭证
     * @return
     */
    public static String  getAccess_Token(){
        logger.debug("从缓存中读取AccessToken");
        Jedis jedis  = RedisUtil.getJedis();
        String accessToken = jedis.get(REDIS_ACCESS_TOKEN);
        if(accessToken==null){
            AccessToken token = getAccessToken();
            accessToken = token.getAccess_token();
        }
        RedisUtil.returnResource(jedis);
        logger.debug("获取到的AccessToken={}",accessToken);
        return accessToken;
    }


    public static void main(String [] args){
        String access_token = WeiXinUtil.getAccess_Token();
        System.out.println("调用成功access_token:"+access_token);
    }



}

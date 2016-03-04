package com.wangku.dpw.util;

/**
 * @Title: JsonResult.java 
 * @Description: TODO  返回结果数据封装
 * @author yangpeng 
 * @Modified yangpeng      
 * @date 2015年8月4日 上午10:31:43   
 * @version V1.0   
 * @Copyright 中国网库-单品外包服务中心-单品网技术部
 */
public class JsonResult {

    private boolean success = false;
    private String message;
    private Object data;

    public JsonResult(){}
    public JsonResult(boolean success,String message){
        this.success = success;
        this.message = message;
    }
    public static JsonResult createSuccess(String message,Object data){
        JsonResult jsonResult = new JsonResult(true,message);
        jsonResult.setData(data);
        return jsonResult;
    }

    public static JsonResult createFailure(String message){
        JsonResult jsonResult = new JsonResult(false,message);
        return jsonResult;
    }


    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}

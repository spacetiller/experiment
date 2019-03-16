class BaseResult{
    constructor(code,msg,data){
        this.code = code;
        this.msg = msg;
        this.data = data;
    }
    setCode(code){
        this.code = code;
    }
    getCode(){
        return this.code;
    }
    setMsg(msg){
        this.msg = msg;
    }
    getMsg(){
        return this.msg;
    }
    setData(data){
        this.data = data;
    }
    getData(){
        return this.data;
    }
    getRes(){
        return {'code':this.code,'msg':this.msg,'data':this.data};
    }
}

module.exports = {
    // 通用
    SUCCESS                 :       new BaseResult(0,'成功',{}),
    FAILED                  :       new BaseResult(1,'失败',{}),
    //用户
    USER_PASSWORD_ERROR     :       new BaseResult(101,'用户名或密码错误',{}),
    USER_CAPTCHA_ERROR      :       new BaseResult(102,'验证码错误',{})
}


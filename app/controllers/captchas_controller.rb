class CaptchasController < ApplicationController
  def create
    captcha = current_sms_key.captchas.create(mobile: params[:mobile])
    rst = { data: '', code: '', msg: '' }
    if !captcha.send_at.nil?
      captcha.sms_key.increment!(:key_count)
      rst[:code] = :created
      rst[:msg] = '短信验证码发送成功'
    else
      rst[:code] = :not_found
      rst[:msg] = '短信验证码发送失败'
    end
    rst[:data] = captcha
    render json: rst
  end

  def show
    mobile = params[:mobile]
    code = params[:code]
    ncode = Captcha.select(:id, :code, :send_at).where("mobile = ?", mobile).limit(1).order('id desc')
    result = { data: '', code: '', msg: '' }
    if  code.empty? || ncode.empty?
      result["msg"] = "验证码不正确"
      result["code"] = "404"
      return render json: result
    elsif code != ncode[0]["code"]
      result["msg"] = "验证码不正确"
      result["code"] = "401"
      return render json: result
    elsif code == ncode[0]["code"] && ncode[0]["send_at"] > 10.minutes.ago
      result["msg"] ="验证码成功"
      result["code"] = :ok
      result["data"] = ncode
      return render json: result
    else
      result["msg"] ="验证码时限已经超过10分钟，请重新获取"
      return render json: result
    end
  end
end

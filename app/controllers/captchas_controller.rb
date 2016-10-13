class CaptchasController < ApplicationController
  def create
    captcha = Captcha.create(mobile: params[:mobile])
    rst = { data: '', code: '', msg: '' }
    if captcha.send_at
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
  end
end

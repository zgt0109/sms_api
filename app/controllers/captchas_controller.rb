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
		mobile = params[:mobile]
		code = params[:code]
		ncode = Captcha.select(:code).where("mobile = ?", mobile).limit(1).order('id desc')
		result = {msg: "", code: "" ,data: ""}
		if  code.empty? || ncode.empty?
			result["msg"] = "验证码不正确"
			result["code"] = "404"
			render json: result
			return
		end
		if code != ncode[0]["code"]
			result["msg"] = "验证码不正确"
			result["code"] = "401"
			render json: result
			return
		end
	    if
			result["msg"] ="验证码成功"
			result["code"] = :ok
			render json: result
			return
		end
		
	end
end

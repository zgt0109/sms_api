class ApplicationController < ActionController::API
  def current_sms_key
    SmsKey.key_val.first
  end
end

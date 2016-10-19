class SendSmsJob < ApplicationJob
  queue_as :default

  def perform(captcha_id)
    # Do something later
    captcha = Captcha.find(captcha_id)
    captcha.send_sms_code
  end
end

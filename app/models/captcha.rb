# == Schema Information
#
# Table name: captchas
#
#  id         :integer          not null, primary key
#  mobile     :string
#  code       :string
#  send_at    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Captcha < ApplicationRecord
  before_create do
    self.code = [*0..9].shuffle[0..3].join
  end

  after_commit :send_sms_code, on: :create

  private
    def send_sms_code
      message = "你的验证码是#{self.code}【蝙蝠征信短信平台】"
      ChinaSMS.use :luosimao, username: 'api', password: '034f4284bab87d567b52fe4553001e36'
      ChinaSMS.to self.mobile,  message
      update_columns(send_at: Time.now)
    end
end

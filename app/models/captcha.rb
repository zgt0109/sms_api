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
#  sms_key_id :integer
#
# Indexes
#
#  index_captchas_on_sms_key_id  (sms_key_id)
#
# Foreign Keys
#
#  fk_rails_3dd6a133ed  (sms_key_id => sms_keys.id)
#

class Captcha < ApplicationRecord
  belongs_to :sms_key

  validates :mobile, presence: true, format: {
    with: /\A1(3[0-9]|4[57]|5[0-35-9]|7[01678]|8[0-9])\d{8}\z/,
    message: '请输入正确的手机号码。'
  }
  validates :minute_size, inclusion: { in: [0], message: '短信验证码已经发送。' }

  # 一分钟之内发送的次数
  attr_accessor :minute_size

  scope :send_after, -> (mobile, time){ where(mobile: mobile).where("send_at > ?", time) }

  before_validation do
    self.minute_size = Captcha.send_after(self.mobile, 1.minute.ago).size
  end

  before_create do
    self.code = [*0..9].shuffle[0..5].join
  end

  after_commit :send_sms_code, on: :create

  def send_sms_code
    if Rails.env.production?
      if self.sms_key.key_type == 'luosimao'
        # 调用螺丝帽第三方平台模板message
        message = "你的验证码是#{self.code}【蝙蝠征信短信平台】"
        SendSmsJob.perform_later(self)
        ChinaSMS.use :luosimao, username: 'api', password: self.sms_key.key
        rst = ChinaSMS.to self.mobile,  message
        update_columns(send_at: Time.now) if rst[:success]
      elsif self.sms_key.key_type == 'yunpian'
        # 调用云片网第三方平台模板message
        message = "【蝙蝠征信短信平台】您的验证码是#{self.code}。如非本人操作，请忽略本短信"
        SendSmsJob.perform_later(self)
        ChinaSMS.use :yunpian, password: self.sms_key.key
        rst = ChinaSMS.to self.mobile,  message
        update_columns(send_at: Time.now) if rst["msg"] == "OK"
      end
    end
  end
end

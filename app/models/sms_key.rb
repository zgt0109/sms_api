# == Schema Information
#
# Table name: sms_keys
#
#  id         :integer          not null, primary key
#  key        :string
#  key_type   :string
#  key_count  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SmsKey < ApplicationRecord
	has_many :captchas

	#key_val:发送最少的平台的key值
	attr_accessor :key_val
	scope :send_before, -> {select(:key).limit(1).order("key_count ASC")}
	before_validation do
		self.key_val = Captcha.send_before.size
	end 
end

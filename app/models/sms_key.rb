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
end

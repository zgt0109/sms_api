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
end

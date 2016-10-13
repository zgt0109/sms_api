class AddSmsKeyToCaptcha < ActiveRecord::Migration[5.0]
  def change
    add_reference :captchas, :sms_key, foreign_key: true
  end
end

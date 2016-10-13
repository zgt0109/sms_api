class CreateCaptchas < ActiveRecord::Migration[5.0]
  def change
    create_table :captchas do |t|
      t.string :mobile
      t.string :code
      t.datetime :send_at

      t.timestamps
    end
  end
end

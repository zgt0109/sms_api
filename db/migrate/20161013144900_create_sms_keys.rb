class CreateSmsKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :sms_keys do |t|
      t.string :key
      t.string :key_type
      t.integer :key_count

      t.timestamps
    end
  end
end

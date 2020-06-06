class CreateRubySgBotSubscribers < ActiveRecord::Migration[5.0]
  def change
    create_table :ruby_sg_bot_subscribers do |t|
      t.string :chat_id

      t.timestamps
    end
  end
end

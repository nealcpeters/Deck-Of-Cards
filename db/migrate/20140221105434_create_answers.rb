class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :card_id
      t.integer :round_id
      t.integer :result
    end
  end
end

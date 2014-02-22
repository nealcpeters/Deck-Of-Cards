class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :card_id
      t.integer :round_id
      t.boolean :result

      t.timestamps
    end
  end
end

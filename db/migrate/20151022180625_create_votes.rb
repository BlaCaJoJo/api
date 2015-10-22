class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :answer_id
      t.integer :member_id
      t.integer :question_id
      t.boolean :up
      t.boolean :down

      t.timestamps null: false
    end
  end
end

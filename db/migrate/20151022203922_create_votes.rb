class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :member_id
      t.boolean :up_down
      t.integer :vote_for_id
      t.string :vote_for_type

      t.timestamps null: false
    end
  end
end

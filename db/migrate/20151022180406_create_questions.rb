class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :member_id
      t.string :title
      t.text :desc

      t.timestamps null: false
    end
  end
end

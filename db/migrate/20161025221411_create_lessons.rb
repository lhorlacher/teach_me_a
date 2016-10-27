class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.date :date, null: false
      t.text :feedback
      t.integer :teacher_id, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end

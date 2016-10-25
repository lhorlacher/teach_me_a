class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.date :date
      t.text :feedback

      t.timestamps
    end
  end
end

class CreateLessonNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :lesson_notes do |t|
      t.text :notes

      t.timestamps
    end
  end
end

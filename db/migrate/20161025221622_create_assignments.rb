class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :book, null: false
      t.integer :page, null: false
      t.integer :per_day
      t.integer :per_week
      t.text :instruction
      t.belongs_to :lesson

      t.timestamps
    end
  end
end

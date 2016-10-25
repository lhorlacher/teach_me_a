class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :book
      t.integer :page
      t.integer :per_day
      t.integer :per_week
      t.text :instruction

      t.timestamps
    end
  end
end

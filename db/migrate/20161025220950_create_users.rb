class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.boolean :teacher, default: true, null: false
      t.integer :teacher_id

      t.timestamps
    end
  end
end

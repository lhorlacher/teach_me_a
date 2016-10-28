class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.boolean :teacher, null: false, default: true
      t.integer :teacher_id

      t.timestamps
    end
  end
end

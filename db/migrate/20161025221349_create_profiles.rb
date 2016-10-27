class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.text :instrument
      t.integer :age
      t.string :gender
      t.text :bio
      t.belongs_to :user

      t.timestamps
    end
  end
end

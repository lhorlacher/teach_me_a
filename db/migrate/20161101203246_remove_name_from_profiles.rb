class RemoveNameFromProfiles < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :name, :string
  end
end

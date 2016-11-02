class AddRatingToLesson < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :rating, :integer
  end
end

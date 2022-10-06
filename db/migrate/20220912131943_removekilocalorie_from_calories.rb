class RemovekilocalorieFromCalories < ActiveRecord::Migration[6.1]
  def change
    remove_column :calories, :kilocalorie, :integer
  end
end

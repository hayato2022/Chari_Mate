class AddWeightToCalories < ActiveRecord::Migration[6.1]
  def change
    add_column :calories, :weight, :decimal
  end
end

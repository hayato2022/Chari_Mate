class AddMinutesToCalories < ActiveRecord::Migration[6.1]
  def change
    add_column :calories, :minute, :decimal
  end
end

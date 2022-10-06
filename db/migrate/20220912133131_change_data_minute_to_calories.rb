class ChangeDataMinuteToCalories < ActiveRecord::Migration[6.1]
  def change
    change_column :calories, :minute, :integer
  end
end

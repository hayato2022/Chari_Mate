class AddMetsToCalories < ActiveRecord::Migration[6.1]
  def change
    add_column :calories, :mets, :decimal
  end
end

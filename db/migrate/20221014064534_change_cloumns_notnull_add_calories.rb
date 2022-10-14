class ChangeCloumnsNotnullAddCalories < ActiveRecord::Migration[6.1]
  def change
    change_column :calories, :mets, :decimal, null: false
    change_column :calories, :minute, :integer, null: false
    change_column :calories, :weight, :decimal, null: false
  end
end

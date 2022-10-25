class ChangeCloumnsNotnullAddPosts < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :lat, :float, null: false
    change_column :posts, :lng, :float, null: false
  end
end

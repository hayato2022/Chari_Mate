class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, null: false #通知を送ったユーザーのid
      t.integer :visited_id, null: false #通知を送られたユーザーのid
      t.integer :post_id
      t.integer :post_comment_id
      t.string :action, default: '', null: false #通知の種類（フォロー、いいね、コメント）
      t.boolean :checked, default: false, null: false #通知を送られたユーザーが通知を確認したかどうか
      t.timestamps
    end

    add_index :notifications, :visitor_id
    add_index :notifications, :visited_id
    add_index :notifications, :post_id
    add_index :notifications, :post_comment_id
  end
end

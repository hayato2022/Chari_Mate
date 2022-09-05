class Relationship < ApplicationRecord
   # class_name: "User"でUserモデルを参照
  belongs_to :follower_id, class_name: "User"
  belongs_to :followed_id, class_name: "User"
end

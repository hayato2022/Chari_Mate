class Relationship < ApplicationRecord
   # class_name: "User"でUserモデルを参照
  belongs_to :follower, class_name: "User"
  belongs_to :followed_, class_name: "User"
end

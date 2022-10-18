# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = Admin.new(:email => 'chari_mate@hoge.com', :password => 'hogehoge')
admin.save!

users = User.create!(
  [
    {email: 'olivia@test.com', name: 'Olivia', password: 'password', is_active: true, introduction: 'こんにちは', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'james@test.com', name: 'James', password: 'password',is_active: false, introduction: 'よろしくお願いします', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'lucas@test.com', name: 'Lucas', password: 'password',is_active: true, introduction: 'よろしく', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)

posts = Post.create!(
  [
    {body: 'とてもきれいなびわ湖', lat: 35.331592, lng:136.0728135, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpeg"), filename:"sample-post1.jpeg"), user_id: users[0].id },
    {body: '琵琶湖と貝殻',lat: 35.331592, lng:136.0728135, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpeg"), filename:"sample-post2.jpeg"),  user_id: users[1].id},
    {body: 'のどかな田舎の田んぼ', lat: 35.32599002244017, lng:135.98612450463867, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpeg"), filename:"sample-post3.jpeg"), user_id: users[2].id }
  ]
)

tags = Tag.create!(
  [
    {name: '琵琶湖' },
    {name: '絶景'},
    {name: '田舎' }
  ]
)

PostTag.create!(
  [
    {post_id: posts[0].id, tag_id: tags[0].id},
    {post_id: posts[1].id, tag_id: tags[1].id},
    {post_id: posts[2].id, tag_id: tags[2].id}
  ]
)


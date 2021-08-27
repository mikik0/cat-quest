# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  [
    [ 1, '初心者ねこ', "https://res.cloudinary.com/dmt03c6vy/image/upload/c_scale,w_200/v1630068446/nekochan_otugzi.png"],
    [ 1, '若葉ねこ', ""],
    [ 5, '大人ねこ', ""],
  ].each do |level, name, image_id|
    Character.create!(
      { level: level, name: name, image_id: image_id }
    )
  end

  [
    [ 1, 0],
    [ 2, 7],
    [ 3, 14],
    [ 4, 21],
    [ 5, 28],
    [ 6, 36],
  ].each do |level, threshold|
    LevelThreshold.create!(
      { level: level, threshold: threshold }
    )
  end

3.times do |n|
  User.create!(
    name: "test#{n + 1}",
    introduction: "テストデータ#{n + 1}です",
    total_nekokan: n * 5,
    character_id: 1,
    password: "password"
  )

  Quest.create!(
    title: "ダミークエスト#{n + 1}",
    description: "ダミーのクエスト#{n + 1}です",
    finished_at: Time.current+ 10* 24 * 60 * 60
  )

  
  UserQuest.create!(
    user_id:  1,
    quest_id: n + 1,
    is_finished: false,
    is_owner: true
  )
  
end

quest = Quest.create!(
  title: "ダミークエスト4",
  description: "ダミーのクエスト4です",
  #10日先の期限
  finished_at: Time.current+ 10* 24 * 60 * 60
)

UserQuest.create!(
  user_id:  1,
  quest_id: 4,
  is_finished: false,
  is_owner:false
)

Content.create!(
  quest_id: 1,
  youtube_url: "https://www.youtube.com/watch?v=bQW1SYFAc2Q"
)

UserContent.create!(
  user_id: 1,
  content_id: 1
)


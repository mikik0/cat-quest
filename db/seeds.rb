# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Character.create(
  level: 1,
  name: "初心者ねこ"
)

5.times do |n|
  User.create(
    name: "テスト#{n + 1}",
    introduction: "テストデータ#{n + 1}です",
    total_nekokan: n * 5,
    character_id: 1,
    password: "password"
  )

  quest = Quest.new(
    title: "ダミークエスト#{n + 1}",
    description: "ダミーのクエスト#{n + 1}です",
  )
  quest.finished_at = Time.current
  quest.save

  UserQuest.create(
    user_id: n + 1,
    quest_id: 1,
    is_finished: false
  )

end

  UserQuest.create(
    user_id: 1,
    quest_id: 1,
    is_owner: true,
    is_finished: true
  )
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  [
    [ 1, '初心者ねこ', "https://res.cloudinary.com/dmt03c6vy/image/upload/c_scale,w_200/v1630068446/nekochan_otugzi.png"],
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
    [ 7, 44],
    [ 8, 52],
    [ 9, 60]
  ].each do |level, threshold|
    LevelThreshold.create!(
      { level: level, threshold: threshold }
    )
  end

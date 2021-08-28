# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  [
    [ 1, '赤ちゃんねこ', "https://res.cloudinary.com/dmt03c6vy/image/upload/c_scale,w_200/v1630113605/cat01_wmh89w.png"],
    [ 5, '大人ねこ', "https://res.cloudinary.com/dmt03c6vy/image/upload/c_scale,w_200/v1630113605/cat02_g7116a.png"],
    [ 20, 'ライオンねこ', "https://res.cloudinary.com/dmt03c6vy/image/upload/c_scale,w_200/v1630113605/cat03_y3foef.png"]
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
    [ 9, 60],
    [ 10, 68],
    [ 11, 76],
    [ 12, 84],
    [ 13, 92],
    [ 14, 100],
    [ 15, 108],
    [ 16, 116],
    [ 17, 124],
    [ 18, 132],
    [ 19, 140],
    [ 20, 148],
    [ 21, 9999999]
  ].each do |level, threshold|
    LevelThreshold.create!(
      { level: level, threshold: threshold }
    )
  end

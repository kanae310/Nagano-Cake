# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: "kanae@gmail",
    password: "aaaaaa"
)
Genre.create!(
    id: 1,
    name: "ケーキ"
)
Genre.create!(
    id: 2,
    name: "焼き菓子"
)
Genre.create!(
    id: 3,
    name: "キャンディ"
)
Genre.create!(
    id: 4,
    name: "プリン"
)
Item.create!(
    id:1,
    name:"マカロン",
    introduction:"カラフルなマカロンです！",
    item_image: open("./app/assets/images/img1.jpg"),
    price: 400,
    sale_status: true,
    genre_id:2
)
Item.create!(
    id:2,
    name: "ドーナツ",
    introduction: "様々な種類のドーナツです！",
    item_image: open("./app/assets/images/img3.jpg"),
    price: 150,
    sale_status: false,
    genre_id:2
)
Item.create!(
    id:3,
    name: "チョコケーキ",
    introduction: "しっとり濃厚なチョコレートケーキです！",
    item_image: open("./app/assets/images/img2.jpg"),
    price: 560,
    sale_status: true,
    genre_id:1
)
Item.create!(
    id:4,
    name: "プリン",
    introduction: "甘くておいしいプリンです！",
    item_image: open("./app/assets/images/img4.jpg"),
    price: 300,
    sale_status: true,
    genre_id:4
)
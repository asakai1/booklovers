# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "admin@example.com",
  password: "adminpass"
)

genres = Genre.create!(
  [
    {name: '文学・小説'},
    {name: 'ノンフィクション'},
    {name: '実用書'},
    {name: '参考書'},
    {name: '画集・写真集'},
    {name: '地図'},
    {name: '図鑑・辞典'},
    {name: '児童書'},
    {name: 'コミックス'},
    {name: 'その他'}
  ]
)

users = User.create!(
  [
    {email: 'olivia@example.com', name: 'Olivia', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'james@example.com', name: 'James', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'lucas@example.com', name: 'Lucas', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)

find_books = FindBook.create!(
  [
    {title: '日本地名辞典　市町村編', author: '山口恵一郎', body: '状態は問いません。販売だけでなく、図書館等での目撃情報もあれば欲しいです。', genre_id: genres[6].id, user_id: users[0].id },
    {title: '大学への数学問題はどう作られるか', author: '栗田稔', body: '美品希望です。特にオンラインでの目撃情報求む！', genre_id: genres[3].id, user_id: users[1].id },
    {title: '草間彌生全版画集', author: '草間彌生', body: '美品のみ希望です。関東圏で販売しているお店を探しています', genre_id: genres[4].id, user_id: users[2].id }
  ]
)

suggest_books = SuggestBook.create!(
  [
    {title: '日本俗信辞典　動物編', author: '鈴木棠三', body: '日本の動物に纏わる俗信が網羅的にまとめられていて、読み応えのある一冊です', genre_id: genres[6].id, user_id: users[0].id },
    {title: '吾輩は猫である', author: '夏目漱石', body: '猫目線で描かれた教師の日常のお話です。個性的な登場人物が多くおもしろいです。', genre_id: genres[0].id, user_id: users[1].id },
    {title: 'もものかんづめ', author: 'さくらももこ', body: 'ちびまる子ちゃんの作者、さくらももこさんのエッセイです。独特の語り口で、クスッと笑えます。', genre_id: genres[1].id, user_id: users[2].id }
  ]
)

sell_books = SellBook.create!(
  [
    {find_book_id: find_books[0].id, user_id: users[1].id, condition: '汚れあり', price: '13000', shipping_date: '7'},
    {find_book_id: find_books[1].id, user_id: users[2].id, condition: '美品', price: '8000', shipping_date: '5'},
    {find_book_id: find_books[2].id, user_id: users[0].id, condition: '美品', price: '7000', shipping_date: '10'}
  ]
)

BuyBook.create!(
  [
    {sell_book_id: sell_books[0].id, user_id: users[0].id, name: '本好き子', postal_code: '0000000', address: '○○県○○市○○町○○', telephone_number: '00000000000', payment_method: 'cash_on_delivery'},
    {sell_book_id: sell_books[1].id, user_id: users[1].id, name: '本好き雄', postal_code: '0000000', address: '○○県○○市○○町○○', telephone_number: '00000000000', payment_method: 'cash_on_delivery'},
    {sell_book_id: sell_books[2].id, user_id: users[2].id, name: '本好き郎', postal_code: '0000000', address: '○○県○○市○○町○○', telephone_number: '00000000000', payment_method: 'cash_on_delivery'}
  ]
)

PostInformation.create!(
  [
    {find_book_id: find_books[0].id, user_id: users[2].id, information: '○○大学の図書館で見かけました。'},
    {find_book_id: find_books[1].id, user_id: users[0].id, information: 'リサイクルショップ○○のオンラインショップで販売されているようです。'},
    {find_book_id: find_books[2].id, user_id: users[1].id, information: '○○市の古本屋で売られていました！'}
  ]
)

PostComment.create!(
  [
    {suggest_book_id: suggest_books[0].id, user_id: users[2].id, comment: '難しい言葉が多かったですが、楽しく読めました'},
    {suggest_book_id: suggest_books[1].id, user_id: users[1].id, comment: '猫同士のやりとりもあって面白かったです'},
    {suggest_book_id: suggest_books[2].id, user_id: users[0].id, comment: '一気に読めました！笑えました'}
  ]
)

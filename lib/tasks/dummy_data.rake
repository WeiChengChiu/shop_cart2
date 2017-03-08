namespace :dummy_data do
  desc "產生 10 筆商品假資料"
  task :generate => :environment do
    10.times {
      Product.create(
        title: Faker::Book.title,
        description: Faker::Lorem.paragraph,
        price: Faker::Number.between(100, 500)
      )
    }
  end
end
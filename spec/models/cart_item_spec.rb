require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it "每個 Cart Item 都可以計算它自己的金額（小計）" do
    p1 = Product.create(title: "神奇寶貝", price: 150)
    p2 = Product.create(title: "世紀帝國", price: 550)

    cart = Cart.new
    3.times { cart.add_item(p1.id) }
    2.times { cart.add_item(p2.id) }
    2.times { cart.add_item(p1.id) }

    expect( cart.items.first.price ).to be 750
    expect( cart.items.second.price ).to be 1100
  end
end

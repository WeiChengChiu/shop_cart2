require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "購物車基本功能" do
    it "可以加商品到購物車，然後購物車有商品" do
      cart = Cart.new
      cart.add_item 1
      expect(cart.empty?).to be false
    end

    it "如果加 相同種類商品 到購物車，購買項目（CartItem）並不會增加，但 商品數量 會改變" do
      cart = Cart.new
      3.times { cart.add_item(1) }
      5.times { cart.add_item(2) }
      7.times { cart.add_item(3) }

      expect( cart.items.length ).to be 3
      expect( cart.items.first.quantity ).to be 3
      expect( cart.items.second.quantity ).to be 5
    end

    it "商品可以放到購物車裡，也可以再拿出來" do
      cart = Cart.new
      p1 = Product.create(title: "海賊王")
      p2 = Product.create(title: "美食的俘虜")

      2.times { cart.add_item(p1.id) }
      3.times { cart.add_item(p2.id) }

      expect( cart.items.first.product_id ).to be p1.id
      expect( cart.items.second.product_id ).to be p2.id
      expect( cart.items.first.product ).to be_a Product
    end

    it "每個 Cart Item 都可以計算它自己的金額(小計)" do
      cart = Cart.new
      p1 = Product.create(title: "海賊王", price:80)
      p2 = Product.create(title: "美食的俘虜", price:100)

      3.times { cart.add_item(p1.id) }
      5.times { cart.add_item(p2.id) }

      expect( cart.items.first.price ).to be 240
      expect( cart.items.second.price ).to be 500
    end

    it "可以計算整台購物車的總消費金額" do
    end

    it "特別活動可能可搭配折扣（例如聖誕節時全面打9折，或滿額滿千送百）" do
    end
  end

  describe "購物車進階功能" do
    it "可以將購物車內容轉成 Hash，存到 Session 裡" do

    end

    it "可以把 Session 的內容(Hash 格式)，還原成購物車的內容" do

    end
  end
end

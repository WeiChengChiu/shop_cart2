require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  before(:all) do
    @p1 = Product.create(title: "海賊王", price: 80)
    @p2 = Product.create(title: "美食的俘虜", price: 100)

  end

  it "#index" do
    get :index
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
  end

  it "#show" do
    get :show, id: @p1[:id]
    expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
  end

  it "#new" do
    get :new
    expect(response).to have_http_status(200)
    expect(response).to render_template(:new)
  end

  it "#edit" do
    get :edit, id: @p1[:id]
    expect(response).to have_http_status(200)
    expect(response).to render_template(:edit)
  end

  describe '#create' do
    before(:all) do
      @product_params = {title: "海賊王", price: 80}
    end

    it "creates record" do
      expect do
        post :create, params: { product: @product_params }
      end.to change{Product.all.size}.by(1)
    end
  end
end

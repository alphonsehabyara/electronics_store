class ProductsController < ApplicationController
  def index
    @etl_items = Product.all
    render "index.html.erb"
  end

  def show
    @etl_item = Product.find_by(id: params[:id])
  end

  def new
  end

  def create
    etl_item = Product.new({
    name: params[:name],
    item_type: params[:item_type],
    make: params[:make],
    description: params[:description],
    image: params[:image],
    price: params[:price],
    shipping_period: params[:shipping_period]
    })
    etl_item.save
    flash[:success] = "New Item Created"
    redirect_to "/products/#{etl_item.id}"
  end

  def edit
    @etl_item = Product.find_by(id: params[:id])
  end

  def update
    etl_item = Product.find_by(id: params[:id])
    etl_item.assign_attributes({
    name: params[:name],
    item_type: params[:item_type],
    make: params[:make],
    description: params[:description],
    image: params[:image],
    price: params[:price],
    shipping_period: params[:shipping_period]
    })
    etl_item.save
    flash[:success] = "Item Updated"
    redirect_to "/products/#{etl_item.id}"
  end

  def destroy
    @etl_item = Product.find_by(id: params[:id])
    @etl_item.destroy
    flash[:success] = "Item Deleted!"
    redirect_to "/products"
  end
end

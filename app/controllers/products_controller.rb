class ProductsController < ApplicationController

  def index

    if params[:sort]
      @products = Product.all.order(price: params[:sort])
    elsif params[:filter] == "discount"
      @products = Product.where("price <?", 5)
    else
      @products = Product.all
    end

  end

  def show
    # if params[:random] == "random"
    #   @product = Product.all.find(price: params[:random]
    # else 
      @product = Product.find_by(id: params[:id])
    # end
  end

  def new
  end

  def create
    product = Product.new({
    name: params[:name],
    item_type: params[:item_type],
    make: params[:make],
    description: params[:description],
    image: params[:image],
    price: params[:price],
    shipping_period: params[:shipping_period]
    })
    product.save
    flash[:success] = "New Item Created"
    redirect_to "/products/#{product.id}"
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    product = Product.find_by(id: params[:id])
    product.assign_attributes({
    name: params[:name],
    item_type: params[:item_type],
    make: params[:make],
    description: params[:description],
    image: params[:image],
    price: params[:price],
    shipping_period: params[:shipping_period]
    })
    product.save
    flash[:success] = "Item Updated"
    redirect_to "/products"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:success] = "Item Deleted!"
    redirect_to "/products"
  end
end

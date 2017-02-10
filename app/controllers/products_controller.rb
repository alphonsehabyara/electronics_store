class ProductsController < ApplicationController

  def index

    if params[:sort]
      @products = Product.all.order(price: params[:price])
    elsif params[:filter] == "discount"
      @products = Product.discounted_products
    elsif params[:category]
        @products =  Category.find_by(name: params[:category]).products
    else
      @products = Product.all
    end

  end

  def show

    if params[:id] == "random"
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end

  end

  def new
    if current_user && current_user.admin
      @suppliers = Supplier.all
    else
      flash[:danger] = "You're not the right person to proceed!"
    end
  end

  def create
    product = Product.new({
    name: params[:name],
    item_type: params[:item_type],
    make: params[:make],
    description: params[:description],
    image: params[:image],
    price: params[:price],
    shipping_period: params[:shipping_period],
    user_id: current_user.id
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

  def search
    search_query = params[:search_input]
    @products = Product.where("name LIKE ? OR description LIKE ?", "%#{search_query}%", "%#{search_query}%")
    if @products.empty?
      flash[:info] = "No products found in search"
    end
    render :index
  end
  
end

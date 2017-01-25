class ElectronicsController < ApplicationController
  def index
    @etl_items = Electronic.all
    render "index.html.erb"
  end

  def show
    @etl_item = Electronic.find_by(id: params[:id])
  end

  def new
  end

  def create
    etl_item = Electronic.new({
      name: params[:name],
      item_type: params[:item_type],
      make: params[:make],
      description: params[:description],
      image: params[:image],
      price: params[:price],
      shipping_period: params[:shipping_period]
      })
    etl_item.save
  end

  def edit
    @etl_item = Electronic.find_by(id: params[:id])
  end

  def update
    @etl_item = Electronic.find_by(id: params[:id])
    @etl_item.assign_attributes({
      name: params[:name],
      item_type: params[:item_type],
      make: params[:make],
      description: params[:description],
      image: params[:image],
      price: params[:price],
      shipping_period: params[:shipping_period]
      })
    @etl_item.save
  end

  def destroy
    @etl_item = Electronic.find_by(id: params[:id])
    @etl_item.destroy
  end
end

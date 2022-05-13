class ItemsController < ApplicationController

  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_parameters)
    if item.save 
      redirect_to root_path
    else
      @item = Item.new(item_parameters)
      render :new
    end
  end

  private
  def item_parameters
    params.require(:item).permit(:name, :text, :category_id, :status_id, :charge_id, :area_id, :delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end

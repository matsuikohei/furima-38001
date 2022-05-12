class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_parameters)
  end

  private
  def item_parameters
    params.require(:item).permit(:name, :text, :category_id, :status_id, :charge_id, :area_id, :delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end

class SoldItemsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @sold_item_shipping = SoldItemShipping.new
  end

  def create
    @sold_item_shipping = SoldItemShipping.new(sold_item_shipping_parameters)
  end
  
  private
  def sold_item_shipping_parameters
    params.require(:sold_item_shipping).permit(:postal, :area_id, :city, :address, :building, :phone, :sold_item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

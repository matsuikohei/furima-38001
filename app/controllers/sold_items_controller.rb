class SoldItemsController < ApplicationController
  before_action :authenticate_user! 
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
    @sold_item_shipping = SoldItemShipping.new
  end

  def create
    @sold_item_shipping = SoldItemShipping.new(sold_item_shipping_parameters)
    if @sold_item_shipping.valid?
      pay_item
      @sold_item_shipping.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end
  
  private
  def sold_item_shipping_parameters
    item = Item.find(params[:item_id])
    params.require(:sold_item_shipping).permit(:postal, :area_id, :city, :address, :building, :phone, :sold_item_id).merge(user_id: current_user.id, item_id: params[:item_id], price: item.price, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: sold_item_shipping_parameters[:price],
      card: sold_item_shipping_parameters[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    item = Item.find(params[:item_id])
    user_id = item.user_id
    sold_item = item.sold_item
    if current_user.id == user_id
      redirect_to root_path
    elsif sold_item != nil
      redirect_to root_path
    end
  end

end

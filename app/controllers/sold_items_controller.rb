class SoldItemsController < ApplicationController
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
    Payjp.api_key = "sk_test_513c967a4409c5df3182a53d"
    Payjp::Charge.create(
      amount: sold_item_shipping_parameters[:price],
      card: sold_item_shipping_parameters[:token],
      currency: 'jpy'
    )
  end
end

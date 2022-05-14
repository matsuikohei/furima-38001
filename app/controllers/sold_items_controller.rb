class SoldItemsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @sold_item = SoldItem.new
  end
end

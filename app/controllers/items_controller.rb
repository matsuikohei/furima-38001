class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_parameters)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_parameters)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_parameters
    params.require(:item).permit(:name, :text, :category_id, :status_id, :charge_id, :area_id, :delivery_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    user_id = item.user_id
    sold_item = item.sold_item
    if current_user.id != user_id
      redirect_to action: :index
    elsif sold_item != nil
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

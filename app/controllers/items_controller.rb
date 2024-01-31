class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    #@items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :item_category_id, :item_status_id,
    :delivery_fee_bearer_id, :prefecture_id, :days_to_ship_id, :price, :image)
    .merge(user_id: current_user.id)
  end

end
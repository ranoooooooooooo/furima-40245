class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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
  
  def show
  end

  def edit
    if user_signed_in? && current_user.id != @item.user_id
      redirect_to root_path
    elsif !user_signed_in?
      redirect_to user_session_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :item_category_id, :item_status_id,
    :delivery_fee_bearer_id, :prefecture_id, :days_to_ship_id, :price, :image)
    .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
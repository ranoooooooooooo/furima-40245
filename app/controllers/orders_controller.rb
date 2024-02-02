class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order_form = OrderAddressForm.new
  end

  def create
    #@order_form = OrderAddressForm.new(item_params)

    if @order_form.present?
      @order_form.save
      redirect_to root_path, notice: 'Order was successfully created.'
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  # def item_params
    # params.require(:item).permit(:item_name, :item_description, :item_category_id, :item_status_id,
    # :delivery_fee_bearer_id, :prefecture_id, :days_to_ship_id, :price, :image)
    # .merge(user_id: current_user.id)
  # end

  def set_item
    @item = Item.find(params[:item_id])
  end

end

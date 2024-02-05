class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    if current_user.id != @item.user_id && !@item.order.present?
      @order_form = OrderAddressForm.new
    else
      redirect_to root_path
    end
  end

  def create
    @order_form = OrderAddressForm.new(order_params)

    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  
  def order_params
    params.require(:order_address_form).permit(:postcode, :prefecture_id, :city, :street, :building, :phone_number)
    .merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end

class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_user!

  def checkout 
      @api_v1_order = Api::V1::Order.new(api_v1_order_params)
      @api_v1_order.user_id = current_user.id
      if @api_v1_order.save
        book =  @api_v1_order.book
        book.stock = @api_v1_order.book.stock - @api_v1_order.qty
        book.save
        render json: "Successfully booked", status: :created
      else
        render json: @api_v1_order.errors, status: :unprocessable_entity
      end 
  end

  private

  def api_v1_order_params
    params.require(:api_v1_order).permit(:book_id,:qty)
  end
end

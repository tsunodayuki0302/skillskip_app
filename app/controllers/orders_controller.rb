class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index ]
  before_action :recruitment_params, only: [:index, :create ]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_recruitment
      @order.save
      redirect_to root_path(@order)
    else
      render :index
    end
  end

  private

  def recruitment_params
    @recruitment = Recruitment.find(params[:recruitment_id])
  end

  def order_params
    params.require(:order).permit( :telephone_number).merge(user_id: current_user.id,recruitment_id: params[:recruitment_id], token: params[:token])
  end

  def pay_recruitment
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @recruitment.order,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end

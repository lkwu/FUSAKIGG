class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_order , only: [:show, :details, :edit , :update]

  def show
  end

  def details
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    # @order = current_user.orders.find_by(address: order_params[:address],paid:false)
    # if @order.nil?
      current_cart.update_item_qty(order_params)
      @order = Order.new( order_params.reject{|h| /\d/.match(h) } )
      @order.assign_attributes(user:current_user,
                               after_ship_amount:current_cart.final_price(order_params[:whoset]))
      @order.copy_info_to(current_user)
      @order.clone_cart_line_items_by(current_cart)
    # else
    #   @order.update( order_params )
    #   @order.update_cart_line_items_by(current_cart)
    #   @order.after_ship_amount = @order.final_price(order_params[:whoset])
    # end
    if @order.save
      cookies[:cart_id] = nil
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def update
    @order.update_item_qty(order_params)
    @order.update(order_params.reject{|h| /\d/.match(h) })
    redirect_to order_path(@order)
  end

  def checkout_pay2go
    @order = current_user.orders.find(params[:id])
    if @order.paid?
      redirect_to :back, alert: 'already paid!'
    else
      @payment = Payment.create!( :order => @order, :payment_method => params[:payment_method] )
      render :layout => false
    end
  end

  def thankyou
    order = Order.find(params[:order])
    if current_user.id == order.user_id
      if order.paid?
        @order = order
      end
    else
      redirect_to root_path
    end
  end

  protected

  def find_order
    @order = current_user.orders.find(params[:id])
  end

  def order_params
    params_lists = [:name, :email,:address ,:phone ,:address,:postcode,
                    :ps,:ship_time,:whoset,:status ,:county ,:district]
    params[:order].each do |key|
      params_lists <<  key[0].to_s.to_sym  if /\d/.match(key[0])
    end
    params.require(:order).permit(params_lists)
  end

end

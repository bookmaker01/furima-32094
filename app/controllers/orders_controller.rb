class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :contributor_confirmation, only: [:index]

def index
  
  @form =Form.new
end

def new
@form =Form.new
end

def create
  @form = Form.new(order_params)   
   if @form.valid?
    Payjp.api_key = "sk_test_48d80d33fafada7a820920bf"  
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                
    )
     @form.save
     redirect_to root_path
   else
     render :index
   end
end

private
def set_item
  @item = Item.find(params[:item_id])
end
def order_params
  params.permit(:token,:postal_code,:prefectures_id,:municipality,:address,:building_name,:phone_number,:item_id).merge(user_id: current_user.id)
end
def contributor_confirmation
  redirect_to root_path if current_user.id == @item.user_id || @item.order
end
end
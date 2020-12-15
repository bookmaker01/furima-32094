class OrdersController < ApplicationController

def index
  @item = Item.find(params[:item_id])
  @form =Form.new
end

def new
@form =Form.new
end

def create
  @item = Item.find(params[:item_id])
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
def order_params
  params.permit(:token,:postal_code,:prefectures_id,:municipality,:address,:building_name,:phone_number,:item_id).merge(user_id: current_user.id)
end
end
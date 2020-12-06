class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.all
    
  end
  
  def new
    @item = Item.new
  end

  def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new
  end
   end

  private
  def item_params
    params.require(:item).permit(:name, :image, :category_id, :price, :status_id, :burden_id, :area_id, :guideline_id, :explanation, :user)
  end
  
end


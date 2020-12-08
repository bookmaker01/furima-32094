class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :contributor_confirmation, only: :edit
  def index
   @items = Item.order(id: :DESC).includes(:user)

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

  def show
  end

  def edit
  end

  def update
   if @item.update(item_params)
    redirect_to item_path(@item)
   else
    render :edit
   end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :category_id, :price, :status_id, :burden_id, :area_id, :guideline_id, :explanation).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end
end

class ItemsController < ApplicationController
  skip_before_action :authenticate_user!
def index
end

def destroy
  if @item.destroy
    redirect_to root_path
  else
    redirect_to root_path
  end
end

end


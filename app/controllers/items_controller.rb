class ItemsController < ApplicationController

  def index
    @items = Item.all.limit(48)
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
        respond_to do |format|
            format.html { redirect_to root_path }
            format.json
        end
    else
        respond_to do |format|
            format.html{render new_item_path}
            format.json
        end
    end
end

  private

  def item_params
    params.require(:item).permit(:title,:description,:image).merge(user_id: 1)
  end

end

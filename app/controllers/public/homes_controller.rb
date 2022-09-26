class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @item = Item.last(4)
    @item_new = Item.new
  end

  def about
  end

   def item_params
    params.require(:item).permit(:name, :price, :image)
   end
end

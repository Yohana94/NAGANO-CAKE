class Public::ItemsController < ApplicationController
  # before_action :authenticate_customer!
  def index
  if params[:genre_id]
    @genre = Genre.find(params[:genre_id])
    all_items = @genre.items
  else
    all_items = Item.includes(:genre)
  end
    @items = Item.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
end

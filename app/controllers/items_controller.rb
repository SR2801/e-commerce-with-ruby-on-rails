class ItemsController < ApplicationController
  allow_unauthenticated_access only: %i[ show index ]
  before_action :get_item, only: %i[ show edit update destroy ]

  def index
    @items = Item.all.order(rating: :desc)
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item, notice: "#{@item.name} is added successfully to the catalogue!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: "#{@item.name} is updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  def buy_now
  end

  def add_to_cart
  end

  private
  def item_params
    params.expect(item: %i[ name price inventory_count featured_image description rating])
  end

  def get_item
    @item = Item.find(params[:id])
  end
end

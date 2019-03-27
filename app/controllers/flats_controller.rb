class FlatsController < ApplicationController
before_action :find_flat, only: [:show, :edit, :update, :destroy]
before_action :user_params, only: [:create, :update]
  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(user_params)
    @flat.img = 'https://source.unsplash.com/featured/?house'
    if @flat.save
      redirect_to flats_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @flat.update(user_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render 'edit'
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def user_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :img)
  end
end

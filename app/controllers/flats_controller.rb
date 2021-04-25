class FlatsController < ApplicationController

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    # save the flat
    @flat.save
    #redirect back to index page
    redirect_to flats_path
  end

  def edit
  end


  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  def find_flat
    @flat = Flat.find(params[:id])

  def flat_params
    #manadatory method to safeguard params.
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
end

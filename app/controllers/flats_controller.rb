class FlatsController < ApplicationController
before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      @flats = Flat.where("name LIKE ?","%#{params[:query]}%")
      # Preventing SQL Injection and Database error for unknown characters
    else
    @flats = Flat.all
    end
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    # save the flat
    if @flat.save
    #redirect back to index page
    redirect_to flats_path
    else
    render :new
    end
  end

  def edit
  end

  def update
    @flat.update(flat_paramss)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])

  def flat_params
    #manadatory method to safeguard params.
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
end

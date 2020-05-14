class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
    # will need to make a form I guess look for form_for helper in kitt Rails-CRUD
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    # This is a check to make sure that all feilds are complete before saving the input
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end

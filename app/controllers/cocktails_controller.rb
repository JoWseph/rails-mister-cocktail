class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def edit
    set_cocktail
  end

  def update
    set_cocktail
    if @cocktail.update(params_cocktail)
      redirect_to @cocktail
    else
      render :edit
    end
  end

  def destroy
    set_cocktail
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def params_cocktail
    params.require(:cocktail).permit(:name, :doses, :ingredients)
  end
end

class DosesController < ApplicationController
  def index
    @doses = Dose.all
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(params_dose)
    @dose.ingredient = Ingredient.new
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to @dose.cocktail
    else
      render 'cocktails/new'
    end
  end

  def edit
    set_dose
  end

  def update
    set_dose
    if @dose.update(params_dose)
      redirect_to @dose
    else
      render :edit
    end
  end

  def destroy
    set_dose
    @dose.destroy
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def params_dose
    params.require(:dose).permit(:description)
  end
end

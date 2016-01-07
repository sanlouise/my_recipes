class IngredientsController < ApplicationController
  
  def show
    @ingredient = Ingredient.find(params[:id])
    @recipes = @ingredient.recipes.paginate(page: params[:page], per_page: 6)
  end
  
  def new
    @ingredient = Ingredient.new
  end
  
  def create
    @ingredient = Ingredient.new(ing_params)
    if @ingredient.save
      flash[:success] = "Ingredient was added successfully!"
      redirect_to recipes_path
    else
      render 'new'
    end
  end
  
  private
  
    def ing_params
      params.require(:ingredient).permit(:name)
    end
end


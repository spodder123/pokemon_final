class CategoriesController < ApplicationController
  def index
    @categories = Category.all.page params[:page]
  end

  def show
    @category = Category.find(params[:id])
    @pokemons = @category.pokemons
  end
end

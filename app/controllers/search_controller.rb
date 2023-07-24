class SearchController < ApplicationController

  def index
    # Retrieve the search parameters from the query string
    category_id = params[:category]
    search_keyword = params[:search]

    # Query the CityBike model based on the search parameters
    @pokemons = if category_id == 'all' || category_id.blank?
                    Pokemon.where('name LIKE ?', "%#{search_keyword}%")
                  else
                    Pokemon.where('category_id = ? AND name LIKE ?', category_id, "%#{search_keyword}%")
                  end

    # Check if @city_bikes is empty and set a message if no results found

  end
end


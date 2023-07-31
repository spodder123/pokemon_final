class CartController < ApplicationController
  def index
    @pokemons = Pokemon.find(@cart.map { |a| a['id'] })
  end

    def addtocart
      puts params.inspect
      pokemonid = params[:pokemonid]

      #puts pokemonid
      cartitem = {'id' => pokemonid.to_i, 'qty' => 1 }
      session[:mycart] << cartitem unless session[:mycart].any? do |item| item['id'] == cartitem['id'] end
        #puts session[:mycart]
      redirect_to cart_path
    end

    def removeitem
      puts params.inspect
      pokemonid = params[:pokemonid].to_i
      session[:mycart].delete_if { |item| item['id'] == pokemonid}
      redirect_to cart_path
    end

end

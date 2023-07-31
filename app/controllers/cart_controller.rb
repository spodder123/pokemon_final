class CartController < ApplicationController
  def index


  end

    def addtocart
      puts params.inspect
      pokemonid = params[:pokemonid]
      #quantity = params[:quantity]
      #puts quantity.inspect
      cartitem = {'id' => pokemonid.to_i, 'qty' => 1 }

     # redirect_to root_path
    end

end

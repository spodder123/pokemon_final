class CheckoutController < ApplicationController
  def getcheckout

    if @cart.length == 0
      redirect_to cart_path
      return
    end
    if user_signed_in?
      @Province= User.where(id: current_user.id).first.province_id
    else
      @Province = params[:Province].to_i
    end


    @total = 0

    @cart.each do |item|
      pokemon= Pokemon.find( item['id'])
        @total += pokemon.price * item['quantity'].to_i
    end


  puts @total.inspect
  console

 @prov= Province.find(@Province)


  @tax= ((@total * (@prov.PST + @prov.GST + @prov.HST)) /100)

  puts @tax.inspect

  session[:total] = @total
  session[:province]= @prov
  session[:tax]= @tax

    redirect_to checkout_path

  end

  def index
    @total= session[:total]
    @prov= session[:province]
    @tax= session[:tax]
    @final_total = @total.to_f + @tax.to_f
  end

def invoice


end


end



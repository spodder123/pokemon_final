class CheckoutController < ApplicationController
  def getcheckout



    if @cart.length == 0
      redirect_to cart_path
      return
    end
    if user_signed_in?
      @Province= User.where(id: current_user.id).first.province_id
      @address = User.where(id: current_user.id).first.address
      @postal = User.where(id: current_user.id).first.postal_code
    else
      @Province = params[:Province].to_i
      @address = params[:address]
      @postal = params[:postal]
    end

    if @address.blank?
      flash[:error] = "Please provide a delivery address."
      redirect_back(fallback_location: cart_path)
      return
    end

    @total = 0

    @cart.each do |item|
      pokemon= Pokemon.find( item['id'])
        @total += pokemon.price * item['quantity'].to_i
    end


  puts @total.inspect
  console

 @prov= Province.find(@Province)
 @province_name = @prov.name


  @tax= ((@total * (@prov.PST + @prov.GST + @prov.HST)) /100)

  puts @tax.inspect
  puts @tax
  session[:pst] = ((@total * (@prov.PST))/100)
  session[:gst] = ((@total * (@prov.GST))/100)
  session[:hst] = ((@total * (@prov.HST))/100)
  session[:total] = @total
  session[:province]= @prov
  session[:tax]= @tax
  session[:address] = @address
  session[:province]['name']= @province_name
  session[:postal] = @postal



    redirect_to checkout_path

  end

  def index
    @address = session[:address]
    @total= session[:total]
    @prov= session[:province]
    @tax= session[:tax]
    @pst = session[:pst]
    @gst = session[:gst]
    @hst = session[:hst]
    @final_total = @total.to_f + @tax.to_f
    @province_name = session[:province]['name']
    @postal = session[:postal]

  end

def invoice

  @address = session[:address]
  @postal = session[:postal]
  @province_name = session[:province]['name']
  @total= session[:total]
  @tax= session[:tax]
  @pst = session[:pst]
  @gst = session[:gst]
  @hst = session[:hst]
  province = session[:province]
  puts province["id"]
  @order = Order.create!(
  province: province["id"],
  PST: province["PST"],
  GST: province["GST"],
  HST: province["HST"],
  status: "paid",
  total: @total.to_f + @tax.to_f,
  user_id: user_signed_in? ? current_user.id : nil

  )

  @cart.each do |item|
    orderitems = OrderItem.create!(
      pokemon_id: item['id'],
      quantity: item['quantity'],
      price: Pokemon.find(item['id'].to_i).price,
      order_id: @order.id
    )
  end
  session[:total] = nil
  session[:tax] = nil
  session[:province] = nil
  session[:mycart] = nil
  @cart = nil
end


end



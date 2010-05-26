class BookingsController < ApplicationController
  def index
    render
  end
  
  def create
    if @booking = Booking.find_by_phone(params[:booking][:phone])
      if @booking.claimed?
        flash[:notice] = 'This booking had been claimed.'
        redirect_to bookings_url
      else
        redirect_to booking_url(@booking)
      end
    else
      flash[:notice] = 'Invalid phone number.'
      redirect_to bookings_url
    end
  end
  
  def show
    @booking = Booking.find(params[:id])
    if @booking.claimed?
      flash[:notice] = 'This booking had been claimed.'
      redirect_to bookings_url
    else
      render
    end
  end
  
  def update
    @booking = Booking.find(params[:id])
    if @booking.claimed?
      flash[:notice] = 'This booking had been claimed.'
      redirect_to bookings_url
    else
      @booking.update_attributes!({:claimed => true})
      flash[:notice] = "#{@booking.phone} claimed!"
      redirect_to bookings_url
    end
  end
end

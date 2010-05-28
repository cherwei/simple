class BookingsController < ApplicationController
  def index
    render
  end
  
  def create
    if !params[:booking][:phone].blank?
      @bookings = Booking.find(:all, :conditions => {:phone => params[:booking][:phone]})
      unless @bookings.empty?
        render :action => :results
      else
        flash[:notice] = 'Phone number not found or invalid'
        redirect_to bookings_url
      end
    elsif !params[:booking][:email].blank?
      @bookings = Booking.find(:all, :conditions => {:email => params[:booking][:email]})
      unless @bookings.empty?
        render :action => :results
      else
        flash[:notice] = 'Email not found or invalid'
        redirect_to bookings_url
      end
    else
      flash[:notice] = 'Phone number/email can not be blank.'
      redirect_to bookings_url
    end
  end
  
  def show
    @booking = Booking.find(params[:id])
    if @booking.claimed?
      flash[:notice] = 'This booking have been claimed.'
      redirect_to bookings_url
    else
      render
    end
  end
  
  def update
    @booking = Booking.find(params[:id])
    if @booking.claimed?
      flash[:notice] = 'This booking have been claimed.'
      redirect_to bookings_url
    else
      @booking.update_attributes!({:claimed => true})
      flash[:notice] = "#{@booking.phone} claimed!"
      redirect_to bookings_url
    end
  end
end

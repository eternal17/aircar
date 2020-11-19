class BookingsController < ApplicationController

  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new
  end

  def create
    @user = current_user
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.car = @car
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render car_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end

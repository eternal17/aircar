class CarsController < ApplicationController
  def index
    @cars = Car.all
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    markers
    if params[:query].present?
      @cars = Car.all.search_by_make_and_model(params[:query])
      markers
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to car_path(@car)
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
  end

  private

    def markers
    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude
      }
    end
  end

  def car_params
    params.require(:car).permit(:make, :model, :year, :seats, :transmission, :description, :price, :photo, :address)
  end
end

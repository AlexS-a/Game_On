class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @game = Game.find(params[:game_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @game = Game.find(params[:game_id])
    @booking.game = @game
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:rent_start, :rent_end)
  end

end

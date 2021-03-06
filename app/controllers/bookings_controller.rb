class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :status_accept]
  def index
    @bookings = policy_scope(Booking)

  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    @game = Game.find(params[:game_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.status = "pending"
    @game = Game.find(params[:game_id])
    @booking.game = @game
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @game = Game.find(params[:game_id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
    authorize @booking
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
    authorize @booking
  end

  def status_accept
    @booking = Booking.find(params[:id])
    @booking.status = "accepted"
    @booking.save
    redirect_to user_path(@booking.user)
    authorize @booking
  end

  def status_decline
    @booking = Booking.find(params[:id])
    @booking.status = "declined"
    @booking.save
    redirect_to user_path(@booking.user)
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:rent_start, :rent_end)
  end

end

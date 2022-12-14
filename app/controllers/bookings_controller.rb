class BookingsController < ApplicationController
  before_action :set_bar, only: [:new, :create]

  def index
    @bookings = Booking.where(user: current_user)
    @bars = Bar.where(user: current_user)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.bar = @bar
    @booking.user = current_user

    if @booking.save

      days = (@booking.end_date - @booking.start_date).to_i + 1
      cost = @booking.bar.price * days

      flash[:notice] = "Thank you for booking with us. A confirmation email will be sent to you shortly."
      redirect_to bar_path(@bar)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @bar = Bar.find(@booking.bar_id)
  end

  def update
    @booking = Booking.find(params[:id])
    @bar = Bar.find(@booking.bar_id)
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def set_bar
    @bar = Bar.find(params[:bar_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

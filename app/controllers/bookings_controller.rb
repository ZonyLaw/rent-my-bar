class BookingsController < ApplicationController
  before_action :set_bar, only: [:new, :create]

  def index
    @bookings = Booking.where(user: current_user)
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

      flash[:notice] = "Thank you for your booking. The cost for #{days} #{days === 1 ? "day" : "days"} is £#{cost}."
      redirect_to bar_path(@bar)

    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_bar
    @bar = Bar.find(params[:bar_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

class BookingsController < ApplicationController
  before_action :set_bar, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new (booking_params)
    @booking.bar = @bar
    @booking.user = @bar.user
    # raise

    if @booking.save
      flash[:notice] = 'Booking is successful!'
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

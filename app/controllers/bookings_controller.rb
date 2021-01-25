class BookingsController < ApplicationController
    def new
        if params[:flight] && params[:passengers]
            @flight = Flight.find_by_id(params[:flight])
            @booking = Booking.new(flight:@flight)
            params[:passengers].to_i.times do
                @booking.passengers.build
            end
        else
            flash.now[:alert] = "Flight was not selected."
        end
    end

    def show
        @booking = Booking.find_by_id(params[:id])
        @passengers = @booking.passengers
    end

    def create
        @booking = Booking.new(booking_params)
        p "Booking Info"
        p @booking.passengers
        if @booking.save
            redirect_to @booking, :notice => "Booking has been saved successfully."
            @booking.passengers.each do |passenger|
                PassengerMailer.with(user:passenger, flight: @booking.flight).thank_you.deliver_later
            end
        else
            flash.now[:alert] = "Booking can not be saved, please review form."
            render :new
        end
    end

    private
    def booking_params
        params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :phone_number, :email])
    end
end

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
        @flight = Flight.find_by_id(params[:flight])
        if @booking.save
            redirect_to @booking, :notice => "Booking has been saved successfully."
        else
            flash.now[:alert] = "Booking can not be saved, please review form."
            p "Booking error"
            p @booking
            p @booking.errors.full_messages
            render :new
        end
    end

    private
    def booking_params
        params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :phone_number, :email])
    end
end

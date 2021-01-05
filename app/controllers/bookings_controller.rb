class BookingsController < ApplicationController
    def new
        if params[:flight] && params[:passengers]
            @flight = Flight.find_by_id(params[:flight])
            @booking = Booking.new(flight:@flight)

            params[:passengers].to_i.times do
                @booking.passengers.build
            end

            p "Flight"
            p @flight
            p "New Booking"
            p @booking

            p "Booking Passengers"
            p @booking.passengers
        else
            flash.now[:alert] = "Flight was not selected."

        end
    end

    def create
    end

    private
    def booking_params
        params.require(:booking).permit(:name, addresses_attributes: [:id, :kind, :street])
    end


end

class BookingsController < ApplicationController
    def new
        @flight = Flight.find_by_id(params[:flight])
        @booking = Booking.new(flight:@flight)

        params[:passengers].to_i.times do
            @booking.passengers.build
        end

        p "New Booking"
        p @booking
    end

end

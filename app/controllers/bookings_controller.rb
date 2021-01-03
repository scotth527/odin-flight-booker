class BookingsController < ApplicationController
    after_filter "save_my_previous_url", only: [:new]

    def new
        if params[:flight] && params[:passengers]
            @flight = Flight.find_by_id(params[:flight])
            @booking = Booking.new(flight:@flight)
            p "Flight"
            p @flight
            p "New Booking"
            p @booking
        else
            flash.now[:alert] = "Flight was not selected."

        end
    end

    def save_my_previous_url
    # session[:previous_url] is a Rails built-in variable to save last url.
        session[:my_previous_url] = URI(request.referer || '').path
    end

end

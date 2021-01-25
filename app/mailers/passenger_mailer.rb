class PassengerMailer < ApplicationMailer

    def thank_you
        @user = params[:user]
        p "USER IN BOOKING"
        p @user
        @flight = params[:flight] || "HEY THEREEE"
        mail(to: @user.email, subject:"Booking Confirmation")
    end
end

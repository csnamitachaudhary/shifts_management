class ShiftMailer < ApplicationMailer
    def shift_email
        @team = params[:team]
        mail(to: 'cr_dev@full-cycle.com', subject: "Shift added for all members")
      end
end

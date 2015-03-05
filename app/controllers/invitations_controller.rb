class InvitationsController < ApplicationController
  def create
    invitation = Invitation.new(model_param)

    if invitation.create_and_send
      redirect_to root_path, notice: 'We have successfully invited you to Slack. See you there!'
    else
      redirect_to root_path, alert:  "Sorry, we were not able to invite you to Slack - #{invitation.errors.full_messages}."
    end
  end

  private

    def model_param
      params.require(:invitation).permit(:email)
    end
end

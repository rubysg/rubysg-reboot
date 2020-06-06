class Api::RubySgBotController < Api::ApplicationController
  def webhook
    head :no_content
  end
end

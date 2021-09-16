# frozen_string_literal: true

class FormsController < ApplicationController
  def show
    @form = find_form_klass(params[:form_type]).new

  rescue NameError
    redirect_to "/404"
  end

  def create
    @form = find_form_klass(form_params.require(:form_type)).new(form_params)

    if @form.submit
      redirect_to :root
    else
      render :show
    end

  rescue NameError
    redirect_to "/404"
  end

  private

  def form_params
    params.require(:form)
  end

  def find_form_klass(form_type)
    "Feedback::#{form_type.camelcase}".constantize
  end
end

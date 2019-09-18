class PagesController < ApplicationController
  before_action :set_variant, only: [:main]
  def main

    respond_to do |format|
      format.html(&:phone)
      # do |html|
      # html.phone
      # html.tablet
      # end
    end
  end


  private

  def set_variant
    case request.user_agent
    when /iPhone/i
      request.variant = :phone
    when /Android/i && /mobile/i
      request.variant = :phone
    when /Windows Phone/i
      request.variant = :phone
    # when /Android/i
    #   request.variant = :tablet
    # when /iPad/i
    #   request.variant = :tablet
    end
  end

end

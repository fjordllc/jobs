# frozen_string_literal: true

class PagesController < ApplicationController
  include HighVoltage::StaticPage

  layout :layout_for_page

  private

  def layout_for_page
    case params[:id]
    when 'welcome', 'pp', 'tos'
      'lp'
    else
      'application'
    end
  end
end

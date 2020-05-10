# frozen_string_literal: true

class HomeController < ApplicationController
  layout 'lp'

  def index
    @jobs = Job.order(:created_at)
  end
end

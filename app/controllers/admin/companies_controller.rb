# frozen_string_literal: true

class Admin::CompaniesController < Admin::BaseController
  def index
    @companies = Company.order(:created_at)
  end
end

# frozen_string_literal: true

class CompaniesController < ApplicationController
  def index
    @companies = Company.order(:created_at)
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      sign_in @company
      redirect_to root_path, flash: { notice: '企業登録してログインしました。' }
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:email)
  end
end

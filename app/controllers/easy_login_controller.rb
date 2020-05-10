# frozen_string_literal: true

class EasyLoginController < ApplicationController
  layout false

  def show
    EmailLogin.classes.each { |c| instance_variable_set("@#{c.to_s.tableize}", c.all) }
  end

  def login
    EmailLogin.classes.each do |c|
      key = "#{c.to_s.downcase}_id"
      if params[key]
        sign_in c.find(params[key])
        redirect_to root_path, notice: "#{c}としてログインしました。"
      end
    end
  end

  def logout
    if params['role']
      sign_out params['role'].camelize.constantize
      redirect_to root_path, notice: "#{params['role'].camelize}としてログアウトしました。"
    else
      logout_all
    end
  end

  private

  def logout_all
    EmailLogin.classes.each { |c| sign_out c }
    redirect_to root_path, notice: '全てをログアウトしました。'
  end
end

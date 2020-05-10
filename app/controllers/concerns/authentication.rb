# frozen_string_literal: true

# Authentication methods for controllers
module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method \
      :current_admin,
      :current_company,
      :current_user,
      :admin_signed_in?,
      :company_signed_in?,
      :user_signed_in?
  end

  def sign_in(record)
    type = record.class.to_s.underscore
    session["#{type}_id"] = record.id
  end

  def sign_out(tokenizable_class)
    type = tokenizable_class.to_s.underscore
    session.delete "#{type}_id"
  end

  def current_admin
    @current_admin ||= Admin.find_by(id: session['admin_id'])
  end

  def current_company
    @current_company ||= Company.find_by(id: session['company_id'])
  end

  def current_user
    @current_user ||= User.find_by(id: session['user_id'])
  end

  def admin_signed_in?
    !current_admin.nil?
  end

  def company_signed_in?
    !current_company.nil?
  end

  def user_signed_in?
    !current_user.nil?
  end

  def require_admin!
    return if current_admin

    redirect_to root_path, alert: '管理者ログインが必要です。'
  end

  def require_company!
    return if current_company

    redirect_to root_path, alert: '企業ログインが必要です。'
  end

  def require_user!
    return if current_user

    redirect_to root_path, alert: 'ユーザーログインが必要です。'
  end
end

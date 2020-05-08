# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :require_admin!
end

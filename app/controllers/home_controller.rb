# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @service_centers = ServiceCenter.all
  end
end

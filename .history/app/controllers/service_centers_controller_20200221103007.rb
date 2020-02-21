class ServiceCentersController < ApplicationController
    def new
        @new_center=ServiceCenter.new
    end
    def create
        @new_center=ServiceCenter.new(allowed_parameters)
    end
end

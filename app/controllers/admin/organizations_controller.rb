module Admin
  class OrganizationsController < ApplicationController
    def index
      @organizations = Organization.all
    end
    
    def new
      @organization = Organization.new
    end
    
    def create
      organization = Organization.new(params[:organization])
      if organization.save
        flash[:notice] = "Successfully created a new organizations called #{organization.name}"
        redirect_to admin_organizations_url
      else
        render :action=>:new
      end
    end

  end
end
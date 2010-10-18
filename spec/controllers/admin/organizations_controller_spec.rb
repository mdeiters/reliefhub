require 'spec_helper'

describe Admin::OrganizationsController do
  describe 'new' do
    it 'should get a new organizations' do
      Organization.stubs(:new).returns(organization=stub)
    
      get :new
    
      assigns[:organization].should == organization
    end
  end
  
  describe 'create' do
    before :each do
      @data = stub
      Organization.stubs(:new).returns(@organization=stub)
      @organization.stubs(:name).returns('my orphanage')
    end
    it 'should successfully create and redirect to index' do
      @organization.stubs(:save).returns(true)

      post :create, :organization=>@data
      
      response.should redirect_to(admin_organizations_path)
      flash[:notice].should == "Successfully created a new organizations called my orphanage"
      
      Organization.should have_received(:new).with(@data)
    end

    it 'should stay on the edit page when saving fails' do
      @organization.stubs(:save).returns(false)
      
      post :create, :organization=>@data
      
      response.should render_template(:new)
      
      Organization.should have_received(:new).with(@data)
    end
  end
  
end

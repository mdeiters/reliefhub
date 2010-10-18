require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Organization do
  
  it 'should combine address fields into a single address' do
    organization = Factory.build :organization, :street1=>'123 main', :street2=>'apt 2', :city=>'cambridge', :state=>'mass', :zip=>'02138'
    organization.address.should == '123 main, apt 2, cambridge, mass, 02138'
  end
  
  it 'should return the number of projects' do
    organization = Factory.build :organization, :street1=>'123 main', :street2=>'apt 2', :city=>'cambridge', :state=>'mass', :zip=>'02138'
    organization.number_of_projects.should == 0
    pending("implement when we integrate projects")
  end
    
  
end

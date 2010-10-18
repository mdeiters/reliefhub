class Organization < ActiveRecord::Base
  def address
    [:street1, :street2, :city, :state, :zip].map {|field| self.send(field) }.compact.join(', ')
  end
  
  def number_of_projects
    0
  end
end

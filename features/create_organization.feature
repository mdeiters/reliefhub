Feature: Add/Edit a new organization
As an administrator
I want to be able to Add/Edit an organization


	Scenario: View organizations
	  Given I go to the organizations page
	   Then I should see "Organization"

	Scenario: Create a new organization
	  Given I go to the organizations page
	   When I follow "Create"
	   When I fill in "Name" with "my orphanage"
	    And I fill in "Street1" with "123 main st"
	    And I fill in "City" with "boston"
	    And I fill in "State" with "Mass"
	    And I fill in "Contact person" with "alex"
	    And I fill in "Phone number" with "123-456-7890"
	    And I press "Create Organization"
	   Then I should see "Successfully created a new organizations called my orphanage"




Feature: Sign up

  In order to get access to protected sections of the site
  As a user
  I should be able to sign up

  Scenario: User signs up with invalid data
    When I go to the sign up page
    And I fill in "Email" with "invalidemail"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with ""
    And I press "Sign up"
    Then I should see error messages on the page

  Scenario: User signs up with valid data
    When I go to the sign up page
    And I fill in "Email" with "email@person.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Sign up"
    Then I should see "instructions for confirming"
    And a confirmation message should be sent to "email@person.com"

  Scenario: User confirms his account
    Given I signed up with "email@person.com/password"
    When I follow the confirmation link sent to "email@person.com"
    Then I should see "Confirmed email and signed in"
    And I should be signed in

  Scenario: Signed in user clicks confirmation link again
    Given I signed up with "email@person.com/password"
    When I follow the confirmation link sent to "email@person.com"
    Then I should be signed in
    When I follow the confirmation link sent to "email@person.com"
    Then I should see "Confirmed email and signed in"
    And I should be signed in

  Scenario: Signed out user clicks confirmation link again
    Given I signed up with "email@person.com/password"
    When I follow the confirmation link sent to "email@person.com"
    Then I should be signed in
    When I sign out
    And I follow the confirmation link sent to "email@person.com"
    Then I should see "Already confirmed email. Please sign in."
    And I should be signed out


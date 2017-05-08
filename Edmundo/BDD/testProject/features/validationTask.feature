Feature: Validation taks

Scenario: Validate Zip, username, county
  Given a zip code of "45612"
    And a username "onlylower"
    And country "Bolivia"
  When I enter the values to the system
  Then I validate the zip code
    And I validate the username
    And I validate the country

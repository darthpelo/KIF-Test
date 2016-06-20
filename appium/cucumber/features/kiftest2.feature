Feature: Press button
  As an iOS developer
  I want to be able to press a button
  And I want to enter a value in a text field

  Scenario: Add two numbers
    Given The view title was First View
    And I press a button labelled Next
    And I have entered 2 into field 1 of the application
    Then The view title was Second View

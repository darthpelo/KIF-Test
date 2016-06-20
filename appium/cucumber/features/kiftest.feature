Feature: Press button
  As an iOS developer
  I want to be able to press a button

  Scenario: Add two numbers
    Given The view title was First View
    And I press a button labelled Next
    Then the view title was Second View

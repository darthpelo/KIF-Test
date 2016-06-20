Feature: Press button
  As an iOS developer
  I want to be able to press a button
  And I want to insert data

  Scenario: Go to the Second View
    Given The view title labelled First View
    And I press a button labelled Next
    Then The view title labelled Second View

  Scenario: Insert a text in the Second View
    Given The view title labelled First View
    And I press a button labelled Next
    And I have entered 2 into field 1 of the application
    Then The view title labelled Second View

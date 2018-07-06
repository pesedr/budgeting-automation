Feature: Inflow vs outflow shows budget items per category

  Background: A user added a budget item and checks reports to see the inflow vs outflow
    Given a user visits the budget page

  Scenario: User sees the category he has recently added in the inflow vs outflow
    When a user inputs the description: car 
    And fills in the value with: 288
    And selects the category: Insurance
    And clicks the add button
    And he navigates to the reports page
    Then he sees the category added: Insurance
    And he sees the correct amount: 288

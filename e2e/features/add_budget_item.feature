Feature: Adding an item to budget

  Background: A user visits the budget page to add an item
    Given a user visits the budget page

  Scenario: User successfully adds a new budget item of money spent
    When a user inputs the description: random expense
    And fills in the value with: 300
    And clicks the add button
    Then he sees the amount 300 with negative sign in the list
    And he sees the description of the list item: random expense

  Scenario: User tries to add item with empty value
    When a user inputs the description: empty value
    And doesn't fill in a value
    And clicks the add button
    Then he doesn't see the item added: empty value

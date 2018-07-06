# Ruby automation exercise
Using cucumber, capybara, siteprism and selenium

## Running the web sever
```shell
git clone git@github.com:pesedr/budgeting-automation.git
cd budgeting
yarn install
yarn serve
```

## Running the tests
```shell
cd e2e
gem install nokogiri -v '1.8.4' --source 'https://rubygems.org/'
bundle install
cucumber
```

## Test Plan

Since this is an example of a test plan for a simple app, environments, versioning and schedules will be omitted. 

Testing tasks:

    Budget page:
        
        Adding items: 

            Base case:
                Fill in description
                Fill in value
                Click add button
                Verify correct category, description and amount show up. 
                Verify correct format of each field

            1. Add an item with category income: 
                Choose category income
                Do base case
                Verify amount shows up green with no negative sign

            2. Total outflow should increment accordingly
                Check total outflow balance
                Do base case
                Verify total outflow increments by value set

            3. Total inflow should increment accordingly
                Check total inflow balance
                Do test case 1: Add an item with category income
                Verify total inflow increments by value set

            4. Total working balance should increment accordingly
                Check total working balance
                Do test case 1: Add an item with category income
                Verify total working balance increments by value set

            5. Total working balance should decrement accordingly
                Check total working balance
                Do base case
                Verify total working balance decrements by value set

            6. Verify working balance is positive if total inflow is greater
                Do base case with a value greater than total outflow
                Verify total working balance is the difference between total inflow and total outflow
                Verify total working balance is positive and green

            7. Verify working balance is negative if total outflow is greater (bug)
                Do test case 1 with a value greater than total inflow
                Verify total working balance is the difference between total inflow and total outflow
                Verify total working balance is negative and red

            8. Verify total inflow is correct
                Add all income items from the list
                Verify total inflow is the same as the addition from previous step

            9. Verify total outflow is correct
                Add all non-income items from the list
                Verify total outflow is the same as the addition from previous step

        Navigation bar:
            
            1. Budget link
                Click budget link
                Verify page stays in /budget without reloading
            
            2. Reports link
                Click reports link
                Verify page navigates to /reports/inflow-outflow
            
            3. Star link
                Click star link
                Verify a new tab with github link to repo opens
            
            4. Fork link
                Click fork link
                Verify a new tab with github link to fork the repo opens
            
            4. Modus logo
                Verify the modus logo appears in the top right corner of the screen
            
    Reports page

        Navigation within page:

            1. Inflow vs outflow: 
                Should be the default page in Reports
                Verify that there are two bar graphs
                Verify that it has categories and amounts

            2. Spending by category
                Click on spending by category
                Verify page navigates to circle graph without reloading
                Verify circle graph has animation
                Verify that it has categories and amounts

        Inflow vs Outflow:

            Pre-reqs: 
                Navigate to Reports -> Inflow vs Outflow

            1. Verify inflow matches budget
                Check Inflow total in graph
                Navigate to Budget page
                Check inflow total at the bottom
                Compare with the total in step 1
                Verify they are the same

            2. Verify outflow matches budget
                Check Outflow total in graph
                Navigate to Budget page
                Check outflow total at the bottom
                Compare with the total in step 1
                Verify they are the same

            3. Adding a new category
                Check which categories appear on screen
                Navigate to Budget page
                Do Budget page -> Adding item -> Base case with a category that did not appear in step 1
                Navigate back to reports page
                Verify that the new category appears with correct amount

            4. Verify inflow size matches budget
                Navigate to Budget page
                Do Budget page -> Adding item -> Case 6
                Navigate back to reports page
                Verify that the inflow bar is taller than the outflow bar


            5. Verify outflow size matches budget
                Navigate to Budget page
                Do Budget page -> Adding item -> Case 7
                Navigate back to reports page
                Verify that the outflow bar is taller than the inflow bar

            6. Verify that all categories show up in outcome graph
                Count all categories listed not income
                Count all colors in the outflow graph
                Verify that they are the same number
                Verify that colors in graph are proportionate to amounts in categories

        Spending by category

            Pre-reqs: 
                Navigate to Reports -> Spending by Category

            1. Verify that inflow does not show up
                Navigate to budget page
                Do Budget page -> Adding item -> Case 1
                Navigate back to spending by category page
                Verify that income does not show up in categories

            2. Verify that all categories show up in graph
                Count all categories listed
                Count all colors in the graph
                Verify that they are the same number
                Verify that colors in graph are proportionate to amounts in categories

            3. Adding a new category
                Check which categories appear on screen
                Navigate to Budget page
                Do Budget page -> Adding item -> Base case with a category that did not appear in step 1
                Navigate back to spending by category page
                Verify that the new category appears with correct amount

            4. Verify that existing categories increment
                Check which categories already exist
                Choose one of those, and take note of total
                Navigate to budget page
                Do Budget page -> Adding item -> Case 2 with values from step 2
                Navigate back to spending by category page
                Verify that the category in step 2 incremented by the corresponding value


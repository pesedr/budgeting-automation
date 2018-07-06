When /^a user inputs the description: (.*)$/ do |text|
  within(@page.description_field) do
    fill_in 'Description', with: text
  end
end

And /^fills in the value with: (.*)$/ do |number|
  within(@page.description_field) do
    fill_in 'Value', with: number
  end
end

And /^doesn't fill in a value$/ do
  within(@page.description_field) do
    fill_in 'Value', with: ''
  end
end

And /^selects the category: (.*)$/ do |category|
  @page.category_selector.select(category)
end

And /^clicks the add button$/ do
  @page.add_button.click
end

Then /^he sees the amount (.*) with negative sign in the list$/ do |value|
  new_value = "-$" + value.to_s + ".00"
  expect(page).to have_content(new_value)
end

And /^he sees the description of the list item: (.*)$/ do |item|
  expect(page).to have_content(item)
end

Then /^he doesn't see the item added: (.*)$/ do |item|
  expect(page).to have_no_content(item)
end

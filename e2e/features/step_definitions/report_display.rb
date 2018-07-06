Then /^he sees the category added: (.*)$/ do |item|
  @page = Reports.new
  expect(page).to have_content(item)
end

And /^he sees the correct amount: (.*)$/ do |amount|
  @page = Reports.new
  new_amount = '$' + amount + '.00'
  expect(page).to have_content(new_amount)
end

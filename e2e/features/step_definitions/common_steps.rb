Given /^a user visits the budget page$/ do 
  @page = Budget.new
  @page.load
end

And /^he navigates to the reports page$/ do 
  @page.links[1].click
end

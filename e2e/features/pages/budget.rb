require_relative 'base'

class Budget < Base
  set_url ''
  element :description_field, "._3Tz1l"
  element :add_button, "button[type='submit']"
  element :category_selector, "select[name='categoryId']"
  elements :links, "main div a"
end

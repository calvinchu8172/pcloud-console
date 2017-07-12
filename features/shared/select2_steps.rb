When /^(?:|the .+ )selects "([^"]*)" with "([^"]*)" option$/ do |field, value|
  select2(value, from: field_id(field))
end

When /^(?:|the .+ )clears "([^"]*)" option$/ do |field|
  select2_clear(from: field_id(field))
end

Then /^(?:|the .+ )should download a file - "([^"]*)"$/ do |filename|
  expect(download_basename).to eq filename
end

Then /^the file content should be:$/ do |content|
  expect(download_content).to eq content
end

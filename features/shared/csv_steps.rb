Then /^(?:|the .+ )should download a csv file - "([^"]*)"$/ do |csv_filename|
  expect(download_basename).to eq csv_filename
end

Then /^the csv file headers should be:$/ do |headers|
  expect(csv_file[0]).to eq JSON.parse(headers)
end

Then /^the csv file content should be:$/ do |content|
  expect(csv_file.from(1)).to eq JSON.parse(content)
end

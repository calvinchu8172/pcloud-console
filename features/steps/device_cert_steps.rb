Given /^Pcloud Server has an Device Cert data as below:$/ do |device_cert_json|
  device_cert = Pcloud::DeviceCert.new(JSON.parse(device_cert_json))
  @device_certs ||= []
  @device_certs << device_cert
end
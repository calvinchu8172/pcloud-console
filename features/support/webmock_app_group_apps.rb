Before '@webmock' do
  # App - Index
  stub_request(:get, "https://#{ENV['PUSH_HOST']}/v1/app_groups/569e2004-6ad8-4681-81dd-8769d2ea9b0b/apps").with(
    query: hash_including({ access_key_id: ENV['PUSH_ACCESS_KEY_ID'] })
  ).to_return{ |request|
    @apps ||= []
    # 產生 response
    response = {
      code: '0000',
      message: 'OK',
      data: @apps.map(&:serializable_hash)
    }
    # 返回
    {
      headers: {
        'Content-Type' => 'application/json'
      },
      body: response.to_json
    }
  }
end
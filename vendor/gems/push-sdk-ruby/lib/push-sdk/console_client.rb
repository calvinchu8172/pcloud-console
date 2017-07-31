module Push
  class ConsoleClient < Client

    def access_key_id
      ENV['PUSH_ACCESS_KEY_ID']
    end

    def private_key
      ENV['PUSH_PRIVATE_KEY']
    end
  end
end

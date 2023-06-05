# frozen_string_literal: true

Searchkick.client = Elasticsearch::Client.new(
  hosts: ENV['ELASTICSEARCH_URL'] || 'localhost:9200',
  retry_on_failure: true,
  transport_options: {
    request: {
      timeout: 250
    }
  }
)

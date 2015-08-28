require 'test_helper'

def client
  @client ||= PaperCup::Client.new(
    url:     'http://api.github.com',
    params:  { test_param_1: :pepito, test_param_2: :pepita },
    headers: { 'X-Test-Header-1': :pepote, 'X-Test-Header-2': :papita }
  )
end

describe PaperCup::Client do
  it '#merged_opts_for_request merges options properly' do
    result = client.send :merged_opts_for_request, {
      method:   :get,
      path:     '/users/casapick',
      params:   { test_param_2: :popote, test_param_3: :papota },
      headers:  { 'X-Test-Header-2': :popote, 'X-Test-Header-3': :papota }
    }

    assert_equal result.fetch(:method), :get
    assert_equal result.fetch(:url), 'http://api.github.com/users/casapick'
    assert_equal result.fetch(:params), test_param_1: :pepito, test_param_2: :popote, test_param_3: :papota
    assert_equal result.fetch(:headers), 'X-Test-Header-1': :pepote, 'X-Test-Header-2': :popote, 'X-Test-Header-3': :papota
  end

  it '#endpoint returns a new client with merged url, params and headers' do
    users = client.endpoint(:users,
      params:   { test_param_2: :popote, test_param_3: :papota },
      headers:  { 'X-Test-Header-2': :popote, 'X-Test-Header-3': :papota }
    )

    assert_equal users.base_url 'http://api.github.com/users'
    assert_equal users.params, test_param_1: :pepito, test_param_2: :popote, test_param_3: :papota
    assert_equal users.headers, 'X-Test-Header-1': :pepote, 'X-Test-Header-2': :popote, 'X-Test-Header-3': :papota
  end
end

Instalation
----

Add `gem paper-cup` to your gemfile.

Configuration
-----

None!!! Yeaaaah!

Usage
-----

At the moment it only works for `POSTs`, `GETs` and `PUTs`. If the the response is a JSON the gem will parse it, if not it will show as it cames

GET
----

`PaperCup.get(url: url)`

POST - PUT
----------

`PaperCup.post(url: url, body: {name: 'pepe'}, headers: { "Content-Type" => "application/json"})`


Response
---------
Each request will return a `Response` object.

Example:

```ruby
  r = PaperCup.post(url, some_hash.to_json)
  puts r.response # It will print the response returned by the endpoint
  puts r.status # It will print the status code returned by the endpoint
```

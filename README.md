Instalation
----

Add `gem paper-cup` to your gemfile.

Configuration
-----

None!!! Yeaaaah!

Usage
-----

For the moment it only works for `POSTs`, `GETs` and `PUTs` with `JSON` responses.

GET
----

`PaperCup.get(url)`

POST - PUT
----------

`PaperCup.post(url, some_hash.to_json)`


Response
---------
Each request will return a `Response` object.

Example:

```ruby
  r = PaperCup.post(url, some_hash.to_json)
  puts r.response # It will print the response returned by the endpoint
  puts r.status # It will print the status code returned by the endpoint
```

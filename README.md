# PaperCup

![TravisCI Badge](https://travis-ci.org/casapick/paper-cup.svg)

Instalation
----

Add `gem paper-cup` to your gemfile.

Configuration
-----

None!!! Yeaaaah!

Usage
-----

At the moment it only works for `POSTs`, `HEAD`s, `GETs` and `PUTs`. If the response is a JSON the gem will parse it, if not it will show as it cames

PaperCup only has these 4 methods: `#get`, `#head`, `#post` and `#put`.

For all the methods it accepts the next parameters:

  * url: is mandatory
  * headers: optional, it has to be a hash. Example: `{ "Content-Type" => "application/json"}`
  * params: optional, same as the header. Example: { name: "Goku", race: "Saiyan" }
  * body: optional, the body will be inserted with the [`-d`](http://curl.haxx.se/docs/manpage.html#-d) option of curl as it come.

All the method returns a [`Response`](https://github.com/casapick/paper-cup/blob/master/lib/paper_cup/response.rb) object, that has two attributes status and body. The status is the status code of the respond and the body is the response.

GET
----

`PaperCup.get(url: url)`

POST - PUT
----------

`PaperCup.post(url: url, params: {name: 'pepe'}, headers: { "Content-Type" => "application/json"})`


Response
---------
Each request will return a `Response` object.

Example:

```ruby
  r = PaperCup.post(url, body: some_hash.to_json, headers: { "Content-Type" => "application/json"})
  puts r.body # It will print the response returned by the endpoint
  puts r.status # It will print the status code returned by the endpoint
```

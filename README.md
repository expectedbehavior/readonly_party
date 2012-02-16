# ReadonlyParty

An HTTParty where the resources never change, the points are made up,
and everyboday wins

This is meant to be used in the same way as HTTParty and uses it under
the covers. Except, when the ReadonlyParty module is included in a
class, it explicitly disallow post, put, delete, and patch methods
from being called on that class.

## Installation

Add this line to your application's Gemfile:

    gem 'read_only_party'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install read_only_party

## Usage

```ruby
class ThingThatShouldOnlyRead
  include ReadonlyParty
end

ThingThatShouldOnlyRead.get("http://www.example.com") #=> some response
ThingThatShouldOnlyRead.head("http://www.example.com") #=> some response
ThingThatShouldOnlyRead.options("http://www.example.com") #=> some response

ThingThatShouldOnlyRead.put("http://www.example.com") #=> HTTPMethodDisallowedException
ThingThatShouldOnlyRead.post("http://www.example.com") #=> HTTPMethodDisallowedException
ThingThatShouldOnlyRead.delete("http://www.example.com") #=> HTTPMethodDisallowedException
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Meta

Maintained by Expected Behavior

Released under the MIT license. http://github.com/expected-behavior/readonly_party

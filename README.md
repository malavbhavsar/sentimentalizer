# sentimentalizer
[![Dependency Status](https://gemnasium.com/malavbhavsar/sentimentalizer.png)](https://gemnasium.com/malavbhavsar/sentimentalizer)  [![Build Status](https://secure.travis-ci.org/malavbhavsar/sentimentalizer.png?branch=master)](https://travis-ci.org/malavbhavsar/sentimentalizer)  [![Code Climate](https://codeclimate.com/github/malavbhavsar/sentimentalizer.png)](https://codeclimate.com/github/malavbhavsar/sentimentalizer)

Inspired by ~~[Sentan](https://github.com/martinrue/Sentan)~~ [node-sentiment](https://github.com/martinrue/node-sentiment).

This gem can be used separately or integrated with rails app.

## Instructions for Rails use

1. Install gem using bundler `gem "sentimentalizer"`

2. Run `rails g sentimentalizer`. This will generate an initializer file with after_initialize hook for rails. It's basically training a model to use in the application. It will run everytime you start server or run any rake commands, would love some input on this.

3. Now, you can run following after ```require "sentimentalizer"``` 
```ruby
Sentimentalizer.analyze('message or tweet or status')
# or for json output
Sentimentalizer.analyze('message or tweet or status', true)
```

You will get output like this 
```ruby
Sentimentalizer.analyze('i am so happy')
=> {'text' => 'i am so happy', 'probability' => '0.937', 'sentiment' => ':)' }
Sentimentalizer.analyze('i am so happy', true)
=> "{\"text\":\"i am so happy\",\"probability\":\"0.937\",\"sentiment\":\":)\"}"
```

## Instructions for Vanilla Ruby use

1. Install gem using bundler `gem "sentimentalizer"`

2. Either fire up `irb`, or require it in your project with `require 'sentimentalizer'`

3. Now, you need to train the engine in order to use it

```ruby
require "sentimentalizer"

Sentimentalizer.setup

# or, wrap it in a class so setup can be automatic
class Analyzer
  def initialize
    Sentimentalizer.setup
  end
  
  def process(phrase)
    Sentimentalizer.analyze phrase
  end
end

# or for json output
Sentimentalizer.analyze('message or tweet or status', true)
```

And now you will get output like this 
```ruby
analyzer = Analyzer.new
analyzer.process('i am so happy')
=> {'text' => 'i am so happy', 'probability' => '0.937', 'sentiment' => ':)' }
analyzer.process('i am so happy', true)
=> "{\"text\":\"i am so happy\",\"probability\":\"0.937\",\"sentiment\":\":)\"}"
```

## Contributing to sentimentalizer
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2015 malavbhavsar. See LICENSE.txt for
further details.


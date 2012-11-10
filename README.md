# sentimentalizer

This is totally ripped off of from [sentimentalizer](https://github.com/kouphax/sentimentalizer/) which was inspired by [Sentan](https://github.com/martinrue/Sentan).

This gem is designed to integrate directly with rails.

## Instructions for use

1. Install gem using bundler `gem "sentimentalizer"`

2. Create one initializer file named `"sentimentalizer_initializer.rb"` and add following code in it
```ruby
	require "sentimentalizer"
	module Your_app_name
		class Application < Rails::Application
			config.after_initialize do
				Sentimentalizer.setup
			end
		end
	end
```

3. Now, you can run following after ```require "sentimentalizer"``` 
```ruby
Sentimentalizer.analyze('message or tweet or status')
```

4. You will get output like this 
```ruby
Sentimentalizer.analyze('i am so happy')
=> {'text' => 'i am so happy', 'probability' => '0.937', 'sentiment' => ':)' }
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

Copyright (c) 2012 malavbhavsar. See LICENSE.txt for
further details.


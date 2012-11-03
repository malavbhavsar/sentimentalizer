Sentimentalizer
===============

This is totally ripped off of from [sentimentalizer](https://github.com/kouphax/sentimentalizer/) which was inspired by [Sentan](https://github.com/martinrue/Sentan).

This gem is designed to integrate directly with rails

Instructions for use:

1. Install gem using bundler gem "sentimentalizer", :git => "git@github.com:malavbhavsar/sentimentalizer.git"

2. Create one initializer and require 'sentimentalizer'

3. Run the Sentimentalizer.setup in initializer using after_initialize hook

4. Finally, you can run Sentimentalizer.analyze("message or tweet or status")

5. You will get output something like this {'text' => 'i am so happy', 'probability' => '0.937', 'sentiment' => ':)' }

File an issue if you find any problem
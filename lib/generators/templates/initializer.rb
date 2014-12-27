require 'sentimentalizer'

<%= Rails.application.class %>.configure do
  config.after_initialize do
    Sentimentalizer.setup
  end
end

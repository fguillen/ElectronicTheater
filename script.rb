require "dotenv/load"
require "ruby_llm"

RubyLLM.configure do |config|
  config.openai_api_key = ENV.fetch("OPENAI_API_KEY", nil)
  config.openrouter_api_key = ENV['OPENROUTER_API_KEY']
  config.default_model = "google/gemma-3-4b-it"
end

# puts "Available models:"
# RubyLLM.models.chat_models.each do |model|
#   puts "- #{model.id} (#{model.provider})"
# end
# exit 0

chat = RubyLLM.chat

response = chat.ask File.read("prompt.md")

puts response.content

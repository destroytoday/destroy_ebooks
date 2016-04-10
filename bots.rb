require 'twitter_ebooks'

class CloneBot < Ebooks::Bot
  def configure
    self.consumer_key = ENV['CONSUMER_KEY']
    self.consumer_secret = ENV['CONSUMER_SECRET']
  end

  def on_startup
    @model ||= Ebooks::Model.load('model/destroytoday.model')

    scheduler.every '6h' do
      tweet(@model.make_statement)
    end
  end
end

CloneBot.new('destroy_ebooks') do |bot|
  bot.access_token = ENV['ACCESS_TOKEN']
  bot.access_token_secret = ENV['ACCESS_SECRET']
end
# -*- coding: utf-8 -*-
require "rubygems"
require "sinatra"
require "twitter"

before do
  Twitter.configure do |config|
    config.consumer_key       = CONSUMER_KEY
    config.consumer_secret    = CONSUMER_SECRET
    config.oauth_token        = OAUTH_TOKEN
    config.oauth_token_secret = OAUTH_TOKEN_SECRET
  end

  client = Twitter::Client.new
end

get '/:id/:tweet' do
  guest  = URI.unescape(params[:id])
  tweet  = URI.unescape(params[:tweet])
  time   = Time.now
  str    = "@noize_hiokiにかわって@#{guest}がtweet! 「#{tweet}」 at #{time}"

  client.update(str)
  "Tweet complete!"
end

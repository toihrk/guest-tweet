# -*- coding: utf-8 -*-
require "rubygems"
require "sinatra"
require "twitter"
require "yaml"

before do
  env = YAML.load(File.open(File.dirname(__FILE__)+'/config.yml'))
  Twitter.configure do |config|
    config.consumer_key       = env["consumer_key"]
    config.consumer_secret    = env["consumer_secret"]
    config.oauth_token        = env["oauth_token"]
    config.oauth_token_secret = env["oauth_token_secret"]
  end

  @client = Twitter::Client.new
end

get '/:id/:tweet' do
  guest  = URI.unescape(params[:id])
  tweet  = URI.unescape(params[:tweet])
  time   = Time.now
  str    = "@noize_hiokiにかわって@#{guest}がtweet! 「#{tweet}」 at #{time}"

  @client.update(str)
  "Tweet complete!"
end

class PagesController < ApplicationController
  def home
  end

  def sms
     require 'twilio-ruby'

      account_sid = ENV["twilio_account_id"] # Your Account SID from www.twilio.com/console
      auth_token = ENV["twilio_token"]   # Your Auth Token from www.twilio.com/console

      @client = Twilio::REST::Client.new account_sid, auth_token
      message = @client.account.messages.create(:body => params[:message],
    :to => params[:number],    # Replace with your phone number
    :from => "+13234258562")  # Replace with your Twilio number

    puts message.sid
  end
end

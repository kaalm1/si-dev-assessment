class PagesController < ApplicationController
  def home
  end

  def sms
     require 'twilio-ruby'

      account_sid = "ACa72f1966df773899d8bf7a49987f861e" # Your Account SID from www.twilio.com/console
      auth_token = "03b48b02198bb8db0d5b1fbc1c9ae34a"   # Your Auth Token from www.twilio.com/console

      @client = Twilio::REST::Client.new account_sid, auth_token
      message = @client.account.messages.create(:body => params[:message],
    :to => params[:number],    # Replace with your phone number
    :from => "+13234258562")  # Replace with your Twilio number

    puts message.sid
  end
end

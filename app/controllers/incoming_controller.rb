class IncomingController < ApplicationController

  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    puts "INCOMING PARAMS HERE: #{params}"
    sender = params['sender']
    subject = params['subject']
    body = params['body']
    user = User.find_by_email(sender)
    id = user.id
    email = user.email

    bookmark = user.bookmarks.create( url: body )

    hashtags = params[:subject].scan(/#\w+/)
    hashtags.each do |hashtag|
      hashtag.sub!('#', '')
      category = Category.find_or_create_by(name: hashtag)
      bookmark.categories << category
    end

    head 200
  end
end

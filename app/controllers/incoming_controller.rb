class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts "INCOMING PARAMS HERE: #{params}"
    sender = params['sender']
    subject = params['subject']
    body = params['stripped-text']
    @user = User.find_by_email(sender)

    @bookmark = @user.bookmarks.new( url: body )

    hashtags = params[:subject].scan(/#\w+/)
    hashtags.each do |hashtag|
      hashtag.sub!('#', '')
      category = Category.find_or_create_by(name: hashtag)
      @bookmark.categories << category
      @user.categories << category
    end

    @bookmark.save!

    puts @bookmark.url
    puts @bookmark.categories

    head 200
  end
end

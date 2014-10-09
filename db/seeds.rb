# Create Users
5.times do
  user = User.new(
    name:       Faker::Name.name,
    email:      Faker::Internet.email,
    password:   Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Bookmarks
100.times do
  bookmark = Bookmark.new(
    user: users.sample,
    title: Faker::Lorem.sentence,
    url: Faker::Internet.url
  )
  bookmark.save!
end
bookmarks = Bookmark.all

# Create admin user
admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld'
)
admin.skip_confirmation!
admin.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Bookmark.count} bookmarks created"

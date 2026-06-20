admin = User.find_or_create_by!(email: "admin@thoughtlocker.com") do |u|
  u.name = "admin"
  u.password = "admin123"
  u.password_confirmation = "admin123"
end

blog = admin.blogs.find_or_create_by!(name: "My First Blog")
blog.posts.find_or_create_by!(title: "Welcome to ThoughtLocker") do |p|
  p.content = "This is a sample post to get you started."
end

puts "Seed complete. Sign in with: admin@thoughtlocker.com / admin123"

require 'random_data'

# Create Posts
50.times do
  Post.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

Post.find_or_create_by(title: 'Unique Post', body: "I'm the only one!")

postid = ''
posts.each do |x|
  if x.value?('Unique Post')
    postid = x.fetch('id')
    break
  end
end

Comment.find_or_create_by(body: 'unique comment', post: postid)

puts 'Seed finished'
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

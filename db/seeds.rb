# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
# second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
# first_post = Post.create(user: first_user, title: 'Hello', body: 'This is my first post')
# Comment.create(post: first_post, user: second_user, body: 'Hi Tom!')
# User.create(name: 'Micheal', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Nigeria.')
# Post.create(user: second_user, title: 'Hello', body: 'This is my third post')
# Post.create(user: second_user, title: 'jknj', body: 'This is my fourth post')
# Post.create(user: second_user, title: 'jhbhbjh', body: 'This is my fifth post')
# Post.create(user: second_user, title: 'wurujh', body: 'This is my sixth post')

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', email:
  'nwgwin@gmail.com', password: 'godwin', password_confirmation: 'godwin')

second_user = User.create(name: 'Lily', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Portugal.', email:
  'chioma@gmail.com', password: 'chioma', password_confirmation: 'chioma')

first_post = Post.create(user_id: first_user.id, title: 'Hello', body: 'This is my first post')



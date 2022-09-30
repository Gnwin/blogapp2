require 'rails_helper'

RSpec.describe 'Post', type: :system do
  describe 'show page' do
    before :each do
      @user = User.create(name: 'micheal', photo: 'allamurotov@mail.ru', bio: 'bio')
      @post = Post.create(user_id: @user.id, title: 'title', body: 'text')
      @comment = Comment.create(user_id: @user.id, post_id: @post.id, body: 'some text')
      visit user_posts_path(@user.id)
    end

    it "should see the post's title" do
      @user.posts.each do |i|
        expect(i.title).to eq('title')
      end
    end

    it 'should see who wrote the post' do
      user = User.first
      expect(page).to have_text(user.name)
    end

    it 'should see how many comments it has' do
      post = Post.first
      expect(page).to have_text(post.comments.count)
    end

    it 'should see how many likes it has' do
      post = Post.first
      expect(page).to have_text(post.likes.count)
    end

    it 'should see the post body' do
      post = Post.first
      expect(page).to have_text(post.body)
    end

    it 'see the username of each commentor' do
      expect(page).to have_text(@user.name)
    end

    it 'see the comment each commentor left' do
      post = Post.first
      post.comments.each do |i|
        expect(page).to have_text(i.body)
      end
    end
  end
end

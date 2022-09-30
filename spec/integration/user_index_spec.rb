require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'index page' do
    before :each do
      @user = User.create(name: 'micheal', photo: 'allamurotov@mail.ru', bio: 'bio')
      @post = Post.create(user_id: @user.id, title: 'title', body: 'text')
      @comment = Comment.create(user_id: @user.id, post_id: @post.id, body: 'some text')
      visit user_posts_path(@user.id)
    end

    it "can see the user's profile picture" do
      expect(page.find('.img_placeholder1')['alt']).to eq('some img')
    end

    it "can see user's username" do
      expect(page).to have_text(@user.name)
    end

    it 'can see the number of posts the user has written' do
      expect(page).to have_text(@user.posts.count)
    end

    it "can see a post's title" do
      @user.posts.each do |i|
        expect(i.title).to eq('title')
      end
    end

    it "can see some of the post's body" do
      @user.posts.each do |i|
        expect(page).to have_text(i.body)
      end
    end

    it 'can see a first comment on a post' do
      expect(page).to have_text(@comment.body)
    end

    it 'can see how many comments a post has' do
      expect(page).to have_text(@post.comments.count)
    end

    it 'can see how many likes a post has' do
      expect(page).to have_text(@post.likes.count)
    end

    it "When I click on a post, it redirects me to that post's show page" do
      click_link 'Post 1'
      expect(page).to have_current_path('/users/16/posts/16')
    end
  end
end

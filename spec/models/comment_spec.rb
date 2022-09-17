require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Jorge', photo: 'www.sweetimage.com', bio: 'Super smart')
  post = Post.create(user:, title: 'Title', body: 'sweet text!')

  subject { Comment.new(user:, post:, body: 'Cool comment text') }

  before { subject.save }

  it 'should increment post likes_counter' do
    subject.save
    expect(post.comments_counter).to eq(2)
  end
end

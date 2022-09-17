require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'George', photo: 'www.sweetimage.com', bio: 'Super smart')
  post = Post.create(user:, title: 'Title', body: 'sweet text!')

  subject { Like.new(user:, post:) }

  before { subject.save }

  it 'should increment post likes_counter' do
    subject.save
    expect(post.likes_counter).to eq(2)
  end
end

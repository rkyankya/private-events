require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User has name and username, neither can be blank' do
    it 'does not allow blank spaces' do
      user = User.new(name: '', username: '')
      expect(user.save).to be false
      user.name = 'foo'
      expect(user.save).to be false
      user.name = ''
      user.username = 'foobar'
      expect(user.save).to be false
    end

    it 'must have a username and name' do
      user = User.new(username: 'foo')
      expect(user.save).to be false
      user = User.new(name: 'foo')
      expect(user.save).to be false
    end

    it 'must have a unique username' do
      User.create(name: 'foo', username: 'foobar')
      user = User.new(name: 'fo', username: 'foobar')
      expect(user.save).to be false
    end
  end
end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'foobar', username: 'foo')
    @other_user = User.new(name: 'foobar', username: 'foo')
  end

  test 'First user should be valid, second should be invalid' do
    assert @user.valid?
    @user.save
    assert_not @other_user.valid?
  end
end

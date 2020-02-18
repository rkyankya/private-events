require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test 'Login with invalid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { username: '' } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get login_path
    assert flash.empty?
  end

  test 'Login with valid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { username: @user.username } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
  end
end

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test 'should get redirected to login_path' do
    get new_user_path
    assert_redirected_to login_path
    get user_url(@user)
    assert_redirected_to login_path
  end

  test 'should get users, and new users url' do
    log_in_as(@user)
    get user_path(@user)
    assert_template 'users/show'
    get new_user_path
    assert_template 'users/new'
  end
end

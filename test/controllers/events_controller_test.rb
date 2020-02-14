require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @event = events(:one)
  end

  test 'should get redirected to login path' do
    get new_event_url
    assert_redirected_to login_path
    get events_url
    assert_redirected_to login_path
    get user_event_path(@event.creator, @event)
    assert_redirected_to login_path
  end

  test 'should get the right path' do
    log_in_as @user
    get new_event_path
    assert_response :success
    get user_event_path(@event.creator, @event)
    assert_response :success
    get events_path
    assert_response :success
  end
end

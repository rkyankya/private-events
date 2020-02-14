require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'foobar', username: 'event_test')
    @event = @user.events.new
  end

  test 'All fields should be filled' do
    assert_not @event.valid?
    @event.description = 'This is a test'
    assert_not @event.valid?
    @event.date = Time.now
    assert_not @event.valid?
    @event.location = 'My house'
    assert @event.valid?
  end
end

require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'foobar', username: 'invitation_test')
    @event = @user.events.new(description: 'Party', date: Time.now,
                              location: 'My house')
    @event.save
    @invitation = @user.invitations.new
  end

  test "Should be false by default, should not save if I don't have and event id" do
    assert_not @invitation.valid?
    @invitation.attended_event = @event
    assert @invitation.valid?
    @invitation.save
    assert @invitation.accepted == false
  end
end

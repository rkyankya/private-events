module InvitationsHelper
  def allowed?(user_id)
    inv = Invitation.where(attended_event_id: params[:id])
    inv = inv.find_by(attendee_id: user_id)
    return if inv.nil?

    inv.accepted == false
  end

  def any_attendee?
    inv = Invitation.where(attended_event_id: params[:id])
    !inv.where(accepted: true).first.nil?
  end

  def going?(user_id)
    inv = Invitation.where(attended_event_id: params[:id])
    inv.find_by(attendee_id: user_id).first.accepted == true
  end

  def invited?(user_id)
    inv = Invitation.where(attended_event_id: params[:id])
    !inv.find_by(attendee_id: user_id).nil?
  end

  def invited_to
    inv = Invitation.where(attendee_id: params[:id])
    inv = inv.where(accepted: false)
    return false if inv.first.nil?

    inv.map(&:attended_event)
  end
end

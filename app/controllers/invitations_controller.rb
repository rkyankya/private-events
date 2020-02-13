# frozen_string_literal: true

class InvitationsController < ApplicationController
  def new; end

  def create
    re_path = request.original_fullpath
    check_inv = Invitation.where(attended_event_id: params[:event_id])
    if params[:invitation]
      params[:invitation].each do |invit|
        check = check_inv.find_by(attendee_id: invit[0].to_i)
        if invit[1] == '1'
          unless check
            Invitation.create(attended_event_id: params[:event_id],
                              attendee_id: invit[0].to_i)
          end
        else
          check&.delete
        end
      end
      flash[:success] = 'Invitations sent!'
    else
      check = check_inv.find_by(attendee_id: current_user.id)
      check.accepted = !check.accepted
      check.save
    end
    redirect_to re_path
  end
end

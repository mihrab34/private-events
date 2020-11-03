module InvitationsHelper
  def event_attendance_button(event)
    if current_user.attending?(event)
      link_to 'Leave', unattend_event_path(event.id), method: :delete, class: 'btn btn-info'
    else
      link_to 'Join', attend_event_path(event.id), method: :post, class: 'btn btn-info'
    end
  end
end

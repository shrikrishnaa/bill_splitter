module EventsHelper
  def get_user_event_paid_amount(user,event)
    UserEventDetail.where(user_id:user&.id, event_id:event&.id).first&.paid_amount
  end
end

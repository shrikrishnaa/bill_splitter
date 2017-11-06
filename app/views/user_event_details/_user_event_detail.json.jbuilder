json.extract! user_event_detail, :id, :paid_amount, :user_id, :event_id, :created_at, :updated_at
json.url user_event_detail_url(user_event_detail, format: :json)

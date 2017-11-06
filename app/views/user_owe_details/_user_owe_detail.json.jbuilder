json.extract! user_owe_detail, :id, :owe_amount, :paid_amount, :status, :user_id, :created_at, :updated_at
json.url user_owe_detail_url(user_owe_detail, format: :json)

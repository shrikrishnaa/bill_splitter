module UpdateUserOweDetail
  extend ActiveSupport::Concern
  included do
    before_save :update_owe_detail
  end

  # This method is using to update the user owe details
  def update_owe_detail
    each_need_to_pay = self.amount/user_event_details.size
    # sorting user event details based on paid amount for ordering
    sorted_user_event_detail = user_event_details.sort_by{|user_event_detail| user_event_detail.paid_amount}
    sorted_user_event_detail.each do |owe_amount_user|
      owe_amount = 0.0
      collect_amount = 0.0
      owe_amount = each_need_to_pay - owe_amount_user.paid_amount if each_need_to_pay >= owe_amount_user.paid_amount
      if !owe_amount.eql?(0.0)
        sorted_user_event_detail.each do |collect_amount_user|
          collect_amount = collect_amount_user.paid_amount - each_need_to_pay if each_need_to_pay < collect_amount_user.paid_amount
          if !collect_amount.eql?(0.0)
            collect_amount = owe_amount if collect_amount > owe_amount
            #  checking collect amount user need to pay any owe to owe user
            check_collect_user_owe = UserOweDetail.where(user_id:owe_amount_user.user_id,owe_user_id:collect_amount_user.user_id).first
            if check_collect_user_owe.present?
              # if collect amount user need to pay any owe to owe user then we are detecting his current ows from previous owe
              if check_collect_user_owe.owe_amount <= collect_amount
                collect_amount -= check_collect_user_owe.owe_amount
                check_collect_user_owe.owe_amount = 0.0
                check_collect_user_owe.save
                user_detail_for_update = UserOweDetail.find_or_initialize_by(user_id: collect_amount_user.user_id,owe_user_id: owe_amount_user.user_id)
                user_detail_for_update.owe_amount = user_detail_for_update.owe_amount.to_f + collect_amount
                user_detail_for_update.save
              else
                check_collect_user_owe.owe_amount = check_collect_user_owe.owe_amount - collect_amount
                check_collect_user_owe.save
              end
            else
              # if collect user not having any owe from owe user then we are creating/updating owe detail
              user_detail_for_update = UserOweDetail.find_or_initialize_by(user_id: collect_amount_user.user_id,owe_user_id: owe_amount_user.user_id)
              user_detail_for_update.owe_amount = user_detail_for_update.owe_amount.to_f + collect_amount
              user_detail_for_update.save
            end
          end
        end
      end
    end
  end

end

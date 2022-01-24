class VisitReminderJob < ActiveJob::Base
  queue_as :default

  def perform(visit)
    client_id = visit.client_id
    user_id = visit.user_id

    ClientReminderMailer.remind_mail(visit).deliver_later(wait_until: visit.remind_at)
    UserReminderMailer.remind_mail_users(visit).deliver_later(wait_until: visit.remind_at)
  end
end

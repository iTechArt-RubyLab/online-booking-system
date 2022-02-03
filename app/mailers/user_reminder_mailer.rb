class UserReminderMailer < ApplicationMailer
  def remind_mail_users(visit)
    @visit = visit
    mail(to: @visit.user.email,
         subject: "Your appointment in #{@visit.salon.name}")
  end
end

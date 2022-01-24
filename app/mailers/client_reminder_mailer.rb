class ClientReminderMailer < ApplicationMailer
  def remind_mail(visit)
    @visit = visit
    mail(to: @visit.client.email,
         subject: "Your visit in #{@visit.salon.name}")
  end
end

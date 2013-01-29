class AnswerMailer < ActionMailer::Base
  default from: "info@starostiprijaznomesto.si"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.answer_mailer.send_answer_form.subject
  #
  def send_answer_form(user, post, text)
    @user = user
    @post = post
    @text = text
    mail to: user.email   , subject: "Prosimo za odgovor"
  end
end

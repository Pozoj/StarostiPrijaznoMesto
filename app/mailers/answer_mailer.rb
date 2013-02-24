class AnswerMailer < ActionMailer::Base
  default from: "Starosti Prijazno <info@starostiprijazno.si>", :bcc => "Islam Music <islam.music@gmail.com>"

  def send_answer_form(user, post, text)
    @user = user
    @post = post
    @text = text
    mail to: user.email, subject: "Prosimo za odgovor"
  end
end

require "spec_helper"

describe AnswerMailer do
  describe "send_answer_form" do
    let(:mail) { AnswerMailer.send_answer_form }

    it "renders the headers" do
      mail.subject.should eq("Send answer form")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end

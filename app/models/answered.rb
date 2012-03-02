class Answered < AddressedPost
  default_scope where(:answers_answer_status => "answered")
end
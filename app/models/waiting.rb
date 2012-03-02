class Waiting < AddressedPost
  default_scope where(:answers_answer_status => "waiting")
end
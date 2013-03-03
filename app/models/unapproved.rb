class Unapproved < AddressedPost
  default_scope where(:answers_answer_status => "misplaced")
end
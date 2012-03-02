class Institutionalized < AddressedPost
  default_scope where(:answers_answer_status => "institutionalized")
end
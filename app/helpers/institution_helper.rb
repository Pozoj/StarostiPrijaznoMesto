module InstitutionHelper
  
  def work_time_from_to(from, to)
    if from.present? and to.present?
      "#{from} - #{to}"
    else
      "Ne obratuje"
    end
  end
end
module ApplicationHelper
  def age(dob_string)
    dob = Date.parse(dob_string)
    Date.today.year - dob.year - (dob.change(:year => Date.today.year) > Date.today ? 1 : 0)
  end
end

class Penalty < ApplicationRecord
  # Direct associations

  has_many   :deductions,
             :dependent => :destroy

  # Indirect associations

  # Validations

end

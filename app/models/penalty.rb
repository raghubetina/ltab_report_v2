class Penalty < ApplicationRecord
  # Direct associations

  has_many   :deductions,
             :dependent => :destroy

  # Indirect associations

  has_many   :poems,
             :through => :deductions,
             :source => :poem

  # Validations

end

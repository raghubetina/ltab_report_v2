class Deduction < ApplicationRecord
  # Direct associations

  belongs_to :penalty

  belongs_to :poem

  # Indirect associations

  # Validations

end

class Enrollment < ApplicationRecord
  # Direct associations

  belongs_to :participation

  belongs_to :poet

  # Indirect associations

  # Validations

end

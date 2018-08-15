class Availability < ApplicationRecord
  # Direct associations

  belongs_to :participation

  belongs_to :bout

  # Indirect associations

  # Validations

end

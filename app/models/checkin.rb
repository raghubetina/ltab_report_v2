class Checkin < ApplicationRecord
  # Direct associations

  belongs_to :poet

  belongs_to :bout

  # Indirect associations

  # Validations

end

class Coaching < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :team

  # Indirect associations

  # Validations

end

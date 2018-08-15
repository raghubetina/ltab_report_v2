class Participation < ApplicationRecord
  # Direct associations

  belongs_to :competition

  belongs_to :team

  # Indirect associations

  # Validations

end

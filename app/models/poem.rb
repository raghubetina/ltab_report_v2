class Poem < ApplicationRecord
  # Direct associations

  belongs_to :round

  belongs_to :poet

  # Indirect associations

  # Validations

end

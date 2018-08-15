class Bout < ApplicationRecord
  # Direct associations

  has_many   :rounds,
             :dependent => :destroy

  # Indirect associations

  # Validations

end

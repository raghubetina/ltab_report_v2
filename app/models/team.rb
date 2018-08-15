class Team < ApplicationRecord
  # Direct associations

  has_many   :poets,
             :dependent => :destroy

  # Indirect associations

  # Validations

end

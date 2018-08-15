class Competition < ApplicationRecord
  # Direct associations

  has_many   :bouts,
             :dependent => :destroy

  # Indirect associations

  # Validations

end

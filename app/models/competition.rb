class Competition < ApplicationRecord
  # Direct associations

  has_many   :participations,
             :dependent => :destroy

  has_many   :bouts,
             :dependent => :destroy

  # Indirect associations

  # Validations

end

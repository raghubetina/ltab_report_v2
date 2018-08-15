class Bout < ApplicationRecord
  # Direct associations

  belongs_to :competition

  has_many   :checkins,
             :dependent => :destroy

  has_many   :availabilities,
             :dependent => :destroy

  has_many   :rounds,
             :dependent => :destroy

  # Indirect associations

  # Validations

end

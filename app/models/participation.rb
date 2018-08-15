class Participation < ApplicationRecord
  # Direct associations

  has_many   :availabilities,
             :dependent => :destroy

  has_many   :enrollments,
             :dependent => :destroy

  belongs_to :competition

  belongs_to :team

  # Indirect associations

  # Validations

end

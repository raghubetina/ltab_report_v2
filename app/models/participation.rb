class Participation < ApplicationRecord
  # Direct associations

  has_many   :availabilities,
             :dependent => :destroy

  has_many   :enrollments,
             :dependent => :destroy

  belongs_to :competition

  belongs_to :team

  # Indirect associations

  has_many   :poets,
             :through => :enrollments,
             :source => :poet

  # Validations

end

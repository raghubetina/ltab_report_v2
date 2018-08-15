class Poet < ApplicationRecord
  # Direct associations

  has_many   :checkins,
             :dependent => :destroy

  has_many   :poems,
             :dependent => :destroy

  has_many   :enrollments,
             :dependent => :destroy

  belongs_to :team

  # Indirect associations

  has_many   :participations,
             :through => :enrollments,
             :source => :participation

  # Validations

end

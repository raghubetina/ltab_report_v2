class Team < ApplicationRecord
  # Direct associations

  has_many   :coachings,
             :dependent => :destroy

  has_many   :participations,
             :dependent => :destroy

  has_many   :poets,
             :dependent => :destroy

  # Indirect associations

  has_many   :coaches,
             :through => :coachings,
             :source => :user

  # Validations

end

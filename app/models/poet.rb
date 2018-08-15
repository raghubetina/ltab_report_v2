class Poet < ApplicationRecord
  # Direct associations

  has_many   :poems,
             :dependent => :destroy

  has_many   :enrollments,
             :dependent => :destroy

  belongs_to :team

  # Indirect associations

  # Validations

end

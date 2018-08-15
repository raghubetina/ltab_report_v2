class Round < ApplicationRecord
  # Direct associations

  has_many   :poems,
             :dependent => :destroy

  belongs_to :bout

  # Indirect associations

  # Validations

end

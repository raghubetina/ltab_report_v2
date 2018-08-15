class Poem < ApplicationRecord
  # Direct associations

  has_many   :scores,
             :dependent => :destroy

  has_many   :deductions,
             :dependent => :destroy

  belongs_to :round

  belongs_to :poet

  # Indirect associations

  # Validations

end

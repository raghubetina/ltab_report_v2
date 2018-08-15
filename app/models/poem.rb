class Poem < ApplicationRecord
  # Direct associations

  has_many   :deductions,
             :dependent => :destroy

  belongs_to :round

  belongs_to :poet

  # Indirect associations

  # Validations

end

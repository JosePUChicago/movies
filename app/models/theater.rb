class Theater < ApplicationRecord
  # Direct associations

  has_many   :showtimes,
             :dependent => :destroy

  # Indirect associations

  # Validations

end

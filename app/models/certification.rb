class Certification < ApplicationRecord
  belongs_to :album

  validates  :certifying_body,
             :presence => true

  validatesl :certification_level,
             :presence => true
end

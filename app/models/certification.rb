class Certification < ApplicationRecord
  belongs_to :album

  validates  :certifying_body,
             :presence => true

  validates  :certification_level,
             :presence => true
end

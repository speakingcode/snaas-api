class Certification < ApplicationRecord
  has_and_belongs_to_many :albums

  validates  :certifying_body,
             :presence => true

  validates  :certification_level,
             :presence => true
end

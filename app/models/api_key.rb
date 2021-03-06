class ApiKey < ApplicationRecord
  belongs_to :user

  before_create :set_api_key

  def set_api_key
    self.api_key = generate_api_key
  end

  # Generate a unique API key
  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless ApiKey.exists?(api_key: token)
    end
  end
end

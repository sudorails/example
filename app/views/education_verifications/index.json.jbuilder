json.array!(@education_verifications) do |education_verification|
  json.extract! education_verification, :id, :stream, :month, :year, :customer_id, :status
  json.url education_verification_url(education_verification, format: :json)
end

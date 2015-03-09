json.array!(@address_verifications) do |address_verification|
  json.extract! address_verification, :id, :father_name, :dob, :location, :address_one, :address_two, :address_third, :customer_id, :status
  json.url address_verification_url(address_verification, format: :json)
end

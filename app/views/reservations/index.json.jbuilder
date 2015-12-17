json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :user, :clothe, :returnDay, :sendDay, :sendAdress
  json.url reservation_url(reservation, format: :json)
end

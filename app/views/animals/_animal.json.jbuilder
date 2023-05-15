json.extract! animal, :id, :petname, :ppname, :species, :food, :notes, :vaccineapplied, :nextvaccine, :user_id, :venue_id, :created_at, :updated_at
json.url animal_url(animal, format: :json)

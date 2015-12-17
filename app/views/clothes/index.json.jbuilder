json.array!(@clothes) do |clothe|
  json.extract! clothe, :id, :name, :sex, :size, :color, :category1, :category2, :state, :value, :note
  json.url clothe_url(clothe, format: :json)
end

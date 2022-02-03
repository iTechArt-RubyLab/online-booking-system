class CategorySerializer
  include JSONAPI::Serializer
  attributes :name, :image_url
end

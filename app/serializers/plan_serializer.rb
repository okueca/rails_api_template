class PlanSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :price, :ocurrency, :about
end

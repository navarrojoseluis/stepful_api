module Types
  class SlotType < Types::BaseObject
    field :id, ID, null: false
    field :start_time, GraphQL::Types::ISO8601DateTime, null: false
    field :end_time, GraphQL::Types::ISO8601DateTime, null: false
    field :coach, Types::CoachType, null: false
    field :student, Types::StudentType, null: true
    field :rate, Integer, null: true
    field :note, String, null: true
  end
end

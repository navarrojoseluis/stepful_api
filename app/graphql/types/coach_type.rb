module Types
  class CoachType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :schedule, [Types::SlotType], null: false

    def schedule
      object.slots
    end
  end
end

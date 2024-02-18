module Types
  class StudentType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :schedule, [Types::SlotType], null: false
    field :available_times, [Types::SlotType], null: false

    def schedule
      object.slots
    end

    def available_times
      Slot.available
    end
  end
end

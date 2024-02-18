module Mutations
  class CreateSlotMutation < BaseMutation
    field :slot, Types::SlotType, null: true
    field :error, String, null: true

    argument :coach_id, ID, required: true
    argument :start_time, GraphQL::Types::ISO8601DateTime, required: true

    def resolve(coach_id:, start_time:)
      service = SlotManagement::SlotService.call
      slot = service.create_slot(coach_id, start_time)

      {
        slot:,
        error: nil
      }
    rescue StandardError => e
      {
        slot: nil,
        error: e.message
      }
    end
  end
end

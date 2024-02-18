module Mutations
  class UpdateSlotMutation < BaseMutation
    field :slot, Types::SlotType, null: true
    field :error, String, null: true

    argument :id, ID, required: true
    argument :student_id, ID, required: false
    argument :rate, Integer, required: false
    argument :note, String, required: false

    def resolve(id:, student_id: nil, rate: nil, note: nil)
      service = SlotManagement::SlotService.call
      slot = service.update_slot(id, student_id, rate, note)

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

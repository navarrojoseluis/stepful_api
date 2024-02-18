# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_slot, mutation: Mutations::CreateSlotMutation
    field :update_slot, mutation: Mutations::UpdateSlotMutation
  end
end

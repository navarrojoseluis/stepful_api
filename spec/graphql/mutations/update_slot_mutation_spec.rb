require 'rails_helper'

RSpec.describe Mutations::UpdateSlotMutation do
  let!(:mutation) do
    <<-GRAPHQL
      mutation UpdateSlot($input: UpdateSlotMutationInput!) {
        updateSlot(input: $input) {
          slot {
            id
          }
          error
        }
      }
    GRAPHQL
  end

  context 'if slot exists' do
    let!(:coach) { create(:user) }
    let!(:slot) { create(:slot, coach_id: coach.id) }
    let!(:student) { create(:user, :student) }

    subject(:result) do
      StepfulApiSchema.execute(
        mutation,
        variables:
        {
          "input": {
            "id": slot.id,
            "studentId": student.id
          }
        }
      )
    end

    it 'updates the slot' do
      expect(slot.student_id).to eq(nil)
      subject
      slot.reload
      expect(slot.student_id).to eq(student.id)
    end
  end
end

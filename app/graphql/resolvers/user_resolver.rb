module Resolvers
  class UserResolver < BaseResolver
    type Types::UserType, null: true
    argument :id, ID, required: true

    def resolve(id:)
      User.find(id)
    rescue ActiveRecord::RecordNotFound
      raise GraphQL::ExecutionError, 'User not found'
    end
  end
end

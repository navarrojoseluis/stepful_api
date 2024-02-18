# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :user, resolver: Resolvers::UserResolver
  end
end

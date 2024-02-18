require 'graphql/rake_task'

GraphQL::RakeTask.new(
  schema_name: 'StepfulApiSchema',
  directory: Rails.root.join('app/graphql')
)

namespace :graphql do
  task dump: :environment do
    Rake::Task['graphql:schema:dump'].invoke
  end
end

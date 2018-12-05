Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'
  # Add root-level fields here.
  # They will be entry points for queries on your schema.
  field :allBlogs do
    type types[Types::BlogType]

    resolve -> (obj, args, ctx) {
      Blog.all
    }
  end

  field :blog do
    type Types::BlogType

    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Blog.find(args[:id]) }
  end
end
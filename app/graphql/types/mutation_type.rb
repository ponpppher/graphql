Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createBlog, Types::BlogType do
    argument :title, !types.String
    argument :content, !types.String

    resolve -> (obj, args, ctx) {
      Blog.create(
        title: args[:title],
        content: args[:content]
      )
    }
  end
end
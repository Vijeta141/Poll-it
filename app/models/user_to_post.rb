class UserToPost

  include Neo4j::ActiveRel
  from_class :User
  to_class :Post

  property :opinion,type: String

end

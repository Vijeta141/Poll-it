class User
  include Neo4j::ActiveNode
  property :name,type: String
  property :age,type: Integer
  property :caste,type: String
  property :education,type: String
  property :religion,type: String
  property :eco_strata,type: String

  self.include_root_in_json = false

  has_many :out, :posts,rel_class: :UserToPost


end

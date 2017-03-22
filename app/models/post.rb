class Post
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  property :media_type,type: String
  property :title,type: String
  property :description,type: String
  property :support_no,type: Integer,default: 0
  property :oppose_no,type: Integer,default: 0
  property :link,type: String

  self.include_root_in_json = false

  has_one :out, :candidate,type: :RelatedTo
  has_many :in, :users,rel_class: :UserToPost
  has_many :out, :agendas,type: :PostAgenda

end

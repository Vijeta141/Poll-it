class Agenda
  include Neo4j::ActiveNode

  property :name,type: String
  property :support_no,type: Integer,default: 0
  property :oppose_no,type: Integer,default: 0
  self.include_root_in_json = false

  has_many :in, :posts, type: :PostAgenda

end

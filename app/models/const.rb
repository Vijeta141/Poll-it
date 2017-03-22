class Const
  include Neo4j::ActiveNode

  property :name,type: String
  property :location,type: String
  self.include_root_in_json = false

  # has_many :out, :political_parties,type: :POLITICALPARTY
  has_many :out, :candidates,type: :CANDIDATE


end

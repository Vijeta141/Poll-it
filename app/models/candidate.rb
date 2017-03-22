class Candidate
  include Neo4j::ActiveNode

  property :photo,type: String
  property :name,type: String
  self.include_root_in_json = false

  has_one :in, :political_party,type: :PARTYCANDIDATE
  has_one :in, :const,type: :CANDIDATE
  has_many :in, :posts,type: :RelatedTo

end

class PoliticalParty
  include Neo4j::ActiveNode

  property :name,type: String
  property :logo,type: String
  property :agenda,type: String
  self.include_root_in_json = false

  # has_many :in, :consts,type: :POLITICALPARTY
  has_many :out, :candidates,type: :PARTYCANDIDATE
  # has_many :in, :posts, type: :RelatedTo
end

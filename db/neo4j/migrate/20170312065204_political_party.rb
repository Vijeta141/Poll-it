class PoliticalParty < Neo4j::Migrations::Base
  def up
    add_constraint :PoliticalParty, :uuid
  end

  def down
    drop_constraint :PoliticalParty, :uuid
  end
end

class Candidate < Neo4j::Migrations::Base
  def up
    add_constraint :Candidate, :uuid
  end

  def down
    drop_constraint :Candidate, :uuid
  end
end

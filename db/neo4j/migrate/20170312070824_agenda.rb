class Agenda < Neo4j::Migrations::Base
  def up
    add_constraint :Agenda, :uuid
  end

  def down
    drop_constraint :Agenda, :uuid
  end
end

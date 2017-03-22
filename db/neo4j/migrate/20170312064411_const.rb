class Const < Neo4j::Migrations::Base
  def up
    add_constraint :Const, :uuid
  end

  def down
    drop_constraint :Const, :uuid
  end
end

class UserToPost < Neo4j::Migrations::Base
  def up
    add_constraint :UserToPost, :uuid
  end

  def down
    drop_constraint :UserToPost, :uuid
  end
end

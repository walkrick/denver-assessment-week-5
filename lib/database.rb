class Database
  def initialize
    @entities = []
    @id_counter = 0
  end

  def insert(entity)
    entity = entity.dup
    entity[:id] = next_id

    @entities.push(entity)

    entity.dup
  end

  def all
    @entities.dup
  end

  class EntityNotFoundError < RuntimeError ; end

  private

  def next_id
    @id_counter += 1
    @id_counter
  end

  def offset_id(id)
    id - 1
  end

end

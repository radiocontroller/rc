class ArticleType
  attr_reader :id, :name

  ID_TYPES = {
    0 => '战斗机',
    1 => '精选导读'
  }

  TYPES_ID = ID_TYPES.invert

  def initialize(id, name)
    @id = id
    @name = name
  end

  def self.find(id)
    id = id.to_i
    if ID_TYPES[id].present?
      self.new(id, ID_TYPES[id])
    else
      nil
    end
  end

  def self.find_by_name(name)
    if TYPES_ID[name].present?
      self.new(TYPES_ID[name], name)
    else
      nil
    end
  end

end

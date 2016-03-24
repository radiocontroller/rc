class VideoType
  attr_reader :id, :name

  ID_TYPES = {
    0 => '固定翼',
    1 => '穿越机',
    2 => '滑翔机',
    3 => '直升机',
    4 => '穿越机'
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
    name = name.to_s
    if TYPES_ID[name].present?
      self.new(TYPES_ID[name], name)
    else
      nil
    end
  end


end

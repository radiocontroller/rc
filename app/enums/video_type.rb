class VideoType

  ID_TYPES = {
    0 => '固定翼',
    1 => '穿越机',
    2 => '滑翔机',
    3 => '直升机',
  }

  ID_ENGLISH_TYPES = {
    0 => 'fixed_wing',
    1 => 'fpv',
    2 => 'glider',
    3 => 'helicopter'
  }

  TYPES_ID = ID_TYPES.invert

  def self.find_id_by(type)
    TYPES_ID[type]
  end

  def self.find_type_by(id)
    id = id.to_i
    ID_TYPES[id]
  end

  def self.find_english_type_by(id)
    id = id.to_i
    ID_ENGLISH_TYPES[id]
  end

end

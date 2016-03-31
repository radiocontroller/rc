class PictureType

  ID_TYPES = {
    0 => 'fixed_wing',
    1 => 'glider',
    2 => 'helicopter',
    3 => 'fpv'
  }

  TYPES_ID = ID_TYPES.invert

  def self.find_id_by(type)
    TYPES_ID[type]
  end

  def self.find_type_by(id)
    id = id.to_i
    ID_TYPES[id]
  end

end

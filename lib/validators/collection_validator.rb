class CollectionValidator < ActiveModel::Validator

  def validate(record)
    if record.startdate > record.enddate
      record.errors[:enddate] << 'must be after start date'
    end
  end
    
end
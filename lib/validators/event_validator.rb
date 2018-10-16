class EventValidator < ActiveModel::Validator

  def validate(record)
    if record.start <= Time.now + 1.hour
      record.errors[:start] << 'must be in the future'
    end
    
    if record.start > record.endtime
      record.errors[:endtime] << 'must be after event start date/time'
    end
    
    if compare_at_least_one(record)
      record.errors[:location] << '- Specify a location or an address'
    end
    
    if compare_not_both(record)
      record.errors[:location] << '- Specify a location or an address, not both. If using a location, please make sure location buildling, address, city, state, and zip are not blank.'
    end
  end
  
  def compare_at_least_one(record)
    record.location_id.blank? && record.location_building.blank? ||
    record.location_id.blank? && record.location_address.blank? ||
    record.location_id.blank? && record.location_city.blank? ||
    record.location_id.blank? && record.location_state.blank? ||
    record.location_id.blank? && record.location_zip.blank?
  end
  
  def check_all_noncampus_location(record)
    record.location_building.present? &&
    record.location_address.present? &&
    record.location_city.present? &&
    record.location_state.present? &&
    record.location_zip.present?
  end
  
  def compare_not_both(record)
    record.location_id.present? && check_all_noncampus_location(record)
  end
  
end
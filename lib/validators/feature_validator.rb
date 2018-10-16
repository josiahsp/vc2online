class FeatureValidator < ActiveModel::Validator

  def validate(record)
    
    if record.start > record.endtime
      record.errors[:endtime] << 'must be after activation date/time'
    end
    
    if compare_at_least_one(record)
      record.errors[:event] << '- Specify an event or page to feature'
    end
    
    if compare_not_both(record)
      record.errors[:event] << '- Specify only one event or page, not both. Each desired featured item must be set separately.'
    end
    
  end
  
  def compare_at_least_one(record)
    record.event_id.blank? && record.page_id.blank?
  end
 
  def compare_not_both(record)
    record.event_id.present? && record.page_id.present?
  end
  
end
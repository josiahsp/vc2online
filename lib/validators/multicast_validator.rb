class MulticastValidator < ActiveModel::Validator

  def validate(record)
    if record.audio.blank? && record.video.present?
      record.errors[] << 'Multicast must have audio or video file.'
    end
  
    if record.collection_id.present?
      startdate = record.collection.startdate
      enddate = record.collection.enddate
      
      if record.pubdate < startdate
        record.errors[:pubdate] << 'must be after Series Start Date'
      end
      
      if record.pubdate > (enddate + 23.hours + 59.minutes)
        record.errors[:pubdate] << 'must be before Series End Date'
      end
    end
      
    if record.duration < 1
      record.errors[:duration] << 'can\'t be blank'
    end
  end
  
end
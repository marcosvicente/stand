class ImportsWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'import'

  def perform(import_id)
    
    # binding.pry
    
    @import = Import.find(import_id)

    unless @import.nil?
      # change status to processing
      @import.status = :processing
      @import.save

      read_file(@import.file.path)

      # finaly status with done
      @import.status = :done
      @import.save
    else
      raise "Not found Import File"
    end
  end

  def read_file(file)
    data = File.read(file)

    row = data.split("\n")
    save_total_row(row.size)

    row.each_with_index do |value, index|
      date = value.delete("^0-9")

      if date.blank? and value.include? "lightning"
        date = 5
      end 

      save_row(value, date)
      save_current_row(index)
    end
    
  end

  def save_row(name, date)
    event = Event.find_or_create_by(
      name: name,
      date: date
    )
    unless event.save
      raise "Event not be save error: #{ event.errors.full_messages}"
    end
  end

  def save_total_row(total_row)
    @import.total_row = total_row
    @import.save(validate: false)
  end

  def save_current_row(row)
    @import.current_row = row
    @import.save(validate: false)
  end
end

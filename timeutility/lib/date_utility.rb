class DateUtility

  DATE_FORMAT_REGEX = /^([1-9]|[1][0-2]):([0-5][0-9]) (AM|PM)$/
  MINUTES_IN_HOUR = 60
  MAX_MINUTES = 60
  MAX_HOURS = 12
  MERIDIAN_SWAP = { "AM" => "PM", "PM" => "AM" }

  ##
  # Adds a number of minutes to a date string in the format of '9:23 AM'
  # and returns an updated date string in that same format.
  #
  # date_str - A date string in the format of '9:23 AM'.
  # minutes_to_add - an integer representing minutes to add to the date
  #
  # An ArgumentError is raised if both the date string and the minutes
  # parameters are not passed or if the date string is not in the proper
  # format or if the minutes to add is not an Integer.
  #
  def self.add_minutes(date_str, minutes_to_add)
    validate_args(date_str, minutes_to_add)
    hours, minutes, meridian = get_hours_minutes_and_meridian(date_str)
    add_hours, add_minutes = get_hours_and_minutes_to_add(minutes_to_add)
    new_hours, new_minutes =
        get_new_hours_and_minutes(hours, add_hours, minutes, add_minutes)
    new_meridian = get_new_meridian(meridian, hours, new_hours)
    new_hours -= MAX_HOURS if new_hours > MAX_HOURS
    "#{"%2d" % new_hours}:#{"%02d" % new_minutes} #{new_meridian}".strip
  end

  ### PRIVATE ###

  def self.validate_args(date_str, minutes_to_add)
    unless date_str && minutes_to_add
      raise ArgumentError, "add_minutes takes 2 arguments"
    end
    unless DATE_FORMAT_REGEX.match(date_str)
      msg = "date_str argument must be formatted as [H]H:MM {AM|PM}"
      raise ArgumentError, msg
    end
    unless minutes_to_add.is_a?(Integer)
      raise ArgumentError, "minutes_to_add argument must be an integer"
    end
  end
  private_class_method :validate_args

  def self.get_hours_minutes_and_meridian(date_str)
    hours, minutes, meridian = date_str.scan(DATE_FORMAT_REGEX).flatten
    [hours.to_i, minutes.to_i, meridian]
  end
  private_class_method :get_hours_minutes_and_meridian

  def self.get_hours_and_minutes_to_add(minutes_to_add)
    multiplier = minutes_to_add / minutes_to_add.abs
    add_minutes = minutes_to_add.abs % MINUTES_IN_HOUR * multiplier
    add_hours = minutes_to_add.abs / MINUTES_IN_HOUR * multiplier
    [add_hours, add_minutes]
  end
  private_class_method :get_hours_and_minutes_to_add

  def self.get_new_hours_and_minutes(hours, add_hours, minutes, add_minutes)
    new_hours = hours + add_hours
    new_minutes = minutes + add_minutes
    if new_minutes < 0
      new_minutes = MAX_MINUTES + new_minutes
      new_hours -= 1
    elsif new_minutes >= MAX_MINUTES
      new_minutes = new_minutes - MAX_MINUTES
      new_hours += 1
    end
    [new_hours, new_minutes]
  end
  private_class_method :get_new_hours_and_minutes

  def self.get_new_meridian(meridian, hours, new_hours)
    return meridian if hours == new_hours
    range = new_hours > hours ? hours..new_hours : new_hours..hours
    range.include?(12) ? MERIDIAN_SWAP[meridian] : meridian
  end
  private_class_method :get_new_meridian

end
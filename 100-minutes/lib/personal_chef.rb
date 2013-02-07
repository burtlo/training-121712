class PersonalChef
  def open_door(door_name)
    if valid_doors.include? door_name
      puts "Opening #{door_name} door"
    else
      "Cannot open the #{door_name} door"
    end
  end

  def valid_doors
    [ :front, :back ]
  end
end
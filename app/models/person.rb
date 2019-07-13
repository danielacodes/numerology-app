class Person < ActiveRecord::Base

  validates_presence_of :first_name, :last_name, :birthday

  def self.get_birth_path_number(date)
    number = date[0].to_i+date[1].to_i+date[2].to_i+date[3].to_i+date[4].to_i+date[5].to_i+date[6].to_i+date[7].to_i
    number_string=number.to_s
    number = number_string[0].to_i+number_string[1].to_i

    if (number>9) then
      number_string=number.to_s
      number = number_string[0].to_i+number_string[1].to_i
    end

    return number
  end

  def self.get_message(birth_path_number)
    case birth_path_number
    when 1
      message = "Your numerology number is #{birth_path_number}. One is the leader. The number one indicates the ability to stand alone, and is a strong vibration. Ruled by the Sun."
    when 2
      message = "Your numerology number is #{birth_path_number}. This is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon."
    when 3
      message = "Your numerology number is #{birth_path_number}. Number Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three's enjoy life and have a good sense of humor. Ruled by Jupiter."
    when 4
      message = "Your numerology number is #{birth_path_number}. This is the worker. Practical, with a love of detail, Fours are trustworthy, hard-working, and helpful. Ruled by Uranus."
    when 5
      message = "Your numerology number is #{birth_path_number}. This is the freedom lover. The number five is an intellectual vibration. These are 'idea' people with a love of variety and the ability to adapt to most situations. Ruled by Mercury."
    when 6
      message = "Your numerology number is #{birth_path_number}. This is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus."
    when 7
      message = "Your numerology number is #{birth_path_number}. This is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune."
    when 8
      message = "Your numerology number is #{birth_path_number}. This is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn."
    when 9
      message = "Your numerology number is #{birth_path_number}. This is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars."
    end
  end

  def self.valid_birthdate(input)
    if input.length == 8 && input.match(/^[0-9]+[0-9]$/)
      return true
    else
      return false
    end
  end

end

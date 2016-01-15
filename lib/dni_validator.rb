class DniValidator < ActiveModel::Validator
  LETTERS = "TRWAGMYFPDXBNJZSQVHLCKE"

  def validate(record)
    if record.dni.match(/[0-9]{8}[a-z]/i)
      validate_dni(record)
    else
      record.errors[:dni] << 'must contain 8 digits plus a control letter'
    end
  end

  private
  def validate_dni(record)
    *digits, letter = record.dni.split(//)
    control_letter = LETTERS[digits.join.to_i % 23].chr
    record.errors[:dni] << 'with incorrect control letter' unless letter.upcase == control_letter
  end
end

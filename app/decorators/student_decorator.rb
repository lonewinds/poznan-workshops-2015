class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    notes = Array.new
    subject_item.subject_item_notes.each do |note|
      notes.push note.value
    end

    avg = notes.size == 0 ? sprintf('%.2f', 0) : sprintf('%.2f', notes.inject{ |sum, el| sum + el }.to_f / notes.size)
  end
end

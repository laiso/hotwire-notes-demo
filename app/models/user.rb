class User < ApplicationRecord
  kredis_hash :notes, key: 'rsc:notes_2', typed: :json

  def note(id)
    notes[id]
  end

end

class Rolodex # kind of acting like a controller

	attr_accessor :contacts, :id

	def initialize
		@contacts = []	
		@id = 1000
	end

	def add_contact(contact)
		contact.id = @id
		@contacts << contact
		@id += 1
	end
		
	def find(contact_id)
    @contacts.find { |contact| contact.id == contact_id }
  end

  def delete(contact_id)
    @contacts.delete(contact_id)
  end

	def display		
    puts @contacts
	end

end
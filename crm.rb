require_relative 'contact'
require_relative 'rolodex'

class Crm # kind of acts like view
  
   def initialize
    @rolodex = Rolodex.new
  end 

  # def self.run
  #   my_crm = new
  #   my_crm.run_main_menu
  # end

	def main_menu
    puts "[1] Add new contact"
    puts "[2] Modify existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all contacts"
    puts "[5] Display contact"
    puts "[6] Disaply an attribute"
    puts "[7] Exit"
    puts "Enter a numer:"
	end

  def run_main_menu
    while true
      main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def call_option(user_selected)
    add_new_contact if user_selected == 1
    modify_contact if user_selected == 2
    del_contact if user_selected == 3
    display_all if user_selected == 4
    display_contact if user_selected == 5
    display_attr if user_selected == 6
    exit if user_selected == 7
  end

  def add_new_contact 
    print "Enter your first name:"
    first_name = gets.chomp
    print "Enter your last name:"
    last_name = gets.chomp
    print "Enter your email address:"
    email = gets.chomp
    print "Enter additional notes:"
    notes = gets.chomp
    contact = Contact.new(first_name, last_name, email, notes)
    @rolodex.add_contact(contact)
    puts "New contact created."
    puts "ID: contact_id"
  end

  def modify_contact
    print "Enter your user ID:"
    contact_id = gets.chomp.to_i 
    contact = @rolodex.find(contact_id)
    puts contact
    # display_contact

    puts "Update contact?"
    puts "Confirm: Y/N" 
       user_confirm = gets.chomp
      
      if user_confirm == "Y"
        modify_menu
        user_selected = gets.chomp
        
        puts "Enter new value:"
        new_value = gets.chomp
        modify_option(user_selected)
        
        puts "Contact updated"
      else
        run_main_menu
      end
  
  end

  def modify_menu
    puts "[1] First name"
    puts "[2] Last name"
    puts "[3] Email"
    puts "[4] Notes"
    puts "Enter a number:"  
  end

  def modify_option(user_selected)
    contact.first_name = new_value if user_selected == 1
    contact.last_name = new_value if user_selected == 2
    contact.email = new_value if user_selected == 3
    contact.notes = new_value if user_selected == 4
  end

  def del_contact
    print "Enter your ID:"
    contact_id = gets.chomp.to_i
    contact = @rolodex.find(contact_id)
    
    puts "Delete contact?"
    puts "Confirm: Y/N" 
    user_selected = gets.chomp
      
      if user_selected == "Y"
        @rolodex.delete(contact_id)      
      else
        main_menu
      end
  
  end

  #not working
  def display_all
    @rolodex.display
  end

  def display_contact 
    print "Enter your user ID:"
    contact_id = gets.chomp.to_i
    contact = @rolodex.find(contact_id)
    puts contact 
  end

  def display_attr
    print "Enter your user ID:"
    contact_id = gets.chomp.to_i
    contact = @rolodex.find(contact_id)

    modify_menu
    user_selected = gets.chomp

    select_attr
  end 

  def select_attr
    puts contact.first_name if user_selected == 1
    puts contact.last_name if user_selected == 2
    puts contact.email if user_selected == 3
    puts contact.notes if user_selected == 4  
  end


  def exit
    puts "\e[H\e[2J" 
  end

end

my_crm = Crm.new
my_crm.run_main_menu


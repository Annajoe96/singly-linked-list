require './node.rb'
require './linked_list_helper.rb'

class LinkedList

  include Linked_List_Helper

  def initialize(value)
    @head = Node.new(value, nil)
  end
# creating a linked list 
  def add(value)
    current_node = @head
    while current_node.next != nil
      current_node = current_node.next
    end
    current_node.next = Node.new(value, nil)
  end
 
 #deleting a value within the linked list 
  def delete(value)
    current_node = @head

    if current_node.value == value
      @head = current_node.next
    else

      previous_node = current_node
      current_node = current_node.next

      loop do 
        break if current_node.value == value
        previous_node = current_node
        current_node = current_node.next
      end

      previous_node.next = current_node.next
    end
  end

  
#returning an array of the list of numbers in the linked list 

  def return_list
    entries = []
    current_node = @head

    while current_node.next != nil
      entries << current_node.value
      current_node = current_node.next
    end
      entries << current_node.value
  end

end

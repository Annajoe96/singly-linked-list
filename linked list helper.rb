require './linkedlist.rb'

module Linked_List_Helper

#deleting the repeating values in the linked list 
  def delete_duplicates
    uniq_array = [@head.value]
    previous_node = @head
    current_node = @head.next

    while current_node != nil
      if uniq_array.include?(current_node.value)
        previous_node.next = current_node.next
      else
        uniq_array << current_node.value
        previous_node = current_node
      end
      
      current_node = previous_node.next
      
    end
  end

#finding length of linked list 
  def find_length
    current_node = @head
    length = 0
    while current_node != nil
      length += 1
      current_node = current_node.next
    end
    length
  end
  
  #finding the middle value in the linked list 

  def find_middle_value
    current_node = @head
    half = find_length.to_f / 2
    a = 1

    if find_length.odd?
      half = half + 0.5
    end

    until a == half
      a += 1
      current_node = current_node.next
    end

    if find_length.even?
      [current_node.value, current_node.next.value]
    else
      current_node.value
    end

  end
  
  

  def delete_odds
    # delete all the odds at the start of the linked list
    # till we see the end or see the first even number
    current_node = @head
    while current_node.next != nil && current_node.value.odd?
      current_node = current_node.next
    end
    @head = current_node

    previous_node = @head
    current_node = @head.next

    while current_node != nil
      if current_node.value.odd?
        previous_node.next = current_node.next
      else
        previous_node = current_node
      end
      
      current_node = previous_node.next
    end
  end 
  
  #checking if the linked list is a palindrome
  
  def is_palindrome?
    return_list.reverse == return_list
  end
  
  #reversing the linked list 

  def reverse!
    a = return_list.reverse

    @head = Node.new(a.first, nil)
  
    a[1..-1].each do |i|
      add(i)
    end
  end

end

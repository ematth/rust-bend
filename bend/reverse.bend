##############################
### List Type Definition: ###

# type List:
#   Cons { head, ~tail }
#   Nil

##############################

# List concat:
# combines two lists (l1, l2) from left to right.
List/concat = @l1 @l2
  match l1 {
    List/Cons: (List/Cons l1.head (List/concat l1.tail l2))
    List/Nil: l2
  }

# List add_front:
# adds a non-List element e to the front of list l.
List/add_front = @l @e
  match l {
    List/Cons: (List/Cons e l)
    List/Nil: (List/Cons e List/Nil)
  }

# List append (add_back):
# adds a non-list element e to the back of list l.
List/append = @l @e
  (List/concat l (List/Cons e List/Nil))

# List reverse:
# reverses the order of elements in list l.
List/reverse/aux = @acc @l
  match l {
    List/Nil: acc
    List/Cons: (List/reverse/aux (List/Cons l.head acc) l.tail)
  }
List/reverse = @l
  (List/reverse/aux [] l)

# List length:
# returns the number of elements in list l.
List/len/aux = @acc @l
  match l {
    List/Nil: acc
    List/Cons: (List/len/aux (+ acc 1) l.tail)
  }
List/len = @l
  (List/len/aux 0 l)

# List count:
# returns the number of instances of element e in list l.
List/count/aux = @acc @l @e
  match l {
    List/Nil: acc
    List/Cons: (List/count/aux (+ acc (== l.head e )) l.tail)
  }
List/count = @l @e
  (List/count/aux 0 l e)

main = (List/len [1, 2, 3, 4, 4, 4])
#main = (List/count [1, 2, 1000] 1)
#main = (List/reverse [1, 2, 3, 4, 5])
#main = (List/append [1, 2] 3)
#main = (List/add_front [2, 3] 1)
#main = (List/concat [1, 2] [3, 4])
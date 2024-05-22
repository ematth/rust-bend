### List Type Definition: ###

# type List:
#   Cons { head, ~tail }
#   Nil

##############################

# List to list concatenation
List/concat = @l1 @l2
  match l1 {
    List/Cons: (List/Cons l1.head (List/concat l1.tail l2))
    List/Nil: l2
  }

# List add_front
List/add_front = @l @e
  match l {
    List/Cons: (List/Cons e l)
    List/Nil: (List/Cons e List/Nil)
  }

# List add_back (append)
List/add_back = @l @e
  (List/concat l (List/Cons e List/Nil))

List/append = @l @e # other acceptable function name
  (List/add_back l e)

List/reverse/aux = @acc @l
  match l {
    List/Nil: acc
    List/Cons: (List/reverse/aux (List/Cons l.head acc) l.tail)
  }

List/reverse = @l
  (List/reverse/aux [] l)

main = (List/reverse [1, 2, 3, 4, 5])
#main = (List/append [1, 2] 3)
#main = (List/add_front [2, 3] 1)
#main = (List/concat [1, 2] [3, 4])
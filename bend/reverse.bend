# def sum(list):
#   fold list:
#     case List/Cons:
#       return list.head + list.tail
#     case List/Nil:
#       return 0

def reverse(list):
  # exercise
  newlist = []
  fold list:
    case List/Cons:
      return [list.tail, list.head]
    case List/Nil:
      return []

def first(list):
  fold list:
    case List/Cons:
      return list.head
    case List/Nil:
      return []

# def second(list):
#   idx = 0
#   fold list:
#     case List/Cons and idx == 1:
#       return list.head
#     case List/Cons:
#       list = list.tail
#       idx = idx + 1
#     case List/Nil:
#       return []

###############################

type Bool:
  True
  False

def hasHead(list):
  fold list:
    case List/Cons:
      return Bool/True
    case List/Nil:
      return Bool/False

###############################

def main:
  #return hasHead([]) # Returns Bool/False
  #return first([1,2,3])
  return reverse([1,2,3])
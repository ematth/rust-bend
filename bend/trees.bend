# Tree data structure

type BiTree: 
  Node {val, ~left, ~right}
  Leaf {val}

def BiTree.sum(t):
  fold t: # recursive match against tree t
    case BiTree/Node:
      return t.val + t.left + t.right
    case BiTree/Leaf:
      return t.val

def main:
  bend val = 0:
    when val < 2:
      # 'fork' calls the bend recursively with the provided values.
      x = BiTree/Node { val:val, left:fork(val + 1), right:fork(val + 1) }
    else:
      # 'else' is the base case, when the condition fails.
      x = BiTree/Leaf
  return BiTree.sum(x)
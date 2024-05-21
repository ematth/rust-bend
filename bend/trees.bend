# Tree data structure

type Tree:
  Node { ~left, ~right }
  Leaf { val }

def sum(tree):
  fold tree:
    case Tree/Node:
      return tree.left + tree.right
    case Tree/Leaf:
      return tree.val

def main():
  tree = Tree/Node {
    left: Tree/Node { left: Tree/Leaf { val: 1 }, right: Tree/Leaf { val: 2 } },
    right: Tree/Node { left: Tree/Leaf { val: 3 }, right: Tree/Leaf { val: 4 } }
  }
  return sum(tree)
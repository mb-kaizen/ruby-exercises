class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

  # perform pre-order operation
  # for any tree do above and below:
  # for each i from 1 to the number of children do:
  #    visit i-th, if present
  #    perform in order operation
  # perform post order operation
  def depth_first_search(tree, desired_payload)
    return if tree == nil
    return tree.payload if tree.payload == desired_payload

    depth_first_search(tree.children[0], 11)
    depth_first_search(tree.children[1], 11)
  end

  def breadth_first_search(tree, desired_payload)
    queue = []
    queue << tree

    while queue.size != 0
      node = queue.shift
      p node.payload
      return node if node.payload == desired_payload
      queue << node.children[0] if node.children[0] != nil
      queue << node.children[1] if node.children[1] != nil
    end
  end

end

# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node = Tree.new(4, [])

# The "branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "trunk" of the tree
trunk_node = Tree.new(2, [seventh_node, shallow_fifth_node])

trunk_node.breadth_first_search(trunk_node, 11)
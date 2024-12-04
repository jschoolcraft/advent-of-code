class Node
  attr_reader :multi_visit
  attr_accessor :name, :neighbors

  def initialize(name)
    @name = name
    @neighbors = []
    @multi_visit = name != name.downcase
  end
end

class Graph
  attr_accessor :nodes, :node_count

  def initialize(node_list)
    @nodes = []
    @node_count = node_list.size
    node_list.each { |node| @nodes << Node.new(node) }
  end

  def add_edge(start, stop)
    from = @nodes.detect { |n| n.name == start }
    to = @nodes.detect { |n| n.name == stop }

    from.neighbors << to unless from.neighbors.include? to
    to.neighbors << from unless to.neighbors.include? from
  end

  def find_path(start, stop, visited = [], pathCount = 0)
    from = @nodes.detect { |n| n.name == start }
    to = @nodes.detect { |n| n.name == stop }

    stack = [from]
    visited = [from]

    loop do
      current_node = stack.pop
      return false if current_node.nil?
      return true if current_node == to

      stack += current_node.neighbors
      p stack.map(&:name)
    end
  end
end

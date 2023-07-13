//
//  main.swift
//  TreeStructure
//
//  Created by Ciridev on 12/07/23.
//

import Foundation

var tree : Node<String> = Node<String>("Root")

var child1 = Node<String>("Child1")
var child2 = Node<String>("Child2")
var child3 = Node<String>("Child3")

var child4 = Node<String>("Child4")

child2.AddNode(child3)
child3.AddNode(child4)

tree.AddNode(child1)
tree.AddNode(child2)

print(child2.FindNode(child1)?.GetNodeInformation() ?? "Node not found!")
print(tree)
print(tree.GetRoot()?.GetNodeInformation() ?? "Node not found!")

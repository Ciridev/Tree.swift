//
//  Tree.swift
//  TreeStructure
//
//  Created by Ciridev on 12/07/23.
//

import Foundation

class Node<T> : Identifiable {
    var data: T
    var children : [Node<T>]
    
    weak var parent : Node?
    
    var id = UUID()
    
    init(_ data: T) {
        self.data = data
        children = []
        parent = nil
    }
    
    func AddNode(_ node: Node<T>) -> Void {
        node.parent = self
        children.append(node)
    }
    
    func RemoveNode(_ node: Node<T>) -> Void {
        node.parent?.children.removeAll(where: {$0 as! AnyHashable == node as! AnyHashable})
        node.parent = nil
    }
    
    func GetRoot() -> Node<T>? {
        var root: Node<T>? = self.parent
        while root?.parent != nil {
            root = root?.parent
        }
        
        return root
    }
    
    func FindNode(_ node: Node<T>) -> Node<T>? {
        let root = node.GetRoot() ?? node
        
        return RecursiveFind(root: root, toFind: node)
    }
    
    func FindNodeInSubtree(_ node: Node<T>) -> Node<T>? {
        return RecursiveFind(root: self, toFind: node)
    }
    
    private func RecursiveFind(root: Node<T>, toFind node: Node<T>) -> Node<T>? {
        for child in root.children {
            if child == node {
                return child
            } else {
                if let found = RecursiveFind(root: child, toFind: node) {
                    return found
                }
            }
        }
        
        return nil
    }
    
   static func==(lhs: Node<T>, rhs: Node<T>) -> Bool {
       return lhs.id == rhs.id
   }
}

extension Node<String> {
    func GetNodeInformation() -> String {
        return "Node info = { Parent: \(self.parent?.data ?? "None"), Data: \(self.data), Children: \(self.children) }"
    }
}

extension Node<String> : CustomStringConvertible {
  var description: String {
      var text = "\(self.data)"
    
      if !children.isEmpty {
          text += " [" + children.map { $0.description }.joined(separator: ", ") + "] "
      }
      return text
  }
}

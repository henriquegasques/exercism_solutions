package binarysearchtree

type BinarySearchTree struct {
	left  *BinarySearchTree
	data  int
	right *BinarySearchTree
}

// NewBst creates and returns a new BinarySearchTree.
func NewBst(i int) *BinarySearchTree {
	bst := BinarySearchTree{data: i}

	return &bst
}

// Insert inserts an int into the BinarySearchTree.
// Inserts happen based on the rules of a binary search tree
func (bst *BinarySearchTree) Insert(i int) {
	if i <= bst.data {
        if bst.left != nil {
            bst.left.Insert(i)
        } else {
            bst.left = NewBst(i)
        }
	} else {
        if bst.right != nil {
            bst.right.Insert(i)
        } else {
            bst.right = NewBst(i)
        }
	}
}

// SortedData returns the ordered contents of BinarySearchTree as an []int.
// The values are in increasing order starting with the lowest int value.
// A BinarySearchTree that has the numbers [1,3,7,5] added will return the
// []int [1,3,5,7].
func (bst *BinarySearchTree) SortedData() []int {
    sorted := make([]int, 10)

    size := bst.sort(0, sorted)

    return sorted[:size]
}

func (bst *BinarySearchTree) sort(position int, sorted[]int) int {
    if bst.left != nil {
       position = bst.left.sort(position, sorted)
    }

    sorted[position] = bst.data
    position++

    if bst.right != nil {
       position = bst.right.sort(position, sorted)
    }

    return position
}

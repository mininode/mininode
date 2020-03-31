/* rb3ptr  -- Intrusively linked 3-pointer Red-black tree implementation */

/* Copyright (C) 2019, Jens Stimpfle */

/*
Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#ifndef RB3PTR_H_INCLUDED
#define RB3PTR_H_INCLUDED

#ifndef UINTPTR_MAX  /* detect stdint.h */
#include <stdint.h>  /* uintptr_t */
#endif

#ifndef _RB3_ASSERT
#ifndef assert
#include <assert.h>
#endif
#define _RB3_ASSERT(x) assert(x)
#endif

#ifndef _RB3_NULL
#ifndef NULL
#include <stddef.h>
#endif
#define _RB3_NULL NULL
#endif


#ifdef __cplusplus   // not yet tested
extern "C" {
#endif


/**
 * Directions for navigation in the tree.
 */
enum rb3_dir {
        RB3_LEFT = 0,
        RB3_RIGHT = 1,
};

/**
 * This type is used to efficiently store a pointer (at least 4-byte aligned)
 * and some more information in the unused low bits.
 */
typedef uintptr_t rb3_ptr;

/**
 * Node type for 3-pointer Red-black trees.
 * Contains left, right, and parent pointers.
 * The left and right pointers have additional color bits.
 * The parent pointer contains a direction bit indicating the direction
 * to this child.
 */
struct rb3_head {
        rb3_ptr child[2];
        rb3_ptr parent;
};

/**
 * Tree type. It's just a fake base head that is wrapped for type safety and
 * future extensibility.
 */
struct rb3_tree {
        struct rb3_head base;
};

/**
 * User-provided comparison function. It is used during tree searches.
 * At each visited node, the function is called with that node as first
 * argument and some additional user-provided data.
 *
 * It should returns a value less than, equal to, or greater than, 0,
 * depending on whether the node compares less than, equal to, or greater
 * than, the user-provided data.
 */
typedef int rb3_cmp(struct rb3_head *head, void *data);

/**
 * User-provided augment function. Used to do recomputations when a child changed.
 */
typedef void rb3_augment_func(struct rb3_head *head /*, void *data */);

/**
 * Initialize an rb3_head.
 * After initialization, rb3_is_head_linked() will return false.
 */
static inline void rb3_reset_head(struct rb3_head *head)
{
        head->child[RB3_LEFT] = 0;
        head->child[RB3_RIGHT] = 0;
        head->parent = 0;
}

/**
 * Initialize an rb3_tree.
 */
static inline void rb3_reset_tree(struct rb3_tree *tree)
{
        tree->base.child[RB3_LEFT] = 0;
        /* ! see doc of rb3_is_base(). */
        tree->base.child[RB3_RIGHT] = 3;
        tree->base.parent = 0;
}

/**
 * Get base head of tree.
 *
 * Warning: the base head is never embedded in a client payload structure.
 * It's just a link to host the real root of the tree as its left child.
 */
static inline struct rb3_head *rb3_get_base(struct rb3_tree *tree)
{
        return &tree->base;
}

/**
 * Test if given head is base of tree.
 */
static inline int rb3_is_base(struct rb3_head *head)
{
        /* We could check for the parent pointer being null, but by having
         * a special sentinel right child value instead, we can make this
         * function distinguish the base from unlinked pointers as well.
         *
         * A side effect is that this breaks programs with trees that are not
         * initialized with rb3_init(), which could be a good or a bad thing,
         * I don't know. */
        return head->child[RB3_RIGHT] == 3;
}

/**
 * Check if a non-base head is linked in a (any) tree.
 */
static inline int rb3_is_head_linked(struct rb3_head *head)
{
        return head->parent != 0;
}

/**
 * Get child in given direction, or NULL if there is no such child. `dir`
 * must be RB3_LEFT or RB3_RIGHT.
 */
static inline struct rb3_head *rb3_get_child(struct rb3_head *head, int dir)
{
        return (struct rb3_head *)((head->child[dir]) & ~3);
}

/*
 * Test if a (left or right) child exists.
 * This is slightly more efficient than calling rb3_get_child() and comparing
 * to NULL.
 */
static inline int rb3_has_child(struct rb3_head *head, int dir)
{
        return head->child[dir] != 0;
}

/**
 * Get direction from parent to child by testing the direction.
 *
 * Return RB3_LEFT or RB3_RIGHT, depending on whether this node is the left or
 * right child of its parent node. If the given node is the root node,
 * RB3_LEFT is returned. (Technically the root node is the left child of the
 * base node).
 *
 * This is more convenient and (in theory) more efficient than getting the
 * parent and testing its left and right child.
 */
static inline int rb3_get_parent_dir(struct rb3_head *head)
{
        return head->parent & 1;
}

/**
 * Get parent head, or NULL if given node is the base head.
 *
 * Note that normally you don't want to visit the base head but stop already
 * at the root node.
 */
static inline struct rb3_head *rb3_get_parent(struct rb3_head *head)
{
        return (struct rb3_head *)(head->parent & ~3);
}

/**
 * Get topmost element of tree (or NULL if empty)
 */
static inline struct rb3_head *rb3_get_root(struct rb3_tree *tree)
{
        return rb3_get_child(&tree->base, RB3_LEFT);
}

/**
 * Check if tree is empty.
 */
static inline int rb3_is_empty(struct rb3_tree *tree)
{
        struct rb3_head *base = rb3_get_base(tree);
        return !rb3_has_child(base, RB3_LEFT);
}

/**
 * Get minimum or maximum node in the tree, depending on the value of `dir`
 * (RB3_LEFT or RB3_RIGHT)
 *
 * Time complexity: O(log n)
 */
extern struct rb3_head *rb3_get_minmax(struct rb3_tree *tree, int dir);

/**
 * Get minimum (leftmost) element, or NULL if tree is empty.
 *
 * Time complexity: O(log n)
 */
static inline struct rb3_head *rb3_get_min(struct rb3_tree *tree)
{
        return rb3_get_minmax(tree, RB3_LEFT);
}

/**
 * Get previous or next in-order descendant, depending on the value of `dir`
 * (RB3_LEFT or RB3_RIGHT).
 *
 * Time complexity: O(log n)
 */
extern struct rb3_head *rb3_get_prevnext_descendant(struct rb3_head *head, int dir);

/**
 * Get previous or next in-order ancestor, depending on the value of `dir`
 * (RB3_LEFT or RB3_RIGHT).
 *
 * Time complexity: O(log n)
 */
extern struct rb3_head *rb3_get_prevnext_ancestor(struct rb3_head *head, int dir);

/**
 * Get previous or next in-order node, depending on the value of `dir`.
 *
 * Time complexity: O(log n), amortized over sequential scan: O(1)
 */
extern struct rb3_head *rb3_get_prevnext(struct rb3_head *head, int dir);

/**
 * Get maximum (rightmost) element, or NULL if tree is empty
 *
 * Time complexity: O(log n)
 */
static inline struct rb3_head *rb3_get_max(struct rb3_tree *tree)
{
        return rb3_get_minmax(tree, RB3_RIGHT);
}

/**
 * Get previous in-order node (maximal node in the tree that sorts before the
 * given element) or NULL if no such element is in the tree.
 *
 * Time complexity: O(log n), amortized over sequential scan: O(1)
 */
static inline struct rb3_head *rb3_get_prev(struct rb3_head *head)
{
        return rb3_get_prevnext(head, RB3_LEFT);
}

/**
 * Get next in-order node (minimal node in the tree that sorts after the given
 * element) or NULL if no such element is in the tree.
 *
 * Time complexity: O(log n), amortized over sequential scan: O(1)
 */
static inline struct rb3_head *rb3_get_next(struct rb3_head *head)
{
        return rb3_get_prevnext(head, RB3_RIGHT);
}

/**
 * Get previous in-order descendant (maximal descendant node that sorts before
 * the given element) or NULL if no such element is in the tree.
 *
 * Time complexity: O(log n)
 */
static inline struct rb3_head *rb3_get_prev_descendant(struct rb3_head *head)
{
        return rb3_get_prevnext_descendant(head, RB3_LEFT);
}

/**
 * Get next in-order descendant (minimal descendant node that sorts after the
 * given element) or NULL if no such element is in the tree.
 *
 * Time complexity: O(log n)
 */
static inline struct rb3_head *rb3_get_next_descendant(struct rb3_head *head)
{
        return rb3_get_prevnext_descendant(head, RB3_RIGHT);
}

/**
 * Get previous in-order ancestor (maximal ancestor node that sorts before the
 * given element) or NULL if no such element is in the tree.
 *
 * Time complexity: O(log n)
 */
static inline struct rb3_head *rb3_get_prev_ancestor(struct rb3_head *head)
{
        return rb3_get_prevnext_ancestor(head, RB3_LEFT);
}

/**
 * Get next in-order ancestor (minimal ancestor node that sorts after the
 * given element) or NULL if no such element is in the tree.
 *
 * Time complexity: O(log n)
 */
static inline struct rb3_head *rb3_get_next_ancestor(struct rb3_head *head)
{
        return rb3_get_prevnext_ancestor(head, RB3_RIGHT);
}

/**
 * Find a node in `tree` using `cmp` to direct the search. At each visited
 * node in the tree `cmp` is called with that node and `data` as arguments.
 * If a node that compares equal is found, it is returned. Otherwise, NULL is
 * returned.
 *
 * Time complexity: O(log n)
 */
extern struct rb3_head *rb3_find(struct rb3_tree *tree, rb3_cmp cmp, void *data);

/**
 * Find a suitable insertion point for a new node in `tree` using `cmp` and
 * `data` to direct the search. At each visited node in the tree `cmp` is
 * called with that node and `data` as arguments. If a node that compares
 * equal is found, it is returned. Otherwise, NULL is returned and the
 * insertion point is returned as parent node and child direction in
 * `parent_out` and `dir_out`.
 *
 * Time complexity: O(log n)
 */
extern struct rb3_head *rb3_find_parent(struct rb3_tree *tree, rb3_cmp cmp, void *data, struct rb3_head **parent_out, int *dir_out);

/**
 * Link `head` into `tree` below another node in the given direction (RB3_LEFT
 * or RB3_RIGHT). The new node must replace a leaf. You can use
 * rb3_find_parent() to find the insertion point.
 *
 * `head` must not be linked into another tree when this function is called.
 *
 * Time complexity: O(log n)
 */
extern void rb3_link_and_rebalance(struct rb3_head *head, struct rb3_head *parent, int dir);

/**
 * Unlink `head` from its current tree.
 *
 * Time complexity: O(log n)
 */
extern void rb3_unlink_and_rebalance(struct rb3_head *head);

/**
 * Replace `head` with `newhead`. `head` must be linked in a tree and
 * `newhead` must not be linked in a tree.
 */
extern void rb3_replace(struct rb3_head *head, struct rb3_head *newhead);

/**
 * Like rb3_link_and_rebalance(), but call an augmentation function for each
 * subtree that has been changed.
 */
extern void rb3_link_and_rebalance_and_augment(struct rb3_head *head, struct rb3_head *parent, int dir, rb3_augment_func *augment);

/**
 * Like rb3_unlink_and_rebalance(), but call an augmentation function for each
 * subtree that has been changed.
 */
extern void rb3_unlink_and_rebalance_and_augment(struct rb3_head *head, rb3_augment_func *augment);

/**
 * Like rb3_replace(), but call an augmentation function for each subtree that has changed.
 */
extern void rb3_replace_and_augment(struct rb3_head *head, struct rb3_head *newhead, rb3_augment_func *augment);

/**
 * Update by calling the augmentation func for `head` and all its ancestors.
 */
extern void rb3_update_augment(struct rb3_head *head, rb3_augment_func *augment);

/**
 * Find suitable insertion point for a new node in a subtree, directed by the
 * given search function. The subtree is given by its parent node `parent` and
 * child direction `dir`. The insertion point and its child direction are
 * returned in `parent_out` and `dir_out`.
 *
 * If the searched node is already in the tree (the compare function returns
 * 0), it is returned. In this case `parent_out` and `dir_out` are left
 * untouched. Otherwise NULL is returned.
 */
extern struct rb3_head *rb3_find_parent_in_subtree(struct rb3_head *parent, int dir, rb3_cmp cmp, void *data, struct rb3_head **parent_out, int *dir_out);

/**
 * Insert `head` into `tree` using `cmp` and `data` to direct the search. At
 * each visited node in the tree `cmp` is called with that node and `data` as
 * arguments (in that order). If a node that compares equal is found, it is
 * returned. Otherwise, `head` is inserted into the tree and NULL is
 * returned.
 *
 * Time complexity: O(log n)
 */
extern struct rb3_head *rb3_insert(struct rb3_tree *tree, struct rb3_head *head, rb3_cmp cmp, void *data);

/**
 * Find and delete a node from `tree` using `cmp` to direct the search. At
 * each visited node in the tree `cmp` is called with that node and `head` as
 * arguments (in that order). If a node that compares equal is found, it is
 * unlinked from the tree and returned. Otherwise, NULL is returned.
 *
 * Time complexity: O(log n)
 */
extern struct rb3_head *rb3_delete(struct rb3_tree *tree, rb3_cmp cmp, void *data);

/**
 * Given a node that is known to be linked in _some_ tree, find that tree.
 *
 * This involves a little hackery with offsetof(3)
 */
extern struct rb3_tree *rb3_get_containing_tree(struct rb3_head *head);


/*
XXX: is inlining the search function advantageous?
*/
static inline struct rb3_head *rb3_INLINE_find(struct rb3_head *parent, int dir, rb3_cmp cmp, void *data, struct rb3_head **parent_out, int *dir_out)
{
        _RB3_ASSERT(parent != _RB3_NULL);
        while (rb3_has_child(parent, dir)) {
                parent = rb3_get_child(parent, dir);
                int r = cmp(parent, data);
                if (r == 0)
                        return parent;
                dir = (r < 0) ? RB3_RIGHT : RB3_LEFT;
        }
        if (parent_out)
                *parent_out = parent;
        if (dir_out)
                *dir_out = dir;
        return _RB3_NULL;
}

/**************** DEBUG STUFF *******************/
int rb3_check_tree(struct rb3_tree *tree);
/************************************************/

#ifdef __cplusplus
}  // extern "C"
#endif

#endif

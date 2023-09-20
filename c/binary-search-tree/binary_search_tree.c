#include "stdlib.h"
#include "stdio.h"
#include "binary_search_tree.h"

#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof(arr[0]))

node_t *build_tree(int *tree_data, size_t tree_data_len) {
    node_t *root = malloc(sizeof(tree_data_len--));

    root->data = tree_data[0];
    root->left = NULL;
    root->right = NULL;

    for (size_t i = 1; i < tree_data_len; i++) {
        node_t *node = malloc(sizeof(tree_data_len--));

        node->data = tree_data[i];
        node->left = NULL;
        node->right = NULL;

        insert_node(node, &root);

        printf("%d\n", root->data);

        if (root->left != NULL) {
            printf("Left: %d\n", root->left->data);
        }
    }

    return root;
}

void insert_node(node_t *node, node_t *parent_node) {
    if (parent_node == NULL) {
        parent_node->data = node->data;
        parent_node->left = node->left;
        parent_node->right = node->right;

        return;
    }

    if (node->data <= parent_node->data) {
        insert_node(node, parent_node->left);
    } else {
        insert_node(node, parent_node->right);
    }
}

int *sorted_data(node_t *tree) {
    int *sorted = malloc(sizeof(int[69]));

    sort_node(tree, sorted, 0);

    return sorted;
}

int sort_node(node_t *tree, int *sorted_array, int current_position) {
    if (tree->left != NULL)
        current_position = sort_node(tree->left, sorted_array, current_position);

    sorted_array[current_position++] = tree->data;

    if (tree->right != NULL)
        current_position = sort_node(tree->right, sorted_array, current_position);

    return current_position;
}

void free_tree(node_t *tree) {
    if (tree->left != NULL)
        free(tree->left);

    if (tree->right != NULL)
        free(tree->right);

    free(tree);
    tree = NULL;
}

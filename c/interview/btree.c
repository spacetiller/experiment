#include <stdio.h>

typedef struct node{ //树的结点
	int data;
	struct node* left;
	struct node* right;
} Node;

typedef struct { //树根
	Node* root;
} Tree;

void insert(Tree* tree, int value)//创建树
{
    Node* node=(Node*)malloc(sizeof(Node));//创建一个节点
    node->data = value;
    node->left = NULL;
    node->right = NULL;
}

int main(){
	
}

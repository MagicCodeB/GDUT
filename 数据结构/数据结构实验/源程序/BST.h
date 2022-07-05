#ifndef BST_H_INCLUDED
#define BST_H_INCLUDED

typedef int TElemType;

typedef struct BSTNode{
    TElemType data;
    struct BSTNode *lchild;
    struct BSTNode *rchild;
}BSTNode,*BSTree;

typedef enum Status{
    ERROR,
    SUCCESS
}Status;

Status InitBSTree(BSTree *T);/*初始化二叉排序树*/

Status EmptyBSTree(BSTree T);/*判断二叉排序树是否为空*/

Status DestroyBiTree(BSTNode* T);/*销毁一颗二叉排序树*/

Status PreOrderTraverse(BSTree T, Status (*visit)(TElemType e));/*先序遍历二叉排序树*/

Status InOrderTraverse(BSTree T, Status (*visit)(TElemType e));/*中序遍历二叉排序树*/

Status PostOrderTraverse(BSTree T, Status (*visit)(TElemType e));/*后序遍历二叉排序树*/

Status visit(TElemType e);/*遍历函数*/

Status InsertBSTree(BSTree T,TElemType e);/*插入一个元素到二叉排序树中*/

int Leaves(BSTree T);/*计算二叉排序树叶子数量*/

int BSTreeDepth(BSTree T);/*计算二叉排序树深度*/

Status Search(BSTree T,TElemType e);/*搜索二叉排序树是否有该值*/

Status DeleteBST(BSTree *T,TElemType e);/*删除二叉排序树中某结点*/

Status DeleteNode(BSTree* T);/*删除结点函数*/

void print();/*菜单函数*/
#endif // BST_H_INCLUDED

#include<stdio.h>
#include"BST.h"
#include<stdlib.h>

Status InitBSTree(BSTree *T)
{
    TElemType data;
    (*T)=(BSTNode*)malloc(sizeof(BSTNode));
    if(T==NULL)
    {
        printf("Initialize failed!\n");
        return ERROR;
    }
    else
    {
        printf("Please input the root's value:");
        scanf("%d",&data);
        (*T)->data=data;
        (*T)->lchild=NULL;
        (*T)->rchild=NULL;
        printf("Initialize successfully!\n");
        return SUCCESS;
    }
}

Status EmptyBSTree(BSTree T)
{
    if(!T)
    {
        return ERROR;
    }
    else
    {
        return SUCCESS;
    }

}

Status DestroyBiTree(BSTNode* T)/*摧毁二叉树*/
{
    if(T->lchild)
    {
        DestroyBiTree(T->lchild);
    }
    if(T->rchild)
    {
        DestroyBiTree(T->rchild);
    }
    free(T);
    T=NULL;
    return SUCCESS;
}
Status PreOrderTraverse(BSTree T, Status (*visit)(TElemType e))/*前序遍历二叉树*/
{
    if(visit==NULL)return ERROR;
    if(T)
    {
        visit(T->data);
        PreOrderTraverse(T->lchild,visit);
        PreOrderTraverse(T->rchild,visit);
        return SUCCESS;
    }
    return ERROR;
}
Status InOrderTraverse(BSTree T, Status (*visit)(TElemType e))/*中序遍历二叉树*/
{
    if (visit==NULL) return ERROR;
    if (T)
    {
        InOrderTraverse(T->lchild, visit);
        visit(T->data);
        InOrderTraverse(T->rchild, visit);
        return SUCCESS;
    }
    return ERROR;
}
Status PostOrderTraverse(BSTree T, Status (*visit)(TElemType e))/*后序遍历二叉树*/
{
    if (visit==NULL) return ERROR;
    if (T)
    {
        PostOrderTraverse(T->lchild,visit);
        PostOrderTraverse(T->rchild,visit);
        visit(T->data);
        return SUCCESS;
    }
    return ERROR;
}

Status visit(TElemType e)/*遍历函数*/
{
    printf("%d  ",e);
    return SUCCESS;
}
Status InsertBSTree(BSTree T,TElemType e)
{
    BSTree s,p=T;
    s=(BSTree)malloc(sizeof(BSTNode));
    if(s==NULL)
    {
        printf("Insert failed!\n");
        return ERROR;
    }
    s->data=e;
    s->lchild=NULL;
    s->rchild=NULL;
    while(T)
    {
        if(p->data==e)
        {
            printf("The value has existed!\n");
            return ERROR;
        }
        if(p->data>e)
        {
            if(p->lchild)
            {
                p=p->lchild;
            }
            else
            {
                p->lchild=s;
                printf("insert successfully!\n");
                return SUCCESS;
            }
        }
        if(p->data<e)
        {
            if(p->rchild)
            {
                p=p->rchild;
            }
            else
            {
                p->rchild=s;
                printf("insert successfully!\n");
                return SUCCESS;
            }
        }
    }
    return ERROR;
}

int Leaves(BSTree T)
{
    if(T==NULL)
    {
        return 0;
    }
    else if(T->lchild==NULL&&T->rchild==NULL)
    {
        return 1;
    }
    else
    {
        return Leaves(T->lchild)+Leaves(T->rchild);
    }
}

int BSTreeDepth(BSTree T)
{
    int depthLeft,depthRight;
    if(T==NULL)
    {
        return 0;
    }
    else
    {
        depthLeft=BSTreeDepth(T->lchild);
        depthRight=BSTreeDepth(T->rchild);
        return 1+(depthRight>depthLeft?depthRight:depthLeft);
    }
}

Status Search(BSTree T,TElemType e)
{
    BSTree p=T;
    while(T)
    {
        if(p->data==e)
        {
            printf("Search successfully,the value existed!\n");
            return SUCCESS;
        }
        if(p->data>e)
        {
            if(p->lchild)
            {
                p=p->lchild;
            }
            else
            {
                printf("Search failed,the value isn't existed!\n");
                return ERROR;
            }
        }
        if(p->data<e)
        {
            if(p->rchild)
            {
                p=p->rchild;
            }
            else
            {
                printf("Search failed,the value isn't existed!\n");
                return ERROR;
            }
        }
    }
    return ERROR;
}

Status DeleteBST(BSTree *T,TElemType e)
{
    if(!*T)return ERROR;
    else
    {
        if(e==(*T)->data )
        {
            DeleteNode(T);
            return SUCCESS;
        }
        else if(e<(*T)->data)
        {
            return DeleteBST(&(*T)->lchild,e);
        }
        else
        {
            return DeleteBST(&(*T)->rchild,e);
        }
    }
}

Status DeleteNode(BSTree *T)
{
    BSTree q,s;
    if((*T)->rchild==NULL)
    {
        q=*T;
        (*T)=(*T)->lchild;
        free(q);
    }
    else if((*T)->lchild==NULL)
    {
        q=*T;
        *T=(*T)->rchild;
        free(q);
    }
    else
    {
        q=*T;
        s=(*T)->lchild;
        while(s->rchild)
        {
            q=s;
            s=s->rchild;
        }
        (*T)->data=s->data;
        if(q!=*T)
        {
            q->rchild=s->lchild;
        }
        else
        {
            q->lchild=s->lchild;
        }
        free(s);
    }
    return SUCCESS;
}

void print()
{
    {
        printf("******************************************************************************\n");
        printf("*       Welcome to the menu of Binary Search Tree made by WYH                *\n");
        printf("******************************************************************************\n");
        printf("*                 1.Initialize the Binary Search Tree                        *\n");
        printf("*                 2.Destroy the Binary Search Tree                           *\n");
        printf("*                 3.PreOrder Traverse the Binary Search Tree                 *\n");
        printf("*                 4.InOrder Traverse the Binary Search Tree                  *\n");
        printf("*                 5.PostOrder Traverse the Binary Search Tree                *\n");
        printf("*                 6.Insert a value to the Binary Search Tree                 *\n");
        printf("*                 7.Delete a value from the Binary Search Tree               *\n");
        printf("*                 8.Calculate the leaves of the Binary Search Tree           *\n");
        printf("*                 9.Calculate the depth of the Binary Search Tree            *\n");
        printf("*                10.Search a value in the Binary Search Tree                 *\n");
        printf("*                11.Exit                                                     *\n");
        printf("******************************************************************************\n");
        printf("-------------------------please select a number-------------------------------\n");
        printf("The number you choose is : ");
    }
}

#include <stdio.h>
#include <stdlib.h>
#include "BST.h"
int main()
{
    int number;
    BSTree T;
    BSTNode *s=NULL;
    T=s;
    print();
    while(1)
    {
        system("CLS");
        print();
        scanf("%d",&number);
        if(number>=1&&number<=11)
        {
            switch(number)
            {
                case 1:
                {
                    InitBSTree(&T);
                    system("PAUSE");
                    break;
                }
                case 2:
                {

                    if(!T)
                    {
                        printf("Please initialize the Binary Search Tree first!\n");
                    }
                    else
                    {
                        DestroyBiTree(T);
                        {
                            printf("Destroy the Binary Search Tree successfully!\n");
                        }
                        T=NULL;

                    }
                    system("PAUSE");
                    break;
                }
                case 3:
                {
                    if(!T)
                    {
                        printf("Please initialize the Binary Search Tree first!\n");
                    }
                    else
                    {
                        printf("The PreOrderTraversal is:");
                        PreOrderTraverse(T,visit);
                    }
                    system("PAUSE");
                    break;
                }
                case 4:
                {
                    if(!T)
                    {
                        printf("Please initialize the Binary Search Tree first!\n");
                    }
                    else
                    {
                        printf("The InOrderTraversal is:");
                        InOrderTraverse(T,visit);
                    }
                    system("PAUSE");
                    break;
                }
                case 5:
                {
                    if(!T)
                    {
                        printf("Please initialize the Binary Search Tree first!\n");
                    }
                    else
                    {
                        printf("The PostOrderTraversal is:");
                        PostOrderTraverse(T,visit);
                    }
                    system("PAUSE");
                    break;
                }
                case 6:
                {
                    if(!T)
                    {
                        printf("Please initialize the Binary Search Tree first!\n");
                    }
                    else
                    {
                        printf("Input the value you want to insert:");
                        TElemType rootvalue;
                        scanf("%d",&rootvalue);
                        InsertBSTree(T,rootvalue);
                    }
                    system("PAUSE");
                    break;
                }
                case 7:
                {
                    if(!T)
                    {
                        printf("Please initialize the Binary Search Tree first!\n");
                    }
                    TElemType elem;
                    printf("Please input the value you want to delete:");
                    scanf("%d",&elem);
                    if(Search(T,elem))
                    {
                        DeleteBST(&T,elem);
                        printf("The value was deleted successfully!\n");
                    }
                    system("PAUSE");
                    break;
                }
                case 8:
                {
                    if(!T)
                    {
                        printf("Please initialize the Binary Search Tree first!\n");
                    }
                    else
                    {
                        int leaves;
                        leaves=Leaves(T);
                        printf("The leave's quantity of the Binary Search Tree is %d\n",leaves);
                    }
                    system("PAUSE");
                    break;
                }
                case 9:
                {
                    if(!T)
                    {
                        printf("Please initialize the Binary Search Tree first!\n");
                    }
                    else
                    {
                        int depth;
                        depth=BSTreeDepth(T);
                        printf("The depth of the Binary Search Tree is %d\n",depth);
                    }
                    system("PAUSE");
                    break;
                }
                case 10:
                {
                    if(!T)
                    {
                        printf("Please initialize the Binary Search Tree first!\n");
                    }
                    else
                    {
                        TElemType data1;
                        printf("Please input the value you want to search!\n");
                        scanf("%d",&data1);
                        Search(T,data1);
                    }
                    system("PAUSE");
                    break;
                }
                case 11:
                {
                    printf("ByeBye~\n");
                    system("PAUSE");
                    goto end;
                }

            }
        }
        else
        {
            printf("Error input\n");
            system("PAUSE");
        }
    }
    end:
    return 0;
}

/*
 * Copyright (c) 2006 All rights reserved.
 * �ļ�����HashSearch.c
 *
 * �ļ���ʶ��HashSearch
 * ժҪ��һ���򵥵Ĺ�ϣ������ʾ��
 * ���룺Ա����ID
 * ��������������ID����Ա�����ϲ��������û���ҵ�������Ӧ��ʾ
 *
 * ��ǰ�汾 0.01
 * ���ߣ���
 * ������ڣ�2006��3��28��
 */
#include <stdio.h>
#include <stdlib.h>
#define HASHSIZE 11
/* ��ϣ��Ԫ�صĽṹ���� */
typedef struct
{
    int ID;
    char *name;
    float salary;
} employee;
typedef employee DataType;
/* ����һ��ȫ�ֵģ�Ԫ������Ϊ employee �Ĺ�ϣ�� */
DataType Hash[HASHSIZE];
/* 
��������Create_Hash
������employeesΪԱ���������飬 sizeΪ�����С
���ܣ�����СΪsize��Ա���������鰴Ա��IDӳ�䵽Hash��
*/
void Create_Hash(DataType *employees, int size);
/*��������HashFun
  ������keyΪԱ��ID
  ���ܣ���Ա��IDӳ��ΪHash���е��±��ַ
  ����ֵ�����ظ����ؼ��ֶ�Ӧ��Hash���±��ַ
*/
int HashFun(int key);
/*��������HashSearch
  ������keyΪԱ����ID
  ���ܣ���Hash�������������ؼ��ֵ�Ա����Ϣ
  ����ֵ���ҵ�����1�������Ա�����ϣ� �Ҳ�������0����ʾû���ҵ�
*/
int HashSearch(int key);
/*��������OverHandle
  ������address������ͻHash���±��ַ
  ���ܣ�
  ����ֵ��
*/
int OverHandle(int address);
/*��������printemployee
  ������һ��Ա�����Ͻṹ��ָ��
  ���ܣ���Ļ���Ա������
  ����ֵ����
*/
void printemployee(DataType *employee)
{
 printf("ID : %d \t Name: %s\t Salary:%f\n", 
  employee->ID, employee->name, employee->salary);
}
int main(int argc, char* argv[])
{
    int size;
 int key1;
 static char ch;
 /* Ա���������� */
    DataType employee[] = {
                            {11, "luojiafeng", 5000},
                            {37, "wangqian", 8000},
                            {48, "liujie", 6000},
                            {97, "gaoxing", 10000},
                            {86, "xiaozhen", 6000},
                            {26, "chenghu", 8800}
                          };
 /* ����Ԫ�ظ��� */
    size = sizeof(employee) / sizeof(employee[0]);
 /* ��Ա����������ӳ�䵽��ϣ�� */
    Create_Hash(employee, size);
    /* ����һ��Ա����ID�����Ҳ���ʾ�����Ϣ */
  printf("������һλԱ����ID��\n");
  scanf("%d", &key1);
  HashSearch(key1);
}
void Create_Hash(DataType *employees, int size)
{
    int i, j;
 DataType empty = {0, NULL, 0.0};
    for (i = 0; i < HASHSIZE; i++)
    {
        Hash[i] = empty;
    }
    for (i = 0; i < size; i++)
    {
        j = 0;
        while (j < HASHSIZE)
        {
   /* ����Ա��ID����Ա�����ϴ�ŵ����� */
            if (Hash[(employees[i].ID % HASHSIZE) + j].ID == 0)
            {
                Hash[(employees[i].ID % HASHSIZE) + j] = employees[i];
                break;
            }
   /* j++��ʾ�����˳�ͻ */
            else
            j++;
        }
    }
}
int HashFun(int key)
{
    return key % HASHSIZE;
}
DataType HashValue(int key)
{
    return Hash[key % HASHSIZE];
}
int HashSearch(int key)
{
    DataType temp;
    int address, count = 0;
    address = HashFun(key);
    count++;
    temp = HashValue(address);
    if (temp.ID == key)
 {
  printemployee(&temp);
        return 1;
 }
    else if (temp.ID == 0)
    {
  printf("û���ҵ���������ID��صļ�¼!\n");
        return 0;
    }
    else
    {
        while (count < HASHSIZE)
        {
            address = OverHandle(address);
            temp = HashValue(address);
            if (temp.ID == key)
   {
          printemployee(&temp);
                return 1;
   }
            count++;
        }
    }
    return 0;
}
int OverHandle(int address)
{
    return (address+1) % HASHSIZE;
}
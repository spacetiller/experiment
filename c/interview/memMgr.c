#include <alloc.h>

typedef struct {
	int fn;	// 相当于 buf 指针
	int size;
	int mutex;
	int (*lock)();
	int (*unlock)();
	metaInfo *next;
} metaInfo;

typedef struct {
	metaInfo * meta;
	int memNum;
	int memTotal;
	int (* m_malloc)();
	int (* m_delete)();
} memMgr;
memMgr mgr;

int * m_malloc(int size){
	char *got;
	metaInfo * meta = mgr->meta;

	// 真实分配内存
	got = malloc(size);
	
	// 申请meta块
	metaInfo * newmeta = malloc(sizeof(metaInfo));
	newmeta->lock();

	// 查找meta 
	while(meta->next){
		meta = meta->next;
	}

	newMeta->fn = got;
	newMeta->size = size;
	newMeta->mutex = 1;
	mgr->memNum ++ ;
	mgr->memTotal += size;
	
	newmeta->unlock();

	return got;
}

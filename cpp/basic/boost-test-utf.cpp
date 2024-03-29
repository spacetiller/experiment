#define BOOST_TEST_MAIN
#define BOOST_TEST_DYN_LINK
#include <boost/test/unit_test.hpp>
#include <boost/smart_ptr.hpp>
using namespace boost;

// 开始测试套件s_smart_ptr
BOOST_AUTO_TEST_SUITE(s_smart_ptr)

// 测试用例1：t_scoped_ptr
BOOST_AUTO_TEST_CASE(t_scoped_ptr)
{
    scoped_ptr<int> p(new int(874));
    BOOST_CHECK(p);                     // 测试指针p的可用性
    BOOST_CHECK_EQUAL(*p, 875);         // 测试p解引用的值
 
    p.reset();
    BOOST_CHECK(p == 0);                // 测试p为空
}

// 测试用例2：t_shared_ptr
BOOST_AUTO_TEST_CASE(t_shared_ptr)
{
    shared_ptr<int> p(new int(100));
 
    BOOST_CHECK(p);
    BOOST_CHECK_EQUAL(*p, 100);
    BOOST_CHECK_EQUAL(p.use_count(), 1);
    shared_ptr<int> p2 = p;
    BOOST_CHECK_EQUAL(p, p2);
    BOOST_CHECK_EQUAL(p2.use_count(), 2);
 
    *p2 = 255;
    BOOST_CHECK_EQUAL(*p, 255);
    BOOST_CHECK_GT(*p, 200);
}

// 结束测试套件
BOOST_AUTO_TEST_SUITE_END()


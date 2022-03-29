#define BOOST_TEST_MAIN
#include <boost/test/included/unit_test.hpp>
#include <boost/assign.hpp>
#include <iostream>
using namespace std;


struct global_fixture
{
    global_fixture() { cout << ("global setup\n") << endl; }
    ~global_fixture() { cout << ("global teardown\n") << endl; }
};


BOOST_GLOBAL_FIXTURE(global_fixture);


struct assign_fixture
{
    assign_fixture() { cout << ("suit setup\n") << endl; }
    ~assign_fixture() {cout << ("suit teardown\n") << endl; }
    vector<int> v;
}; 


BOOST_FIXTURE_TEST_SUITE(s_assign, assign_fixture)


BOOST_AUTO_TEST_CASE(t_assign_1)
{
    using namespace boost::assign;


    v += 1,2,3,4;
    BOOST_CHECK_EQUAL(v.size(), 4);
    BOOST_CHECK_EQUAL(v[2], 4);
}


BOOST_AUTO_TEST_SUITE_END()

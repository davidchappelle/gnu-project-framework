#include <cxxtest/TestSuite.h>


#include "skeleton/Skeleton.hpp"


class MySkeletonTestSuite : public CxxTest::TestSuite
{
public:
    void test_skeleton(void)
    {
        TS_ASSERT_EQUALS(true, true);
    }
};



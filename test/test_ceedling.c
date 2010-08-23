#include "unity.h"     // compile/link in Unity test framework
#include "seedling.h"
#include "mock_bar.h"
#include "mock_baz.h"
 
void setUp(void) {}    // every test file requires this function;
                       // setUp() is called by the generated runner before each test case function

void tearDown(void) {} // every test file requires this function;
                       // tearDown() is called by the generated runner before each test case function

// a test case function
void Testassert_false(void)
{
  TEST_ASSERT_FALSE(0);
}
void test_assert_true(void)
{ 
  TEST_ASSERT_TRUE(1);
  tf_ExpectAndReturn(0xABCD); // setup function from mock_bar.c that instructs our
  TEST_ASSERT_EQUAL(0xABCD, foo()); // assertion provided by Unity
}

void test_baz_mock(void)
{
  baz_ExpectAndReturn(1,2, 3); // setup function from mock_bar.c that instructs our
  TEST_ASSERT_EQUAL(3, baz(1,2));

  baz_ExpectAndReturn(2,1, 3); // setup function from mock_bar.c that instructs our
  TEST_ASSERT_EQUAL(3, baz(2,1));
}



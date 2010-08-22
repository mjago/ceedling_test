#include "/home/martyn/ceedling/ceedling/vendor/unity/src/unity.h"     // compile/link in Unity test framework

void setUp(void) {}    // every test file requires this function;
                       // setUp() is called by the generated runner before each test case function

void tearDown(void) {} // every test file requires this function;
                       // tearDown() is called by the generated runner before each test case function

// a test case function
void test_Foo_Function1_should_Call_Bar_AndGrill(void)
{
  TEST_IGNORE();
  //    Bar_AndGrill_Expect();                    // setup function from mock_bar.c that instructs our
                                              // framework to expect Bar_AndGrill() to be called once
    //    TEST_ASSERT_EQUAL(0xFF, Foo_Function1()); // assertion provided by Unity
                                              // Foo_Function1() calls Bar_AndGrill() & returns a byte
  //    TEST_IGNORE("FAIL! I failed on purpose!");
}


// end of test_foo.c ----------------------------------------

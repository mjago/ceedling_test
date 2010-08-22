#include "unity.h"
#include "seedling.h"
#include "mock_bar.h"


void setUp(void) {}





void tearDown(void) {}







void Testassert_false(void)

{

  { UnityIgnore( (((void *)0)), (unsigned short)14); };



  if (!(1)) {} else {{ UnityFail( (" Expected FALSE Was TRUE"), (unsigned short)(unsigned short)16); };};

}

void test_assert_true(void)

{

  if ((1)) {} else {{ UnityFail( (" Expected TRUE Was FALSE"), (unsigned short)(unsigned short)20); };};

  tf_CMockExpectAndReturn(21, 0xABCD);

  UnityAssertEqualNumber((_U_SINT)((0xABCD)), (_U_SINT)((foo())), (((void *)0)), (unsigned short)22, UNITY_DISPLAY_STYLE_INT);

}



void test_1(void)

{

  if ((0)) {} else {{ UnityFail( (" Expected TRUE Was FALSE"), (unsigned short)(unsigned short)27); };};

}



void test_2(void)

{

  if ((0)) {} else {{ UnityFail( (" Expected TRUE Was FALSE"), (unsigned short)(unsigned short)32); };};

}



void test_3(void)

{

  if ((0)) {} else {{ UnityFail( (" Expected TRUE Was FALSE"), (unsigned short)(unsigned short)37); };};

}

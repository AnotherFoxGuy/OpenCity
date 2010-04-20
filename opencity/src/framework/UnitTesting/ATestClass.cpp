/***************************************************************************
                        CTestClass.cpp  -  description
							-------------------
	begin                : November 29th, 2009
	copyright            : (C) 2009 by Duong Khang NGUYEN
	email                : neoneurone @ gmail com

	$Id$
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   any later version.                                                    *
 *                                                                         *
 ***************************************************************************/

// Framework headers
#include "ATestClass.h"					// UnitTesting::TestClass abstract class
#include "CAssertFailedException.h"		// UnitTesting::AssertFailedException class
#include "System/CConsole.h"			// System::Console class


SPF_NAMESPACE_BEGIN(UnitTesting)


   /*=====================================================================*/
TestClass::TestClass() {}


TestClass::~TestClass() {}


   /*=====================================================================*/
const System::Collections::Generic::List<TestMethod>&
TestClass::GetTestMethods() const
{
	return this->mcTestMethods;
}


   /*=====================================================================*/
void TestClass::Add(const TestMethod& method)
{
	mcTestMethods.Add(method);
}


const System::Collections::Generic::List<TestResult> TestClass::Run() const
{
	TestResult finalResult;
	System::Collections::Generic::List<TestResult> results;

	int count = mcTestMethods.GetCount();
	for (int i = 0; i < count; i++) {
		TestMethod method = mcTestMethods[i];
		TestResult runResult = method.Run();

		// Compare the run result to the expected test result.
		if (runResult == method.GetExpectedTestResult()) {
			finalResult = TestResult::Passed;
		}
		else {
			finalResult = TestResult::Failed;
		}

		// Store the final result;
		results.Add(finalResult);
	} // for

	return results;
}


   /*=====================================================================*/
System::String TestClass::ToString() const
{
	return System::String("UnitTesting::TestClass");
}


SPF_NAMESPACE_END

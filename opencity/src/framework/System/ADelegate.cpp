/***************************************************************************
                        ADelegate.cpp  -  description
							-------------------
	begin                : February 3rd, 2010
	copyright            : (C) 2010 by Duong Khang NGUYEN
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
#include "ADelegate.h"			// System::Delegate class
#include "CString.h"			// System::String class
#include "CNullValue.h"			// System::NullValue class

#include "CNotImplementedException.h"	// Testing


SPF_NAMESPACE_BEGIN(System)


   /*=====================================================================*/
Delegate::Delegate() {}


Delegate::~Delegate() {}


   /*=====================================================================*/
Object Delegate::DynamicInvoke(const IntPtr& intPtr) const
{
	return this->DynamicInvokeImpl(intPtr);
}


   /*=====================================================================*/
String Delegate::ToString() const
{
	return String("System::Delegate");
}


   /*=====================================================================*/
Object Delegate::DynamicInvokeImpl(const IntPtr& intPtr) const
{
	throw NotImplementedException();

	//return Null;
}



SPF_NAMESPACE_END
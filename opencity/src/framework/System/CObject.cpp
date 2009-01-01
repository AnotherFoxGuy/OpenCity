/***************************************************************************
                        CObject.cpp  -  description
							-------------------
	begin                : December 29th, 2008
	copyright            : (C) 2008 by Duong Khang NGUYEN
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
#include "CObject.h"			// System::Object class
#include "CString.h"			// System::String class
#include "CType.h"				// System::Type class

// GCC headers					// GCC demangle functionality
#include "cxxabi.h"

// Standard C++ headers
#include "typeinfo"				// Standard C++ type_info class


   /*=====================================================================*/
namespace System
{
	Object::Object() {}


	Object::~Object() {}


	String Object::ToString() const
	{
		return String("System::Object");
	}


	Type Object::GetType() const
	{
		int iStatus;
		const std::type_info& oTypeInfo = typeid(*this);
		const char* sRealName = abi::__cxa_demangle(oTypeInfo.name(), 0, 0, &iStatus);

		// Implicit conversion from "const char*" to "System::String"
		return Type(sRealName);
	}
} // namespace System

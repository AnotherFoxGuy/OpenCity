/***************************************************************************
                        AButtonBase.h  -  description
							-------------------
	begin                : January 1st, 2011
	copyright            : (C) 2011 by Duong Khang NGUYEN
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

#ifndef _SPF_SYSTEM_WINDOWS_FORMS_ABUTTONBASE_H_
#define _SPF_SYSTEM_WINDOWS_FORMS_ABUTTONBASE_H_ 1

// Framework headers
#include "CControl.h"

SPF_NAMESPACE_BEGIN(System)
SPF_NAMESPACE_NESTED_BEGIN(Windows, Forms)

/**
	Implements the basic functionality common to button controls.
*/
class ButtonBase : public Control
{
	public:
		ButtonBase();
		virtual ~ButtonBase();

		virtual String ToString() const;

}; // class System::Windows::Forms::ButtonBase

// namespace Windows::Forms
SPF_NAMESPACE_NESTED_END

// namespace System
SPF_NAMESPACE_END

#endif

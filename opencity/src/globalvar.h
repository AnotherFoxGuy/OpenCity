/***************************************************************************
						globalvar.h    -  description
							-------------------
	begin                : october 17th, 2006
	copyright            : (C) 2006-2008 by Duong-Khang NGUYEN
	email                : neoneurone @ users sourceforge net

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

#ifndef _OPENCITY_GLOBALVAR_H_
#define _OPENCITY_GLOBALVAR_H_ 1

#include "main.h"				// Main defines
#include "audiomanager.h"		// Audio support
#include "extensionmanager.h"	// OpenGL extension manager
#include "graphicmanager.h"		// Graphic object manager
#include "map.h"				// Height map handling
#include "propertymanager.h"	// Structure properties manager
#include "renderer.h"			// Video renderer
#include "networking.h"			// Networking support
#include "movementmanager.h"	// Moving object manager
#include "kernel.h"				// MAS kernel
#include "environment.h"		// MAS environment
#include "pathfinder.h"			// Path finding algorithm
#include "mapgen/mapmaker.h"	// Map generator

// The current OpenCity version
#define OC_VERSION			0
#define OC_PATCHLEVEL		0
#define OC_SUBLEVEL			6


//========================================================================
/** This structure contain the global settings
	\author Duong-Khang NGUYEN
*/
struct GlobalVar
{
// Config file and command line options
	bool gboolUseAudio;
	bool gboolFullScreen;
	bool gboolServerMode;
	uint guiCityWidth;
	uint guiCityLength;
	uint guiMsPerFrame;
	uint guiScreenWidth;
	uint guiScreenHeight;
	uint guiVideoBpp;

	uint guiGeneratorSeed;
	string gsGeneratorHeightMap;
	MapGen::MapMaker::MAP_TYPE guiGeneratorMapType;
	MapGen::MapMaker::WATER_TYPE guiGeneratorWaterType;
	MapGen::MapMaker::MAP_SHAPE_TYPE guiGeneratorMapShapeType;
	MapGen::MapMaker::TREE_DENSITY_TYPE guiGeneratorTreeDensityType;

	OC_FLOAT gfMsSimDelayMax;
	string gsZenServer;

// Application status
	bool gboolActive;				///< Is the application is active

// The mutex that all the simulators depend on
	SDL_mutex* gpmutexSim;

// The famous renderer
	Renderer* gpRenderer;

// Data managers
	AudioManager* gpAudioMgr;
	GraphicManager* gpGraphicMgr;
	ExtensionManager* gpExtensionMgr;
	PropertyManager* gpPropertyMgr;
	MapGen::MapMaker* gpMapMaker;	///< The MapMaker is used to create the height map
	Map* gpMapMgr;
	Networking* gpNetworking;
	PathFinder* gpPathFinder;
	MovementManager* gpMoveMgr;

// Multi-Agent System
	Kernel* gpKernel;
	Environment* gpEnvironment;

// The SDL video surface
	SDL_Surface* gpVideoSrf;
};


#endif

































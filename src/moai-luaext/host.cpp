// Copyright (c) 2010-2011 Zipline Games, Inc. All Rights Reserved.
// http://getmoai.com

#include <moai-luaext/host.h>

extern "C" {	
	extern int luaopen_crypto			( lua_State *L );
	extern int luaopen_lfs				( lua_State *L );
	extern int luaopen_luacurl			( lua_State *L );
	extern int luaopen_luasql_sqlite3	( lua_State *L );
	extern int luapreload_fullluasocket ( lua_State *L );
}

//================================================================//
// aku-luaext
//================================================================//

//----------------------------------------------------------------//
void AKUExtLoadLuacrypto () {

#ifndef MOAI_OS_LINUX
	lua_State* state = AKUGetLuaState ();
	luaopen_crypto ( state );
#endif
}

//----------------------------------------------------------------//
void AKUExtLoadLuacurl () {

#ifndef MOAI_OS_LINUX
	lua_State* state = AKUGetLuaState ();
	luaopen_luacurl ( state );
#endif
}

//----------------------------------------------------------------//
void AKUExtLoadLuafilesystem () {

	lua_State* state = AKUGetLuaState ();
	luaopen_lfs ( state );
}

//----------------------------------------------------------------//
void AKUExtLoadLuasocket () {

	lua_State* state = AKUGetLuaState ();
	luapreload_fullluasocket ( state );
}

//----------------------------------------------------------------//
void AKUExtLoadLuasql () {

#ifndef MOAI_OS_LINUX
	lua_State* state = AKUGetLuaState ();
	luaopen_luasql_sqlite3 ( state );
#endif
}

cmake_minimum_required ( VERSION 2.8.5 )
project ( moai-luaext )

if ( BUILD_LINUX )
  set ( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DMOAI_OS_LINUX" )
endif ( BUILD_LINUX )

set ( MOAI_LUAEXT_INCLUDES
  ${THIRD_PARTY_INCLUDES}
  "../../src/"
  "../../src/config-default/"

 CACHE INTERNAL "doc string" )

include_directories (
  ${MOAI_LUAEXT_INCLUDES}
)

set ( CMAKE_CURRENT_SOURCE_DIR "../../src/moai-luaext/" )

# Use all cpp files in directory as source code
file ( GLOB MOAI_LUAEXT_SRC "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp" )

include_directories ( ${MOAI_LUAEXT_INCLUDES} )

add_library ( moai-luaext STATIC ${MOAI_LUAEXT_SRC} )

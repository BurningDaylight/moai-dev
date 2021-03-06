cmake_minimum_required ( VERSION 2.8.5 )
project ( chipmunk )



    set ( CMAKE_CURRENT_SOURCE_DIR "${MOAI_ROOT}/3rdparty/chipmunk-5.3.4/src/" )

    set ( CHIPMUNK_INCLUDES "${MOAI_ROOT}/3rdparty/chipmunk-5.3.4/include/chipmunk/;${MOAI_ROOT}/3rdparty/chipmunk-5.3.4/include/")

    if (BUILD_WINDOWS)
        set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D_CRT_SECURE_NO_WARNINGS -DWIN32 -D_DEBUG -D_LIB " )
    endif(BUILD_WINDOWS)

    set ( CHIPMUNK_SOURCES 

        ${CMAKE_CURRENT_SOURCE_DIR}chipmunk.c
        ${CMAKE_CURRENT_SOURCE_DIR}constraints/cpConstraint.c
        ${CMAKE_CURRENT_SOURCE_DIR}constraints/cpDampedRotarySpring.c
        ${CMAKE_CURRENT_SOURCE_DIR}constraints/cpDampedSpring.c
        ${CMAKE_CURRENT_SOURCE_DIR}constraints/cpGearJoint.c
        ${CMAKE_CURRENT_SOURCE_DIR}constraints/cpGrooveJoint.c
        ${CMAKE_CURRENT_SOURCE_DIR}constraints/cpPinJoint.c
        ${CMAKE_CURRENT_SOURCE_DIR}constraints/cpPivotJoint.c
        ${CMAKE_CURRENT_SOURCE_DIR}constraints/cpRatchetJoint.c
        ${CMAKE_CURRENT_SOURCE_DIR}constraints/cpRotaryLimitJoint.c
        ${CMAKE_CURRENT_SOURCE_DIR}constraints/cpSimpleMotor.c
        ${CMAKE_CURRENT_SOURCE_DIR}constraints/cpSlideJoint.c
        ${CMAKE_CURRENT_SOURCE_DIR}cpArbiter.c
        ${CMAKE_CURRENT_SOURCE_DIR}cpArray.c
        ${CMAKE_CURRENT_SOURCE_DIR}cpBB.c
        ${CMAKE_CURRENT_SOURCE_DIR}cpBody.c
        ${CMAKE_CURRENT_SOURCE_DIR}cpCollision.c
        ${CMAKE_CURRENT_SOURCE_DIR}cpHashSet.c
        ${CMAKE_CURRENT_SOURCE_DIR}cpPolyShape.c
        ${CMAKE_CURRENT_SOURCE_DIR}cpShape.c
        ${CMAKE_CURRENT_SOURCE_DIR}cpSpace.c
        ${CMAKE_CURRENT_SOURCE_DIR}cpSpaceComponent.c
        ${CMAKE_CURRENT_SOURCE_DIR}cpSpaceHash.c
        ${CMAKE_CURRENT_SOURCE_DIR}cpSpaceQuery.c
        ${CMAKE_CURRENT_SOURCE_DIR}cpSpaceStep.c
        ${CMAKE_CURRENT_SOURCE_DIR}cpVect.c

   )

   add_library (chipmunk STATIC ${CHIPMUNK_SOURCES})
   set_target_properties ( chipmunk PROPERTIES LINKER_LANGUAGE CXX )
   SET_SOURCE_FILES_PROPERTIES ( ${CHIPMUNK_SOURCES} PROPERTIES LANGUAGE CXX )
   target_include_directories (chipmunk PUBLIC ${CHIPMUNK_INCLUDES})
   set_target_properties( chipmunk PROPERTIES FOLDER Third-Party )
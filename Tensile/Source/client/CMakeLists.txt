
#set(CMAKE_CXX_COMPILER ${HIP_HIPCC_EXECUTABLE})

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14" )

set(client_sources
    source/BenchmarkTimer.cpp
    source/CSVStackFile.cpp
    source/ClientProblemFactory.cpp
    source/ConvolutionProblem.cpp
    source/DataInitialization.cpp
    source/HardwareMonitor.cpp
    source/HardwareMonitorListener.cpp
    source/LibraryUpdateReporter.cpp
    source/MetaRunListener.cpp
    source/PerformanceReporter.cpp
    source/ProgressListener.cpp
    source/Reference.cpp
    source/ReferenceValidator.cpp
    source/ResultFileReporter.cpp
    source/ResultReporter.cpp
    source/SolutionIterator.cpp
    source/TimingEvents.cpp
    )

find_package(Boost  COMPONENTS program_options filesystem REQUIRED)

add_library(TensileClient STATIC ${client_sources})

find_package(ROCmSMI QUIET)
if(NOT ROCmSMI_FOUND)
    set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH}" "${Tensile_DIR}" "${Tensile_DIR}/../Source/cmake" "${CMAKE_HOME_DIRECTORY}/cmake")
    find_package(ROCmSMI REQUIRED)
endif()

target_include_directories(TensileClient PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")# "${rocm_smi_root}/include")

target_link_libraries(TensileClient PRIVATE TensileHost ${Boost_LIBRARIES} rocm_smi)
if(TENSILE_USE_OPENMP)
    target_link_libraries(TensileClient PRIVATE custom_openmp_cxx)
endif()

add_executable(tensile_client main.cpp)

target_link_libraries(tensile_client PRIVATE TensileHost TensileClient ${Boost_LIBRARIES})
if(TENSILE_USE_OPENMP)
    target_link_libraries(tensile_client PRIVATE custom_openmp_cxx)
endif()

foreach(arch IN LISTS TENSILE_GPU_ARCHS)
    target_link_libraries(tensile_client PRIVATE "--amdgpu-target=${arch}")
endforeach(arch)

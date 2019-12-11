#!/bin/bash

set -ex
echo && echo "################################################################################" && echo "# Configuring CMake for Client" && echo "################################################################################"
cmake -DTensile_RUNTIME_LANGUAGE=HIP -DTensile_CODE_OBJECT_VERSION=V2 -DTensile_COMPILER=hcc -DTensile_ENABLE_HALF=ON -DTensile_RESUME_BENCHMARK=OFF -DTensile_CLIENT_BENCHMARK=ON -DTENSILE_NEW_CLIENT=OFF  -DCMAKE_BUILD_TYPE=Release -DTensile_MERGE_FILES=ON ../source
echo && echo "################################################################################" && echo "# Building Client" && echo "################################################################################"
cmake --build . --config Release -- -j 8
set +e
#./client --platform-idx 0 --device-idx 0 --init-alpha 1 --init-beta 0 --init-d 0 --init-c 0 --init-a 2 --init-b 2 --c-equal-d 1 --print-valids 0 --print-max 4 --num-benchmarks 1 --num-elements-to-validate 10 --num-enqueues-per-sync 1 --num-syncs-per-benchmark 1 --use-gpu-timer 1 --sleep-percent 200 --benchmark-solutions 0
#./client --platform-idx 0 --device-idx 0 --init-alpha 1 --init-beta 0 --init-d 0 --init-c 0 --init-a 3 --init-b 3 --c-equal-d 1 --print-valids 0 --print-max 4 --num-benchmarks 1 --num-elements-to-validate 10 --num-enqueues-per-sync 1 --num-syncs-per-benchmark 1 --use-gpu-timer 1 --sleep-percent 200 --benchmark-solutions 0
./client --platform-idx 0 --device-idx 0 --init-alpha 1 --init-beta 0 --init-d 0 --init-c 0 --init-a 3 --init-b 3 --c-equal-d 1 --print-valids 0 --print-max 4 --num-benchmarks 20 --num-elements-to-validate 0 --num-enqueues-per-sync 1 --num-syncs-per-benchmark 20 --use-gpu-timer 1 --sleep-percent 0 --benchmark-solutions 0
ERR1=$?
#/mnt/Tensile/Tensile/build/0_Build/client/tensile_client --config-file=/mnt/Tensile/Tensile/build/1_BenchmarkProblems/Cijk_Alik_Bljk_HBH_00/00_Final/build/../source/ClientParameters.ini
ERR2=$?


ERR=0
if [[ $ERR1 -ne 0 ]]
then
    echo one
    ERR=$ERR1
fi
if [[ $ERR2 -ne 0 ]]
then
    echo two
    ERR=$ERR2
fi
exit $ERR

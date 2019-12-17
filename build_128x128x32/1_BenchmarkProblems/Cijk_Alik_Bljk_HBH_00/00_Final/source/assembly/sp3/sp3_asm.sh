#!/bin/bash
CURDIR=$(dirname "$0")
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CURDIR
$CURDIR/mi100_sp3 $CURDIR/$1.sp3 asic=MI9 type=cs -hex $CURDIR/$1.hex
$CURDIR/mi100_sp3 -hex $CURDIR/$1.hex asic=MI9 type=cs  $CURDIR/$1_out.sp3
cat $CURDIR/$1_out.sp3 | grep "// " | grep ": " | sed "s/.*: //" | sed "s/ \([0-9a-f]*\)/, 0x\1/" |sed "s/^/.long 0x/" > $CURDIR/$1.inc
#/opt/rocm/opencl/bin/x86_64/clang -x assembler -target amdgcn-amdhsa -mcpu=gfx906 template.s -o output.co

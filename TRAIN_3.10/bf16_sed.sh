#!/bin/bash
# FP16 to BF16 config yaml converter
# ex: ./bf16_sed.sh FP16.yaml
set -ex
file=$1
sed -i "s/\bDataType.*/DataType: B/g" $file
sed -i "/\bDataType/a \ \ \ \ \ \ DestDataType: B\n      ComputeDataType: s" $file
sed -i "/\(256x256\|128x288\|288x128\|256x144\|144x256\)/d" $file
sed -i "s/        - PrefetchLocalRead: \[2,5,9\]/        - PrefetchLocalRead: \[5,9,17\]/g" $file
sed -i "s/        - LocalReadVectorWidth: \[8\]/        - LocalReadVectorWidth: \[4\]/g" $file
sed -i "s/32, 32, 8, 1/32, 32, 4, 1/g" $file
sed -i "s/32, 32, 4, 2/32, 32, 2, 2/g" $file
sed -i "s/16, 16, 16, 1/16, 16, 8, 1/g" $file
sed -i "s/16, 16, 4, 4/16, 16, 2, 4/g" $file
sed -i "s/ 4,  4,  4,16/ 4,  4,  2,16/g" $file

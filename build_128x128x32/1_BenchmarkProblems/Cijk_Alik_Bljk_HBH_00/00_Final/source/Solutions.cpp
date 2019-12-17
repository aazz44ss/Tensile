/*******************************************************************************
* Copyright (C) 2016-2019 Advanced Micro Devices, Inc. All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell cop-
* ies of the Software, and to permit persons to whom the Software is furnished
* to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all
* copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IM-
* PLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
* FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
* COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
* IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNE-
* CTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*******************************************************************************/

/**************************************************
* This file was generated by Tensile:             *
* https://github.com/ROCmSoftwarePlatform/Tensile *
**************************************************/


#include "Solutions.h"
#include <algorithm>
TensileStatus Cijk_Alik_Bljk_HBH_MT128x128x32_SE_(
    SolutionLock * solutionLock,
    TensileHalf * dataD,
    const TensileHalf * dataC,
    const TensileHalf * dataA,
    const TensileHalf * dataB,
    TensileHalf alpha,
    TensileHalf beta,
    unsigned int strideD1J,
    unsigned int strideD2K,
    unsigned int strideC1J,
    unsigned int strideC2K,
    unsigned int strideA1I,
    unsigned int strideA2K,
    unsigned int strideB1J,
    unsigned int strideB2K,
    unsigned int sizeI,
    unsigned int sizeJ,
    unsigned int sizeK,
    unsigned int sizeL,
    hipStream_t stream,
    unsigned int numInputEvents,
    hipEvent_t * inputEvents,
    hipEvent_t * outputEvent) {
  TensileStatus status;

  /* module function args */
  struct {
    // Size of Tensor's packed dims, in elements
    uint64_t tensor2dSizeC;
    uint64_t tensor2dSizeA;
    uint64_t tensor2dSizeB;
    TensileHalf * dataD;
    const TensileHalf * dataC;
    const TensileHalf * dataA;
    const TensileHalf * dataB;
    TensileHalf alpha[2];
    TensileHalf beta[2];
    unsigned int strideD1J;
    unsigned int strideD2K;
    unsigned int strideC1J;
    unsigned int strideC2K;
    unsigned int strideA1I;
    unsigned int strideA2K;
    unsigned int strideB1J;
    unsigned int strideB2K;
    unsigned int sizeI;
    unsigned int sizeJ;
    unsigned int sizeK;
    unsigned int sizeL;
    int staggerUIter;
    unsigned int problemNumGroupTiles0;
    unsigned int problemNumGroupTiles1;
    unsigned int magicNumberProblemNumGroupTiles0;
    unsigned int gridNumWorkGroups0;
    unsigned int numFullBlocks;
    unsigned int wgmRemainder1;
    unsigned int magicNumberWgmRemainder1;
    unsigned int pad;
  } hipFunctionArgs;
  size_t hipFunctionArgsSize = sizeof(hipFunctionArgs);
  void *hipLaunchParams[] = {HIP_LAUNCH_PARAM_BUFFER_POINTER, &hipFunctionArgs, HIP_LAUNCH_PARAM_BUFFER_SIZE, &hipFunctionArgsSize, HIP_LAUNCH_PARAM_END};
  int deviceId;
  hipGetDevice(&deviceId);

  /* kernels */
  const unsigned int numKernels = 1; // 1 or 4
  hipFunction_t hipFunction;
  status = solutionLock->getFunction(&hipFunction, deviceId, "Cijk_Alik_Bljk_HBH_MT128x128x32_SE_K1", nullptr);;
  if (status) return status;

  /* num kernels */
  unsigned int numEnqueues[numKernels] = { 1 };

  /* grid sizes */
  const unsigned int workDim = 3;
  const unsigned int threadTile[2] = { 8, 4 };
  const unsigned int groupSize[2] = { 16, 32 };
  size_t localWorkSize[3] = { 512, 1, 1 };
  size_t globalWorkSize[numKernels][3];
  globalWorkSize[0][2] = 1;
  globalWorkSize[0][2] *= sizeK;
  unsigned int sizeOfC0 = sizeI;
  unsigned int sizeOfC1 = sizeJ;
  unsigned int macroTile0 = static_cast<unsigned int>(groupSize[0] * threadTile[0]);
  unsigned int macroTile1 = static_cast<unsigned int>(groupSize[1] * threadTile[1]);
  unsigned int totalWorkGroups0 = sizeOfC0 / macroTile0;
  unsigned int totalWorkGroups1 = sizeOfC1 / macroTile1;
  // b/c single kernel, add extra work-group here if edge needed
  if (totalWorkGroups0*macroTile0 < sizeOfC0) { totalWorkGroups0++; }
  if (totalWorkGroups1*macroTile1 < sizeOfC1) { totalWorkGroups1++; }
  unsigned int problemNumGroupTiles0 = totalWorkGroups0;
  unsigned int problemNumGroupTiles1 = totalWorkGroups1;
  const unsigned smallNumMagicShift = 31; // bozo, review
  unsigned magicNumberProblemNumGroupTiles0 = (1L<<smallNumMagicShift) / problemNumGroupTiles0 + 1; // bozo, review
  unsigned numFullBlocks =  problemNumGroupTiles1 / 8; // divide by WorkGroupMapping
  unsigned wgmRemainder1 =  problemNumGroupTiles1 % 8;
  if (wgmRemainder1 == 0) wgmRemainder1 = 8;
  unsigned magicNumberWgmRemainder1 = ((1L<<smallNumMagicShift) / wgmRemainder1 + 1);
  globalWorkSize[0][0] = totalWorkGroups0;
  globalWorkSize[0][1] = totalWorkGroups1;

  /* index sizes */
  unsigned int sizes[numKernels][1][4];
  sizes[0][0][0] = sizeI;
  sizes[0][0][1] = sizeJ;
  sizes[0][0][2] = sizeK;
  sizes[0][0][3] = sizeL;
  uint64_t tensor2dSizeC = 1 * std::max(sizeI, strideC1J) * std::max(sizeJ, strideC2K);
  uint64_t tensor2dSizeA = 1;
  uint64_t tensor2dSizeAStride = 0;
  uint64_t tensor2dSizeAOffset = 0;
  tensor2dSizeAStride = std::max(tensor2dSizeA*sizeL, (uint64_t)strideA1I);
  tensor2dSizeAOffset += tensor2dSizeAStride - tensor2dSizeA*sizeL;
  tensor2dSizeA = tensor2dSizeAStride;
  tensor2dSizeAStride = std::max(tensor2dSizeA*sizeI, (uint64_t)strideA2K);
  tensor2dSizeAOffset += tensor2dSizeAStride - tensor2dSizeA*sizeI;
  tensor2dSizeA = tensor2dSizeAStride;
  tensor2dSizeA -= tensor2dSizeAOffset;

  uint64_t tensor2dSizeB = 1;
  uint64_t tensor2dSizeBStride = 0;
  uint64_t tensor2dSizeBOffset = 0;
  tensor2dSizeBStride = std::max(tensor2dSizeB*sizeL, (uint64_t)strideB1J);
  tensor2dSizeBOffset += tensor2dSizeBStride - tensor2dSizeB*sizeL;
  tensor2dSizeB = tensor2dSizeBStride;
  tensor2dSizeBStride = std::max(tensor2dSizeB*sizeJ, (uint64_t)strideB2K);
  tensor2dSizeBOffset += tensor2dSizeBStride - tensor2dSizeB*sizeJ;
  tensor2dSizeB = tensor2dSizeBStride;
  tensor2dSizeB -= tensor2dSizeBOffset;

  unsigned int staggerUIter = 32; // how many stride-sized clicks to stagger start offset
  int unrollLoopIters = sizeL/32/1; // /DepthU/GSU
  while (staggerUIter>1) {
    if (unrollLoopIters >= (staggerUIter*4)) {
      break;}
    staggerUIter /= 2; // step down to smaller stagger
  }
  if (staggerUIter>=1) staggerUIter -= 1;

  int kernelsLaunched=0;

  /* kernel 0: Cijk_Alik_Bljk_HBH_MT128x128x32_SE_K1 */
  unsigned int kernelIdx = 0;
  for (unsigned int enqueueIdx = 0; enqueueIdx < numEnqueues[0]; enqueueIdx++) {
  try {
    hipFunctionArgs.tensor2dSizeC = tensor2dSizeC;
    hipFunctionArgs.tensor2dSizeA = tensor2dSizeA;
    hipFunctionArgs.tensor2dSizeB = tensor2dSizeB;
    hipFunctionArgs.dataD = dataD;
    hipFunctionArgs.dataC = dataC;
    hipFunctionArgs.dataA = dataA;
    hipFunctionArgs.dataB = dataB;
    hipFunctionArgs.alpha[0] = alpha;
    hipFunctionArgs.alpha[1] = alpha;
    hipFunctionArgs.beta[0] = beta;
    hipFunctionArgs.beta[1] = beta;
    hipFunctionArgs.strideD1J = strideD1J;
    hipFunctionArgs.strideD2K = strideD2K;
    hipFunctionArgs.strideC1J = strideC1J;
    hipFunctionArgs.strideC2K = strideC2K;
    hipFunctionArgs.strideA1I = strideA1I;
    hipFunctionArgs.strideA2K = strideA2K;
    hipFunctionArgs.strideB1J = strideB1J;
    hipFunctionArgs.strideB2K = strideB2K;
    hipFunctionArgs.sizeI = sizes[kernelIdx][enqueueIdx][0];
    hipFunctionArgs.sizeJ = sizes[kernelIdx][enqueueIdx][1];
    hipFunctionArgs.sizeK = sizes[kernelIdx][enqueueIdx][2];
    hipFunctionArgs.sizeL = sizes[kernelIdx][enqueueIdx][3];
    hipFunctionArgs.tensor2dSizeC = tensor2dSizeC;
    hipFunctionArgs.tensor2dSizeA = tensor2dSizeA;
    hipFunctionArgs.tensor2dSizeB = tensor2dSizeB;
    hipFunctionArgs.staggerUIter = staggerUIter;

    hipFunctionArgs.problemNumGroupTiles0 = problemNumGroupTiles0;
    hipFunctionArgs.problemNumGroupTiles1 = problemNumGroupTiles1;
    hipFunctionArgs.magicNumberProblemNumGroupTiles0 = magicNumberProblemNumGroupTiles0;
    hipFunctionArgs.gridNumWorkGroups0 = globalWorkSize[kernelIdx][0];
    hipFunctionArgs.numFullBlocks = numFullBlocks;
    hipFunctionArgs.wgmRemainder1 = wgmRemainder1;
    hipFunctionArgs.magicNumberWgmRemainder1 = magicNumberWgmRemainder1;
    kernelsLaunched++;
    hipExtModuleLaunchKernel(
      hipFunction,
      globalWorkSize[kernelIdx][0]*localWorkSize[0],
      globalWorkSize[kernelIdx][1]*localWorkSize[1],
      globalWorkSize[kernelIdx][2]*localWorkSize[2],
      localWorkSize[0],
      localWorkSize[1],
      localWorkSize[2],
      0, // groupMemBytes
      stream,
      NULL,
      (void**)hipLaunchParams
      ,(inputEvents && kernelsLaunched==1) ? inputEvents[enqueueIdx]:nullptr
      ,outputEvent ? outputEvent[enqueueIdx]:nullptr
      );
  } catch (const std::exception& e) {
#ifdef DEBUG
    std::cerr << e.what() << std::endl;
#endif
    return tensileStatusFailure;
  }
  }

  return tensileStatusSuccess;
}

/* Solution Parameters
  ProblemType: Cijk_Alik_Bljk_HBH
  AggressivePerfMode: 1
  AssertFree0ElementMultiple: 8
  AssertFree1ElementMultiple: 1
  AssertSummationElementMultiple: 8
  AssignedDerivedParameters: False
  AssignedProblemIndependentDerivedParameters: True
  BufferLoad: True
  BufferStore: True
  CheckDimOverflow: 0
  CheckTensorDimAsserts: False
  DepthU: 32
  DirectToLds: False
  DirectToLdsA: False
  DirectToLdsB: False
  DisableAtomicFail: 0
  DisableKernelPieces: 0
  EdgeType: ShiftPtr
  ExpandPointerSwap: True
  FractionalLoad: 0
  GlobalLoadVectorWidthA: 4
  GlobalLoadVectorWidthB: 4
  GlobalRead2A: True
  GlobalRead2B: True
  GlobalReadCoalesceGroupA: True
  GlobalReadCoalesceGroupB: True
  GlobalReadCoalesceVectorA: True
  GlobalReadCoalesceVectorB: True
  GlobalReadVectorWidth: 4
  GlobalSplitU: 1
  GlobalSplitUSummationAssignmentRoundRobin: True
  GlobalSplitUWorkGroupMappingRoundRobin: False
  GlobalWriteVectorWidth: 4
  GuaranteeNoPartialA: True
  GuaranteeNoPartialB: True
  ISA: [9, 0, 8]
  InnerUnroll: 1
  InterleaveAlpha: 0
  KernelLanguage: Assembly
  LSCA: 32
  LSCB: 32
  LSPA: 64
  LSPB: 64
  LVCA: 8
  LVCB: 8
  LVPA: 16
  LVPB: 16
  LdcEqualsLdd: True
  LdsNumElements: 16384
  LdsNumElementsAlignedA: 4096
  LdsNumElementsAlignedB: 4096
  LdsOffsetA: 0
  LdsOffsetA_Blk: 8192
  LdsOffsetB: 4096
  LdsOffsetB_Blk: 12288
  LdsPadA: 0
  LdsPadB: 0
  LocalDotLayout: 1
  LocalRead2A: True
  LocalRead2B: True
  LocalSplitU: 1
  LocalWrite2A: True
  LocalWrite2B: True
  LocalWriteUseSgprA: False
  LocalWriteUseSgprB: False
  LoopDoWhile: False
  LoopTail: True
  LoopUnroll: 32
  MacroTile0: 128
  MacroTile1: 128
  MacroTileA: 128
  MacroTileB: 128
  MacroTileShapeMax: 64
  MacroTileShapeMin: 1
  MaxOccupancy: 40
  MaxVgprNumber: 256
  MinVgprNumber: 0
  NonTemporalA: 0
  NonTemporalB: 0
  NonTemporalC: 0
  NumElementsPerThread: 32
  NumGlobalWriteVectorsPerThread: 8
  NumLoadsA: 2
  NumLoadsB: 2
  NumLoadsCoalescedA: 1
  NumLoadsCoalescedB: 1
  NumLoadsPerpendicularA: 2
  NumLoadsPerpendicularB: 2
  NumThreads: 512
  OptNoLoadLoop: 1
  PackBatchDims: 0
  PackFreeDims: 1
  PackGranularity: 2
  PackedC0IdxChars: ['I']
  PackedC0IndicesX: [0]
  PackedC1IdxChars: ['J']
  PackedC1IndicesX: [1]
  PerformanceSyncLocation: -1
  PerformanceWaitCount: -1
  PerformanceWaitLocation: -1
  PersistentKernel: 0
  PrefetchAcrossPersistent: 0
  PrefetchGlobalRead: True
  PrefetchLocalRead: True
  ProblemType: Cijk_Alik_Bljk_HBH
  ReplacementKernel: True
  ScheduleGlobalRead: 1
  ScheduleIterAlg: 1
  ScheduleLocalWrite: 1
  StaggerU: 32
  StaggerUMapping: 0
  StaggerUStride: 256
  SubGroup0: 16
  SubGroup1: 32
  SubGroupA: 16
  SubGroupB: 32
  SuppressNoLoadLoop: False
  ThreadTile: [8, 4]
  ThreadTile0: 8
  ThreadTile1: 4
  ThreadTileA: 8
  ThreadTileB: 4
  UnrollMemFence: False
  UseSgprForGRO: 1
  Valid: True
  VectorAtomicWidth: 2
  VectorStore: True
  VectorWidth: 4
  WorkGroup: [16, 32, 1]
  WorkGroupMapping: 8
  WorkGroupMappingType: B
  _staggerStrideShift: 2
*/


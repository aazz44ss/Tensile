
/******************************************/
/* Function Prefix                        */
/******************************************/



/******************************************/
/* Begin Kernel                           */
/******************************************/

.hsa_code_object_version 2,0
.hsa_code_object_isa 9, 0, 8, "AMD", "AMDGPU"
.text
.protected Cijk_Alik_Bljk_HBH_MT128x128x32_SE_K1
.globl Cijk_Alik_Bljk_HBH_MT128x128x32_SE_K1
.p2align 8
.type Cijk_Alik_Bljk_HBH_MT128x128x32_SE_K1,@function
.amdgpu_hsa_kernel Cijk_Alik_Bljk_HBH_MT128x128x32_SE_K1
Cijk_Alik_Bljk_HBH_MT128x128x32_SE_K1:
.amd_kernel_code_t
  is_ptr64 = 1
  enable_sgpr_kernarg_segment_ptr = 1
  kernarg_segment_byte_size = 148 // bytes of kern args
  workitem_vgpr_count = 108 // vgprs
  wavefront_sgpr_count = 98 // sgprs
  compute_pgm_rsrc1_vgprs = 26 // floor((63-1)/4)
  compute_pgm_rsrc1_sgprs = 12 // floor((98-1)/8)
  compute_pgm_rsrc2_tidig_comp_cnt = 0 // 1D wg
  compute_pgm_rsrc2_tgid_x_en = 1 // wg.x
  compute_pgm_rsrc2_tgid_y_en = 1 // wg.y
  compute_pgm_rsrc2_tgid_z_en = 1 // wg.z
  workgroup_group_segment_byte_size = 34816// lds bytes
  compute_pgm_rsrc2_user_sgpr = 2 // vcc
  kernarg_segment_alignment = 4
  group_segment_alignment = 4
  private_segment_alignment = 4
.end_amd_kernel_code_t

/******************************************/
/* Optimizations and Config:              */
/******************************************/
/* ThreadTile= 4 x 8 */
/* SubGroup= 16 x 16 */
/* VectorWidth=4 */
/* GlobalLoadVectorWidthA=4, GlobalLoadVectorWidthB=4 */
/* DirectToLdsA=False */
/* DirectToLdsB=False */
/* UseSgprForGRO=1 */
.amd_amdgpu_hsa_metadata
Version: [ 1, 0 ]
Kernels:
  - Name: Cijk_Alik_Bljk_HBH_MT128x128x32_SE_K1
    SymbolName: 'Cijk_Alik_Bljk_HBH_MT128x128x32_SE_K1@kd'
    Language: OpenCL C
    LanguageVersion: [ 2, 0 ]
    Args:
      - Name:            sizeC
        Size:            8
        Align:           8
        ValueKind:       ByValue
        ValueType:       I64
      - Name:            sizeA
        Size:            8
        Align:           8
        ValueKind:       ByValue
        ValueType:       I64
      - Name:            sizeB
        Size:            8
        Align:           8
        ValueKind:       ByValue
        ValueType:       I64
      - Name:            D
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       Struct
        AddrSpaceQual:   Generic
      - Name:            C
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       Struct
        AddrSpaceQual:   Generic
      - Name:            A
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       Struct
        AddrSpaceQual:   Generic
      - Name:            B
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       Struct
        AddrSpaceQual:   Generic
      - Name:            alpha
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       F32
      - Name:            beta
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       F32
      - Name:            strideD0
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            strideD1
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            strideC0
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            strideC1
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            strideA0
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            strideA1
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            strideB0
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            strideB1
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            SizesFree0
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            SizesFree1
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            SizesFree2
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            SizesSum0
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            OrigStaggerUIter
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       I32
      - Name:            NumWorkGroups0
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            NumWorkGroups1
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            NumFullBlocks
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            WgmRemainder1
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
      - Name:            MagicNumberWgmRemainder1
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       U32
    CodeProps:
      KernargSegmentSize: 148
      GroupSegmentFixedSize: 28672
      PrivateSegmentFixedSize: 0
      KernargSegmentAlign:  8
      WavefrontSize:        64
      NumSGPRs:             98
      NumVGPRs:             108
      MaxFlatWorkGroupSize: 256
.end_amd_amdgpu_hsa_metadata

/******************************************/
/* Asm syntax workarounds                 */
/******************************************/
.macro _v_add_co_u32 dst, cc, src0, src1, dpp=
   v_add_co_u32 \dst, \cc, \src0, \src1 \dpp
.endm

.macro _v_add_u32 dst, src0, src1, dpp=
   v_add_u32 \dst, \src0, \src1 \dpp
.endm

.macro _v_sub_co_u32 dst, cc, src0, src1, dpp=
   v_sub_co_u32 \dst, \cc, \src0, \src1 \dpp
.endm

.macro _v_sub_u32 dst, src0, src1, dpp=
   v_sub_u32 \dst, \src0, \src1 \dpp
.endm

.macro _v_addc_co_u32 dst, ccOut, src0, ccIn, src1, dpp=
   v_addc_co_u32 \dst, \ccOut, \src0, \ccIn, \src1 \dpp
.endm

.macro _v_add_lshl_u32 dst, src0, src1, shiftCnt
    v_add_lshl_u32 \dst, \src0, \src1, \shiftCnt
.endm

.macro _v_lshl_add_u32 dst, src0, src1, shiftCnt
    v_lshl_add_u32 \dst, \src0, \src1, \shiftCnt
.endm

/******************************************/
/* Magic div and mod functions            */
/******************************************/
.macro V_MAGIC_DIV dstIdx, dividend, magicNumber, magicShift
    v_mul_hi_u32 v[\dstIdx+1], \dividend, \magicNumber
    v_mul_lo_u32 v[\dstIdx+0], \dividend, \magicNumber
    v_lshrrev_b64 v[\dstIdx:\dstIdx+1], \magicShift, v[\dstIdx:\dstIdx+1]
.endm

/******************************************/
/* VGPR Assignments                       */
/******************************************/
.set vgprValuC, 0
/* ValuA/B   Xn=PLR buffer idx,  In=InnerUnroll idx */
.set vgprValuA_X0_I0, 32
.set vgprValuA_X1_I0, 34
.set vgprG2LA, 36
.set vgprValuB_X0_I0, 40
.set vgprValuB_X1_I0, 44
.set vgprG2LB, 48
.set vgprLocalWriteAddrA, 56
.set vgprLocalWriteAddrB, 57
.set vgprGlobalReadOffsetA, 58
.set vgprGlobalReadOffsetB, 59
.set vgprLocalReadAddrA, 60
.set vgprLocalReadAddrB, 61
.set vgprSerial, 62
/* Num VGPR=63 */

/******************************************/
/* SGPR Assignments                       */
/******************************************/
.set sgprKernArgAddress, 0
.set sgprWorkGroup0, 2
.set sgprWorkGroup1, 3
.set sgprWorkGroup2, 4
.set sgprNumWorkGroups0, 5
.set sgprNumWorkGroups1, 6
.set sgprSrdA, 8
.set sgprSrdB, 12
.set sgprSrdD, 16
.set sgprSrdC, 20
.set sgprTensor2dSizeC, 24
.set sgprTensor2dSizeA, 26
.set sgprTensor2dSizeB, 28
.set sgprSaveExecMask, 30
.set sgprAddressD, 32
.set sgprAddressC, 34
.set sgprStridesD, 36
.set sgprStridesC, 38
.set sgprAlpha, 40
.set sgprBeta, 41
.set sgprSizesFree, 42
.set sgprSizesSum, 45
.set sgprLoopCounters, 46
.set sgprOrigLoopCounter, 47
.set sgprStridesA, 48
.set sgprStridesB, 50
.set sgprAddressA, 52
.set sgprAddressB, 54
.set sgprShadowLimitA, 56
.set sgprShadowLimitB, 58
.set sgprOrigStaggerUIter, 60
.set sgprStaggerUIter, 61
.set sgprWrapUA, 62
.set sgprWrapUB, 64
.set sgprNumFullBlocks, 66
.set sgprWgmRemainder1, 67
.set sgprMagicNumberWgmRemainder1, 68
.set sgprGlobalReadIncsA, 69
.set sgprGlobalReadIncsB, 70
.set sgprScalarGlobalReadOffsetA, 71
.set sgprScalarGlobalReadOffsetB, 72
/* max SGPR=98 */

/* Size Assignments */
.set sgprSizeD0I, sgprSizesFree+0
.set sgprSizeD1J, sgprSizesFree+1
.set sgprSizeDK, sgprSizesFree+2
.set sgprSizeC0I, sgprSizesFree+0
.set sgprSizeC1J, sgprSizesFree+1
.set sgprSizeCK, sgprSizesFree+2
.set sgprSizeAL, sgprSizesSum+0
.set sgprSizeA0I, sgprSizesFree+0
.set sgprSizeAK, sgprSizesFree+2
.set sgprSizeBL, sgprSizesSum+0
.set sgprSizeB1J, sgprSizesFree+1
.set sgprSizeBK, sgprSizesFree+2

/* Stride Assignments */
.set constStrideD0I, 1
.set sgprStrideD1J, sgprStridesD+0
.set sgprStrideDK, sgprStridesD+1
.set constStrideC0I, 1
.set sgprStrideC1J, sgprStridesC+0
.set sgprStrideCK, sgprStridesC+1
.set constStrideAL, 1
.set sgprStrideA0I, sgprStridesA+0
.set sgprStrideAK, sgprStridesA+1
.set constStrideBL, 1
.set sgprStrideB1J, sgprStridesB+0
.set sgprStrideBK, sgprStridesB+1

.set DepthU, 32
/* Number of elements to shift-left SRD */
.set SrdShiftLeftA, 4
.set SrdShiftLeftB, 4
/* 2GB limit - set offsets to -1 to exceed this and clamp */
.set BufferLimit, 0x80000000
/* Bits 127:96 of SRD.  Set DataFormat = 32 bit */
.set Srd127_96, 0x0020000
.set BufferOOB, 0x80000000

/* Global Offset A */
.macro GLOBAL_OFFSET_A vgprAddr vgprOffsetL vgprOffset0I vgprTmp
v_mul_lo_u32 v[\vgprTmp+0], s[sgprStrideA0I], v[\vgprOffset0I] // mul d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, v[\vgprOffsetL], v[\vgprTmp+0] // accumulate d1 lower
_v_add_u32 v[\vgprAddr+0], 0x4, v[\vgprAddr+0]     // add prepad for pointer shift
v_lshlrev_b32 v[\vgprAddr+0], 0x1, v[\vgprAddr+0]  // offset *= bytes/element
.endm

/* Global Offset B */
.macro GLOBAL_OFFSET_B vgprAddr vgprOffsetL vgprOffset1J vgprTmp
v_mul_lo_u32 v[\vgprTmp+0], s[sgprStrideB1J], v[\vgprOffset1J] // mul d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, v[\vgprOffsetL], v[\vgprTmp+0] // accumulate d1 lower
_v_add_u32 v[\vgprAddr+0], 0x4, v[\vgprAddr+0]     // add prepad for pointer shift
v_lshlrev_b32 v[\vgprAddr+0], 0x1, v[\vgprAddr+0]  // offset *= bytes/element
.endm

/******************************************/
/* Dynamic Scalar Divide: vQuotient=vDividend/vDivisor; vRemainder=vDividend%vDivisor; */
/******************************************/
.macro DYNAMIC_VECTOR_DIVIDE vQuotient vRemainder vDividend vDivisor vTmp0 vTmp1 sTmp
v_cvt_f32_u32 v[\vQuotient], v[\vDivisor]          //
v_rcp_f32 v[\vQuotient], v[\vQuotient]             //
v_mul_f32 v[\vQuotient], 0x4f800000, v[\vQuotient] //
v_cvt_u32_f32 v[\vQuotient], v[\vQuotient]         //
v_mul_lo_u32 v[\vRemainder], v[\vDivisor], v[\vQuotient] //
v_mul_hi_u32 v[\vTmp0], v[\vDivisor], v[\vQuotient] //
_v_sub_co_u32 v[\vTmp1], vcc, 0x0, v[\vRemainder]  //
v_cmp_ne_i32 s[\sTmp:\sTmp+1], 0x0, v[\vTmp0]      //
v_cndmask_b32 v[\vRemainder], v[\vTmp1], v[\vRemainder], s[\sTmp:\sTmp+1] //
v_mul_hi_u32 v[\vRemainder], v[\vRemainder], v[\vQuotient] //
_v_sub_co_u32 v[\vTmp0], vcc, v[\vQuotient], v[\vRemainder] //
_v_add_co_u32 v[\vQuotient], vcc, v[\vQuotient], v[\vRemainder] //
v_cndmask_b32 v[\vQuotient], v[\vQuotient], v[\vTmp0], s[\sTmp:\sTmp+1] //
v_mul_hi_u32 v[\vQuotient], v[\vQuotient], v[\vDividend] //
v_mul_lo_u32 v[\vRemainder], v[\vQuotient], v[\vDivisor] //
_v_sub_co_u32 v[\vTmp0], vcc, v[\vDividend], v[\vRemainder] //
v_cmp_ge_u32 s[\sTmp:\sTmp+1], v[\vDividend], v[\vRemainder] //
_v_add_co_u32 v[\vRemainder], vcc, 0x1, v[\vQuotient] //
_v_add_co_u32 v[\vTmp1], vcc, -1, v[\vQuotient]    //
v_cmp_le_u32 vcc, v[\vDivisor], v[\vTmp0]          //
s_and_b64 vcc, s[\sTmp:\sTmp+1], vcc               //
v_cndmask_b32 v[\vQuotient], v[\vQuotient], v[\vRemainder], vcc //
v_cndmask_b32 v[\vQuotient], v[\vTmp1], v[\vQuotient], s[\sTmp:\sTmp+1] //
v_cmp_ne_i32 vcc, 0x0, v[\vDivisor]                //
v_cndmask_b32 v[\vQuotient], -1, v[\vQuotient], vcc // final result
v_mul_lo_u32 v[\vRemainder], v[\vQuotient], v[\vDivisor] //
_v_sub_co_u32 v[\vRemainder], vcc, v[\vDividend], v[\vRemainder] // final result
.endm

/******************************************/
/* 4x8 thread-tile                        */
/******************************************/
.macro MAC_4x8_X0
v_fma_mix_f32 v[vgprValuC+0*2+0*4*2+0*2+0], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], v[vgprValuC+0*2+0*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[0] iui=0
s_setprio 1 // Raise priority while processing macs
v_fma_mix_f32 v[vgprValuC+0*2+0*4*2+0*2+1], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], v[vgprValuC+0*2+0*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[1]
v_fma_mix_f32 v[vgprValuC+0*2+0*4*2+2*2+0], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], v[vgprValuC+0*2+0*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[4]
v_fma_mix_f32 v[vgprValuC+0*2+0*4*2+2*2+1], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+0], v[vgprValuC+0*2+0*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[5]
v_fma_mix_f32 v[vgprValuC+1*2+0*4*2+0*2+0], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0], v[vgprValuC+1*2+0*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[2] iui=0
v_fma_mix_f32 v[vgprValuC+1*2+0*4*2+0*2+1], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0], v[vgprValuC+1*2+0*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[3]
v_fma_mix_f32 v[vgprValuC+1*2+0*4*2+2*2+0], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0], v[vgprValuC+1*2+0*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[6]
v_fma_mix_f32 v[vgprValuC+1*2+0*4*2+2*2+1], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0], v[vgprValuC+1*2+0*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[7]
v_fma_mix_f32 v[vgprValuC+0*2+1*4*2+0*2+0], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+1], v[vgprValuC+0*2+1*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[8] iui=0
v_fma_mix_f32 v[vgprValuC+0*2+1*4*2+0*2+1], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+1], v[vgprValuC+0*2+1*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[9]
v_fma_mix_f32 v[vgprValuC+0*2+1*4*2+2*2+0], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+1], v[vgprValuC+0*2+1*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[12]
v_fma_mix_f32 v[vgprValuC+0*2+1*4*2+2*2+1], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+1], v[vgprValuC+0*2+1*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[13]
v_fma_mix_f32 v[vgprValuC+1*2+1*4*2+0*2+0], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+1], v[vgprValuC+1*2+1*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[10] iui=0
v_fma_mix_f32 v[vgprValuC+1*2+1*4*2+0*2+1], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+1], v[vgprValuC+1*2+1*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[11]
v_fma_mix_f32 v[vgprValuC+1*2+1*4*2+2*2+0], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+1], v[vgprValuC+1*2+1*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[14]
v_fma_mix_f32 v[vgprValuC+1*2+1*4*2+2*2+1], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+1], v[vgprValuC+1*2+1*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[15]
v_fma_mix_f32 v[vgprValuC+0*2+2*4*2+0*2+0], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+2], v[vgprValuC+0*2+2*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[16] iui=0
v_fma_mix_f32 v[vgprValuC+0*2+2*4*2+0*2+1], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+2], v[vgprValuC+0*2+2*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[17]
v_fma_mix_f32 v[vgprValuC+0*2+2*4*2+2*2+0], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+2], v[vgprValuC+0*2+2*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[20]
v_fma_mix_f32 v[vgprValuC+0*2+2*4*2+2*2+1], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+2], v[vgprValuC+0*2+2*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[21]
v_fma_mix_f32 v[vgprValuC+1*2+2*4*2+0*2+0], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+2], v[vgprValuC+1*2+2*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[18] iui=0
v_fma_mix_f32 v[vgprValuC+1*2+2*4*2+0*2+1], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+2], v[vgprValuC+1*2+2*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[19]
v_fma_mix_f32 v[vgprValuC+1*2+2*4*2+2*2+0], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+2], v[vgprValuC+1*2+2*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[22]
v_fma_mix_f32 v[vgprValuC+1*2+2*4*2+2*2+1], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+2], v[vgprValuC+1*2+2*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[23]
v_fma_mix_f32 v[vgprValuC+0*2+3*4*2+0*2+0], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+3], v[vgprValuC+0*2+3*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[24] iui=0
v_fma_mix_f32 v[vgprValuC+0*2+3*4*2+0*2+1], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+3], v[vgprValuC+0*2+3*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[25]
v_fma_mix_f32 v[vgprValuC+0*2+3*4*2+2*2+0], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+3], v[vgprValuC+0*2+3*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[28]
v_fma_mix_f32 v[vgprValuC+0*2+3*4*2+2*2+1], v[vgprValuA_X0_I0+0], v[vgprValuB_X0_I0+3], v[vgprValuC+0*2+3*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[29]
v_fma_mix_f32 v[vgprValuC+1*2+3*4*2+0*2+0], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+3], v[vgprValuC+1*2+3*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[26] iui=0
v_fma_mix_f32 v[vgprValuC+1*2+3*4*2+0*2+1], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+3], v[vgprValuC+1*2+3*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[27]
v_fma_mix_f32 v[vgprValuC+1*2+3*4*2+2*2+0], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+3], v[vgprValuC+1*2+3*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[30]
v_fma_mix_f32 v[vgprValuC+1*2+3*4*2+2*2+1], v[vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+3], v[vgprValuC+1*2+3*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[31]
s_setprio 0 // Reset priority after macs
.endm
.macro MAC_4x8_X1
v_fma_mix_f32 v[vgprValuC+0*2+0*4*2+0*2+0], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], v[vgprValuC+0*2+0*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[0] iui=0
s_setprio 1 // Raise priority while processing macs
v_fma_mix_f32 v[vgprValuC+0*2+0*4*2+0*2+1], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], v[vgprValuC+0*2+0*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[1]
v_fma_mix_f32 v[vgprValuC+0*2+0*4*2+2*2+0], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], v[vgprValuC+0*2+0*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[4]
v_fma_mix_f32 v[vgprValuC+0*2+0*4*2+2*2+1], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+0], v[vgprValuC+0*2+0*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[5]
v_fma_mix_f32 v[vgprValuC+1*2+0*4*2+0*2+0], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+0], v[vgprValuC+1*2+0*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[2] iui=0
v_fma_mix_f32 v[vgprValuC+1*2+0*4*2+0*2+1], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+0], v[vgprValuC+1*2+0*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[3]
v_fma_mix_f32 v[vgprValuC+1*2+0*4*2+2*2+0], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+0], v[vgprValuC+1*2+0*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[6]
v_fma_mix_f32 v[vgprValuC+1*2+0*4*2+2*2+1], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+0], v[vgprValuC+1*2+0*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[7]
v_fma_mix_f32 v[vgprValuC+0*2+1*4*2+0*2+0], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+1], v[vgprValuC+0*2+1*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[8] iui=0
v_fma_mix_f32 v[vgprValuC+0*2+1*4*2+0*2+1], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+1], v[vgprValuC+0*2+1*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[9]
v_fma_mix_f32 v[vgprValuC+0*2+1*4*2+2*2+0], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+1], v[vgprValuC+0*2+1*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[12]
v_fma_mix_f32 v[vgprValuC+0*2+1*4*2+2*2+1], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+1], v[vgprValuC+0*2+1*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[13]
v_fma_mix_f32 v[vgprValuC+1*2+1*4*2+0*2+0], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+1], v[vgprValuC+1*2+1*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[10] iui=0
v_fma_mix_f32 v[vgprValuC+1*2+1*4*2+0*2+1], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+1], v[vgprValuC+1*2+1*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[11]
v_fma_mix_f32 v[vgprValuC+1*2+1*4*2+2*2+0], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+1], v[vgprValuC+1*2+1*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[14]
v_fma_mix_f32 v[vgprValuC+1*2+1*4*2+2*2+1], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+1], v[vgprValuC+1*2+1*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[15]
v_fma_mix_f32 v[vgprValuC+0*2+2*4*2+0*2+0], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+2], v[vgprValuC+0*2+2*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[16] iui=0
v_fma_mix_f32 v[vgprValuC+0*2+2*4*2+0*2+1], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+2], v[vgprValuC+0*2+2*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[17]
v_fma_mix_f32 v[vgprValuC+0*2+2*4*2+2*2+0], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+2], v[vgprValuC+0*2+2*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[20]
v_fma_mix_f32 v[vgprValuC+0*2+2*4*2+2*2+1], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+2], v[vgprValuC+0*2+2*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[21]
v_fma_mix_f32 v[vgprValuC+1*2+2*4*2+0*2+0], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+2], v[vgprValuC+1*2+2*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[18] iui=0
v_fma_mix_f32 v[vgprValuC+1*2+2*4*2+0*2+1], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+2], v[vgprValuC+1*2+2*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[19]
v_fma_mix_f32 v[vgprValuC+1*2+2*4*2+2*2+0], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+2], v[vgprValuC+1*2+2*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[22]
v_fma_mix_f32 v[vgprValuC+1*2+2*4*2+2*2+1], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+2], v[vgprValuC+1*2+2*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[23]
v_fma_mix_f32 v[vgprValuC+0*2+3*4*2+0*2+0], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+3], v[vgprValuC+0*2+3*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[24] iui=0
v_fma_mix_f32 v[vgprValuC+0*2+3*4*2+0*2+1], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+3], v[vgprValuC+0*2+3*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[25]
v_fma_mix_f32 v[vgprValuC+0*2+3*4*2+2*2+0], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+3], v[vgprValuC+0*2+3*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[28]
v_fma_mix_f32 v[vgprValuC+0*2+3*4*2+2*2+1], v[vgprValuA_X1_I0+0], v[vgprValuB_X1_I0+3], v[vgprValuC+0*2+3*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[29]
v_fma_mix_f32 v[vgprValuC+1*2+3*4*2+0*2+0], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+3], v[vgprValuC+1*2+3*4*2+0*2+0] op_sel:[0,0,0] op_sel_hi:[1,1,0] //ValuC[26] iui=0
v_fma_mix_f32 v[vgprValuC+1*2+3*4*2+0*2+1], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+3], v[vgprValuC+1*2+3*4*2+0*2+1] op_sel:[1,0,0] op_sel_hi:[1,1,0] //ValuC[27]
v_fma_mix_f32 v[vgprValuC+1*2+3*4*2+2*2+0], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+3], v[vgprValuC+1*2+3*4*2+2*2+0] op_sel:[0,1,0] op_sel_hi:[1,1,0] //ValuC[30]
v_fma_mix_f32 v[vgprValuC+1*2+3*4*2+2*2+1], v[vgprValuA_X1_I0+1], v[vgprValuB_X1_I0+3], v[vgprValuC+1*2+3*4*2+2*2+1] op_sel:[1,1,0] op_sel_hi:[1,1,0] //valuC[31]
s_setprio 0 // Reset priority after macs
.endm




/***** program start from here *****/

.long 0xC00A0D00, 0x00000028
.long 0xC00A0D00, 0x00000028
.long 0xC00A0C00, 0x00000050
.long 0xC00A0600, 0x00000008
.long 0xC0020B40, 0x0000006C
.long 0xBEFC00FF, 0x00006600
.long 0x7EC80300
.long 0x26CA00BF
.long 0x2004C886
.long 0xB8D0F804
.long 0xD1130004, 0x0000A0B0
.long 0x20CC0884
.long 0x7EA40566
.long 0xD1130067, 0x0000A08F
.long 0x7EA20567
.long 0xC0020140, 0x00000074
.long 0xBF8CC07F
.long 0x86580383
.long 0x92580558
.long 0x81580258
.long 0x8F598258
.long 0xBE820059
.long 0x86595883
.long 0x8F5A8203
.long 0x8E5A825A
.long 0x81595A59
.long 0xBE830059
.long 0xBF068151
.long 0xBF8400C3
.long 0xBF8CC07F
.long 0xBE880034
.long 0xBE890035
.long 0xBE8B00FF, 0x00020000
.long 0xBE8A00FF, 0x80000000
.long 0x9254FF30, 0x00000080
.long 0x92545402
.long 0x9255A052
.long 0x92533055
.long 0x81545354
.long 0x2000CA82
.long 0xD2850004, 0x00020030
.long 0x2602CA83
.long 0x24020283
.long 0x32A40304
.long 0x68A4A454
.long 0x24A4A481
.long 0x8E478530
.long 0x68A6A447
.long 0xBECC00FF, 0x00000880
.long 0x924C4C52
.long 0xBE8C0036
.long 0xBE8D0037
.long 0xBE8F00FF, 0x00020000
.long 0xBE8E00FF, 0x80000000
.long 0x9254FF32, 0x00000080
.long 0x92545403
.long 0x9255A052
.long 0x92533255
.long 0x81545354
.long 0x2004CA82
.long 0xD2850004, 0x00020432
.long 0x2606CA83
.long 0x24060683
.long 0x32AC0704
.long 0x68ACAC54
.long 0x24ACAC81
.long 0x8E4A8532
.long 0x68AEAC4A
.long 0xBECE00FF, 0x00000880
.long 0x924E4E52
.long 0x814EFF4E, 0x00004400
.long 0xBF8A0000
.long 0x814DFF4C, 0x00002200
.long 0x2498CA84
.long 0x6898984C
.long 0x249ACA84
.long 0x689A9A4D
.long 0x814FFF4E, 0x00002200
.long 0x249CCA84
.long 0x689C9C4E
.long 0x249ECA84
.long 0x689E9E4F
.long 0x2002CA83
.long 0xD2850001, 0x00020288
.long 0x68989901
.long 0x689A9B01
.long 0x689C9D01
.long 0x689E9F01
.long 0xD1340054, 0x00018152
.long 0xD1340055, 0x00018153
.long 0xD1340058, 0x00018156
.long 0xD1340059, 0x00018157
.long 0xE05C1000, 0x80022052
.long 0xE05C1000, 0x80022453
.long 0xE05C1000, 0x80033457
.long 0xE05C1000, 0x80033056
.long 0xE05C1000, 0x80022854
.long 0xE05C1000, 0x80022C55
.long 0xE05C1000, 0x80033C59
.long 0xE05C1000, 0x80033858
.long 0x68A4A4FF, 0x00000080
.long 0x68A6A6FF, 0x00000080
.long 0x68ACACFF, 0x00000080
.long 0x68AEAEFF, 0x00000080
.long 0x8F2E852D
.long 0x80AE2E80
.long 0xBF06802E
.long 0xBF85003F
.long 0xBF8C0F76
.long 0xD9BE0000, 0x0000204C
.long 0xD9BE0440, 0x0000244C
.long 0xBF8C0F74
.long 0xD9BE0000, 0x0000304E
.long 0xD9BE0440, 0x0000344E
.long 0xBF8CC27F
.long 0xE05C1000, 0x80022052
.long 0xE05C1000, 0x80022453
.long 0xBF8CC07F
.long 0xE05C1000, 0x80033056
.long 0xE05C1000, 0x80033457
.long 0xBF8F0001
.long 0x68A4A4FF, 0x00000080
.long 0x68A6A6FF, 0x00000080
.long 0x68ACACFF, 0x00000080
.long 0x68AEAEFF, 0x00000080
.long 0x68A8A8FF, 0x00000080
.long 0x68AAAAFF, 0x00000080
.long 0x68B0B0FF, 0x00000080
.long 0x68B2B2FF, 0x00000080
.long 0xBF8F0000
.long 0xBF8C0F76
.long 0xD9BE0000, 0x0000284D
.long 0xD9BE0440, 0x00002C4D
.long 0xBF8C0F74
.long 0xD9BE0000, 0x0000384F
.long 0xD9BE0440, 0x00003C4F
.long 0xBF8CC27F
.long 0xE05C1000, 0x80022854
.long 0xE05C1000, 0x80022C55
.long 0xBF8CC07F
.long 0xBF8A0000
.long 0xE05C1000, 0x80033858
.long 0xE05C1000, 0x80033C59
.long 0xBF8A0000
.long 0x802E822E
.long 0xBF00C22E
.long 0xBF84FFC1
.long 0xBF8C0F76
.long 0xD9BE0000, 0x0000204C
.long 0xD9BE0440, 0x0000244C
.long 0xBF8C0F74
.long 0xD9BE0000, 0x0000304E
.long 0xD9BE0440, 0x0000344E
.long 0xBF8C0F72
.long 0xD9BE0000, 0x0000284D
.long 0xD9BE0440, 0x00002C4D
.long 0xBF8C0F70
.long 0xD9BE0000, 0x0000384F
.long 0xD9BE0440, 0x00003C4F
.long 0xBF8CC07F
.long 0xBF8A0000
.long 0xBF810000
.long 0xD3D94000, 0x18000080
.long 0xD3D94001, 0x18000080
.long 0xD3D94002, 0x18000080
.long 0xD3D94003, 0x18000080
.long 0xD3D94004, 0x18000080
.long 0xD3D94005, 0x18000080
.long 0xD3D94006, 0x18000080
.long 0xD3D94007, 0x18000080
.long 0xD3D94008, 0x18000080
.long 0xD3D94009, 0x18000080
.long 0xD3D9400A, 0x18000080
.long 0xD3D9400B, 0x18000080
.long 0xD3D9400C, 0x18000080
.long 0xD3D9400D, 0x18000080
.long 0xD3D9400E, 0x18000080
.long 0xD3D9400F, 0x18000080
.long 0xD3D94010, 0x18000080
.long 0xD3D94011, 0x18000080
.long 0xD3D94012, 0x18000080
.long 0xD3D94013, 0x18000080
.long 0xD3D94014, 0x18000080
.long 0xD3D94015, 0x18000080
.long 0xD3D94016, 0x18000080
.long 0xD3D94017, 0x18000080
.long 0xD3D94018, 0x18000080
.long 0xD3D94019, 0x18000080
.long 0xD3D9401A, 0x18000080
.long 0xD3D9401B, 0x18000080
.long 0xD3D9401C, 0x18000080
.long 0xD3D9401D, 0x18000080
.long 0xD3D9401E, 0x18000080
.long 0xD3D9401F, 0x18000080
.long 0xD3D94020, 0x18000080
.long 0xD3D94021, 0x18000080
.long 0xD3D94022, 0x18000080
.long 0xD3D94023, 0x18000080
.long 0xD3D94024, 0x18000080
.long 0xD3D94025, 0x18000080
.long 0xD3D94026, 0x18000080
.long 0xD3D94027, 0x18000080
.long 0xD3D94028, 0x18000080
.long 0xD3D94029, 0x18000080
.long 0xD3D9402A, 0x18000080
.long 0xD3D9402B, 0x18000080
.long 0xD3D9402C, 0x18000080
.long 0xD3D9402D, 0x18000080
.long 0xD3D9402E, 0x18000080
.long 0xD3D9402F, 0x18000080
.long 0xD3D94030, 0x18000080
.long 0xD3D94031, 0x18000080
.long 0xD3D94032, 0x18000080
.long 0xD3D94033, 0x18000080
.long 0xD3D94034, 0x18000080
.long 0xD3D94035, 0x18000080
.long 0xD3D94036, 0x18000080
.long 0xD3D94037, 0x18000080
.long 0xD3D94038, 0x18000080
.long 0xD3D94039, 0x18000080
.long 0xD3D9403A, 0x18000080
.long 0xD3D9403B, 0x18000080
.long 0xD3D9403C, 0x18000080
.long 0xD3D9403D, 0x18000080
.long 0xD3D9403E, 0x18000080
.long 0xD3D9403F, 0x18000080
.long 0xC0060700, 0x00000000
.long 0xC00A0A00, 0x00000038
.long 0xC00A0900, 0x00000040
.long 0xC00A0800, 0x00000018
.long 0xC00A0A00, 0x00000038
.long 0xD1130001, 0x00013F65
.long 0xD2850060, 0x000202A0
.long 0x20040281
.long 0xD2850002, 0x00020488
.long 0x2002CA85
.long 0x24020282
.long 0x68C0C101
.long 0x24C0C081
.long 0x68C0C102
.long 0x86548152
.long 0x9254FF54, 0x00001100
.long 0x68C0C054
.long 0x68C0C080
.long 0x68C2C0FF, 0x00002200
.long 0xBF8A0000
.long 0xD1130001, 0x00013F65
.long 0xD2850062, 0x000202A0
.long 0x20040281
.long 0xD2850002, 0x00020488
.long 0x2002CA85
.long 0x24020282
.long 0x68C4C501
.long 0x24C4C481
.long 0x68C4C502
.long 0x86548252
.long 0x8F548154
.long 0x9254FF54, 0x00001100
.long 0x68C4C454
.long 0x68C4C4FF, 0x00004400
.long 0x68C6C4FF, 0x00002200
.long 0xBF8CC07F
.long 0xBE900022
.long 0xBE910023
.long 0xBE9200FF, 0x80000000
.long 0xBE9300FF, 0x00020000
.long 0xBE940020
.long 0xBE950021
.long 0xBE9600FF, 0x80000000
.long 0xBE9700FF, 0x00020000
.long 0x925603FF, 0x00000080
.long 0x96552656
.long 0x92542656
.long 0x8ED48154
.long 0x80105410
.long 0x82115511
.long 0x80145414
.long 0x82155515
.long 0x96552704
.long 0x92542704
.long 0x8ED48154
.long 0x80105410
.long 0x82115511
.long 0x80145414
.long 0x82155515
.long 0x24C8CC86
.long 0x68C8C965
.long 0x2608CC82
.long 0x20080881
.long 0xD2850004, 0x000208C0
.long 0xD2850003, 0x00004D04
.long 0x2608CC81
.long 0xD2850004, 0x000208C0
.long 0x68060903
.long 0x2608C89F
.long 0xD2850005, 0x00004D04
.long 0x68D60B03
.long 0x2608C8BF
.long 0x200C0885
.long 0x240C0C82
.long 0x925402FF, 0x00000080
.long 0x32D40C54
.long 0xD1FE0068, 0x0206D76A
.long 0xBF8A0000
.long 0xD8EC0000, 0x20000060
.long 0xD8EC0000, 0x40000062
.long 0xD8EC0010, 0x22000060
.long 0xD8EC0010, 0x42000062
.long 0xBF8CC27F
.long 0xD3CC0000, 0x04028120
.long 0xD8EC0020, 0x24000060
.long 0xD8EC0020, 0x44000062
.long 0xD8EC0030, 0x26000060
.long 0xD8EC0030, 0x46000062
.long 0xBF8CC47F
.long 0xD3CC0000, 0x04028522
.long 0xD8EC0880, 0x28000060
.long 0xD8EC0880, 0x48000062
.long 0xD8EC0890, 0x4A000062
.long 0xD8EC0890, 0x2A000060
.long 0xBF8CC67F
.long 0xD3CC0000, 0x04028924
.long 0xD8EC08A0, 0x4C000062
.long 0xD8EC08A0, 0x2C000060
.long 0xD8EC08B0, 0x4E000062
.long 0xD8EC08B0, 0x2E000060
.long 0xBF8CC87F
.long 0xD3CC0000, 0x04028D26
.long 0xD8EC0000, 0x30000061
.long 0xD8EC0000, 0x50000063
.long 0xD8EC0010, 0x32000061
.long 0xD8EC0010, 0x52000063
.long 0xBF8CCA7F
.long 0xD3CC0010, 0x04428128
.long 0xD8EC0020, 0x34000061
.long 0xD8EC0020, 0x54000063
.long 0xD8EC0030, 0x36000061
.long 0xD8EC0030, 0x56000063
.long 0xBF8CCC7F
.long 0xD3CC0010, 0x0442852A
.long 0xD8EC0880, 0x38000061
.long 0xD8EC0880, 0x58000063
.long 0xD8EC0890, 0x3A000061
.long 0xD8EC0890, 0x5A000063
.long 0xBF8CCE7F
.long 0xD3CC0010, 0x0442892C
.long 0xD8EC08A0, 0x3C000061
.long 0xD8EC08A0, 0x5C000063
.long 0xD8EC08B0, 0x3E000061
.long 0xD8EC08B0, 0x5E000063
.long 0xBF8A0000
.long 0xBF8CCF7F
.long 0xD3CC0010, 0x04428D2E
.long 0xD3CC0020, 0x04829120
.long 0xD3CC0020, 0x04829522
.long 0xD3CC0020, 0x04829924
.long 0xD3CC0020, 0x04829D26
.long 0xD3CC0030, 0x04C29128
.long 0xD3CC0030, 0x04C2952A
.long 0xD3CC0030, 0x04C2992C
.long 0xD3CC0030, 0x04C29D2E
.long 0xBF8CC07F
.long 0xD3CC0000, 0x0402A130
.long 0xD3CC0000, 0x0402A532
.long 0xD3CC0000, 0x0402A934
.long 0xD3CC0000, 0x0402AD36
.long 0xD3CC0010, 0x0442A138
.long 0xD3CC0010, 0x0442A53A
.long 0xD3CC0010, 0x0442A93C
.long 0xD3CC0010, 0x0442AD3E
.long 0xD3CC0020, 0x0482B130
.long 0xD3CC0020, 0x0482B532
.long 0xD3CC0020, 0x0482B934
.long 0xD3CC0020, 0x0482BD36
.long 0xD3CC0030, 0x04C2B138
.long 0xD3CC0030, 0x04C2B53A
.long 0xBF8A0000
.long 0x8F2E852D
.long 0x80AE2E80
.long 0xBF06802E
.long 0xBF85008E
.long 0xD3CC0030, 0x04C2B93C
.long 0xD8EC0000, 0x20000060
.long 0xD8EC0000, 0x40000062
.long 0xD8EC0010, 0x22000060
.long 0xD8EC0010, 0x42000062
.long 0xD3CC0030, 0x04C2BD3E
.long 0xBF8CC27F
.long 0xD3CC0000, 0x04028120
.long 0xD8EC0020, 0x24000060
.long 0xD8EC0020, 0x44000062
.long 0xD8EC0030, 0x26000060
.long 0xD8EC0030, 0x46000062
.long 0xBF8CC47F
.long 0xD3CC0000, 0x04028522
.long 0xD8EC0880, 0x28000060
.long 0xD8EC0880, 0x48000062
.long 0xD8EC0890, 0x4A000062
.long 0xD8EC0890, 0x2A000060
.long 0xBF8CC67F
.long 0xD3CC0000, 0x04028924
.long 0xD8EC08A0, 0x4C000062
.long 0xD8EC08A0, 0x2C000060
.long 0xD8EC08B0, 0x4E000062
.long 0xD8EC08B0, 0x2E000060
.long 0xBF8CC87F
.long 0xD3CC0000, 0x04028D26
.long 0xD8EC0000, 0x30000061
.long 0xD8EC0000, 0x50000063
.long 0xD8EC0010, 0x32000061
.long 0xD8EC0010, 0x52000063
.long 0xBF8CCA7F
.long 0xD3CC0010, 0x04428128
.long 0xD8EC0020, 0x34000061
.long 0xD8EC0020, 0x54000063
.long 0xD8EC0030, 0x36000061
.long 0xD8EC0030, 0x56000063
.long 0xBF8CCC7F
.long 0xD3CC0010, 0x0442852A
.long 0xD8EC0880, 0x38000061
.long 0xD8EC0880, 0x58000063
.long 0xD8EC0890, 0x3A000061
.long 0xD8EC0890, 0x5A000063
.long 0xBF8CCE7F
.long 0xD3CC0010, 0x0442892C
.long 0xD8EC08A0, 0x3C000061
.long 0xD8EC08A0, 0x5C000063
.long 0xD8EC08B0, 0x3E000061
.long 0xD8EC08B0, 0x5E000063
.long 0xBF8A0000
.long 0xBF8CCF7F
.long 0xD3CC0010, 0x04428D2E
.long 0xD3CC0020, 0x04829120
.long 0xD3CC0020, 0x04829522
.long 0xD3CC0020, 0x04829924
.long 0xD3CC0020, 0x04829D26
.long 0xD3CC0030, 0x04C29128
.long 0xD3CC0030, 0x04C2952A
.long 0xD3CC0030, 0x04C2992C
.long 0xD3CC0030, 0x04C29D2E
.long 0xBF8CC07F
.long 0xD3CC0000, 0x0402A130
.long 0xD3CC0000, 0x0402A532
.long 0xD3CC0000, 0x0402A934
.long 0xD3CC0000, 0x0402AD36
.long 0xD3CC0010, 0x0442A138
.long 0xD3CC0010, 0x0442A53A
.long 0xD3CC0010, 0x0442A93C
.long 0xD3CC0010, 0x0442AD3E
.long 0xD3CC0020, 0x0482B130
.long 0xD3CC0020, 0x0482B532
.long 0xD3CC0020, 0x0482B934
.long 0xD3CC0020, 0x0482BD36
.long 0xD3CC0030, 0x04C2B138
.long 0xD3CC0030, 0x04C2B53A
.long 0xBF8A0000
.long 0x802E822E
.long 0xBF00C22E
.long 0xBF84FF72
.long 0xD3CC0030, 0x04C2B93C
.long 0xD3CC0030, 0x04C2BD3E
.long 0xD3D84000, 0x18000100
.long 0xD3D84001, 0x18000101
.long 0xD3D84002, 0x18000102
.long 0xD3D84003, 0x18000103
.long 0xD3D84004, 0x18000104
.long 0xD3D84005, 0x18000105
.long 0xD3D84006, 0x18000106
.long 0xD3D84007, 0x18000107
.long 0x7E001500
.long 0x7E021501
.long 0xD2000000, 0x04012101
.long 0xD3904000, 0x18020028
.long 0x7E041502
.long 0x7E061503
.long 0xD2000001, 0x04092103
.long 0xD3904001, 0x18020228
.long 0x7E081504
.long 0x7E0A1505
.long 0xD2000002, 0x04112105
.long 0xD3904002, 0x18020428
.long 0xE0741000, 0x80050068
.long 0x7E0C1506
.long 0x7E0E1507
.long 0xD2000003, 0x04192107
.long 0xD3904003, 0x18020628
.long 0xD3D84008, 0x18000108
.long 0xD3D84009, 0x18000109
.long 0xD3D8400A, 0x1800010A
.long 0xD3D8400B, 0x1800010B
.long 0xE0741010, 0x80050268
.long 0x7E101508
.long 0x7E121509
.long 0xD2000004, 0x04212109
.long 0xD3904004, 0x18020828
.long 0x7E14150A
.long 0x7E16150B
.long 0xD2000005, 0x0429210B
.long 0xD3904005, 0x18020A28
.long 0xD3D8400C, 0x1800010C
.long 0xD3D8400D, 0x1800010D
.long 0xD3D8400E, 0x1800010E
.long 0xD3D8400F, 0x1800010F
.long 0xE0741020, 0x80050468
.long 0x7E18150C
.long 0x7E1A150D
.long 0xD2000006, 0x0431210D
.long 0xD3904006, 0x18020C28
.long 0x7E1C150E
.long 0x7E1E150F
.long 0xD2000007, 0x0439210F
.long 0xD3904007, 0x18020E28
.long 0xE0741030, 0x80050668
.long 0xD3D84000, 0x18000110
.long 0xD3D84001, 0x18000111
.long 0xD3D84002, 0x18000112
.long 0xD3D84003, 0x18000113
.long 0xD3D84004, 0x18000114
.long 0xD3D84005, 0x18000115
.long 0xD3D84006, 0x18000116
.long 0xD3D84007, 0x18000117
.long 0x7E001500
.long 0x7E021501
.long 0xD2000000, 0x04012101
.long 0xD3904000, 0x18020028
.long 0x7E041502
.long 0x7E061503
.long 0xD2000001, 0x04092103
.long 0xD3904001, 0x18020228
.long 0x7E081504
.long 0x7E0A1505
.long 0xD2000002, 0x04112105
.long 0xD3904002, 0x18020428
.long 0xE0741040, 0x80050068
.long 0x7E0C1506
.long 0x7E0E1507
.long 0xD2000003, 0x04192107
.long 0xD3904003, 0x18020628
.long 0xD3D84008, 0x18000118
.long 0xD3D84009, 0x18000119
.long 0xD3D8400A, 0x1800011A
.long 0xD3D8400B, 0x1800011B
.long 0xE0741050, 0x80050268
.long 0x7E101508
.long 0x7E121509
.long 0xD2000004, 0x04212109
.long 0xD3904004, 0x18020828
.long 0x7E14150A
.long 0x7E16150B
.long 0xD2000005, 0x0429210B
.long 0xD3904005, 0x18020A28
.long 0xD3D8400C, 0x1800011C
.long 0xD3D8400D, 0x1800011D
.long 0xD3D8400E, 0x1800011E
.long 0xD3D8400F, 0x1800011F
.long 0xE0741060, 0x80050468
.long 0x7E18150C
.long 0x7E1A150D
.long 0xD2000006, 0x0431210D
.long 0xD3904006, 0x18020C28
.long 0x7E1C150E
.long 0x7E1E150F
.long 0xD2000007, 0x0439210F
.long 0xD3904007, 0x18020E28
.long 0xE0741070, 0x80050668
.long 0x9254C026
.long 0x68D0D054
.long 0xD3D84000, 0x18000120
.long 0xD3D84001, 0x18000121
.long 0xD3D84002, 0x18000122
.long 0xD3D84003, 0x18000123
.long 0xD3D84004, 0x18000124
.long 0xD3D84005, 0x18000125
.long 0xD3D84006, 0x18000126
.long 0xD3D84007, 0x18000127
.long 0x7E001500
.long 0x7E021501
.long 0xD2000000, 0x04012101
.long 0xD3904000, 0x18020028
.long 0x7E041502
.long 0x7E061503
.long 0xD2000001, 0x04092103
.long 0xD3904001, 0x18020228
.long 0x7E081504
.long 0x7E0A1505
.long 0xD2000002, 0x04112105
.long 0xD3904002, 0x18020428
.long 0xE0741000, 0x80050068
.long 0x7E0C1506
.long 0x7E0E1507
.long 0xD2000003, 0x04192107
.long 0xD3904003, 0x18020628
.long 0xD3D84008, 0x18000128
.long 0xD3D84009, 0x18000129
.long 0xD3D8400A, 0x1800012A
.long 0xD3D8400B, 0x1800012B
.long 0xE0741010, 0x80050268
.long 0x7E101508
.long 0x7E121509
.long 0xD2000004, 0x04212109
.long 0xD3904004, 0x18020828
.long 0x7E14150A
.long 0x7E16150B
.long 0xD2000005, 0x0429210B
.long 0xD3904005, 0x18020A28
.long 0xD3D8400C, 0x1800012C
.long 0xD3D8400D, 0x1800012D
.long 0xD3D8400E, 0x1800012E
.long 0xD3D8400F, 0x1800012F
.long 0xE0741020, 0x80050468
.long 0x7E18150C
.long 0x7E1A150D
.long 0xD2000006, 0x0431210D
.long 0xD3904006, 0x18020C28
.long 0x7E1C150E
.long 0x7E1E150F
.long 0xD2000007, 0x0439210F
.long 0xD3904007, 0x18020E28
.long 0xE0741030, 0x80050668
.long 0xD3D84000, 0x18000130
.long 0xD3D84001, 0x18000131
.long 0xD3D84002, 0x18000132
.long 0xD3D84003, 0x18000133
.long 0xD3D84004, 0x18000134
.long 0xD3D84005, 0x18000135
.long 0xD3D84006, 0x18000136
.long 0xD3D84007, 0x18000137
.long 0x7E001500
.long 0x7E021501
.long 0xD2000000, 0x04012101
.long 0xD3904000, 0x18020028
.long 0x7E041502
.long 0x7E061503
.long 0xD2000001, 0x04092103
.long 0xD3904001, 0x18020228
.long 0x7E081504
.long 0x7E0A1505
.long 0xD2000002, 0x04112105
.long 0xD3904002, 0x18020428
.long 0xE0741040, 0x80050068
.long 0x7E0C1506
.long 0x7E0E1507
.long 0xD2000003, 0x04192107
.long 0xD3904003, 0x18020628
.long 0xD3D84008, 0x18000138
.long 0xD3D84009, 0x18000139
.long 0xD3D8400A, 0x1800013A
.long 0xD3D8400B, 0x1800013B
.long 0xE0741050, 0x80050268
.long 0x7E101508
.long 0x7E121509
.long 0xD2000004, 0x04212109
.long 0xD3904004, 0x18020828
.long 0x7E14150A
.long 0x7E16150B
.long 0xD2000005, 0x0429210B
.long 0xD3904005, 0x18020A28
.long 0xD3D8400C, 0x1800013C
.long 0xD3D8400D, 0x1800013D
.long 0xD3D8400E, 0x1800013E
.long 0xD3D8400F, 0x1800013F
.long 0xE0741060, 0x80050468
.long 0x7E18150C
.long 0x7E1A150D
.long 0xD2000006, 0x0431210D
.long 0xD3904006, 0x18020C28
.long 0x7E1C150E
.long 0x7E1E150F
.long 0xD2000007, 0x0439210F
.long 0xD3904007, 0x18020E28
.long 0xE0741070, 0x80050668
.long 0xBF8C0000
.long 0xBF810000

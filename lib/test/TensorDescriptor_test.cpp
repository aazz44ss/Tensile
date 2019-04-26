/*******************************************************************************
 *
 * MIT License
 *
 * Copyright (c) 2017 Advanced Micro Devices, Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 *******************************************************************************/

#include <gtest/gtest.h>

#include <Tensile/TensorDescriptor.hpp>

using namespace Tensile;

TEST(TensorDescriptor, Simple)
{
    TensorDescriptor t(DataType::Float, {11,13,17});

    EXPECT_EQ(t.dimensions(), 3);
    EXPECT_EQ(t.sizes(),   std::vector<size_t>({11,13,17}));
    EXPECT_EQ(t.strides(), std::vector<size_t>({1,11,11*13}));

    EXPECT_EQ(t.totalLogicalElements(),   11*13*17);
    EXPECT_EQ(t.totalAllocatedElements(), 11*13*17);
    EXPECT_EQ(t.totalAllocatedBytes(),    11*13*17*4);

    for(int i = 0; i < 3; i++)
        EXPECT_EQ(t.dimensionPadding(i), 0) << i;

    EXPECT_EQ(t.index(3,4,1), 3 + 4*11 + 11*13);
}

TEST(TensorDescriptor, Padded)
{
    TensorDescriptor t(DataType::Float, {11,13,17,4}, {1, 16, 16*13, 16*13*17});

    EXPECT_EQ(t.dimensions(), 4);
    EXPECT_EQ(t.sizes(),   std::vector<size_t>({11,13,17,4}));
    EXPECT_EQ(t.strides(), std::vector<size_t>({1,16,16*13,16*13*17}));

    EXPECT_EQ(t.totalLogicalElements(),   11*13*17*4);
    EXPECT_EQ(t.totalAllocatedElements(), 16*13*17*4);
    EXPECT_EQ(t.totalAllocatedBytes(),    16*13*17*4*4);

    EXPECT_EQ(t.dimensionPadding(0), 0);
    EXPECT_EQ(t.dimensionPadding(1), 5);
    EXPECT_EQ(t.dimensionPadding(2), 0);
    EXPECT_EQ(t.dimensionPadding(3), 0);

    EXPECT_EQ(t.index(3,4,1,2), 3 + 4*16 + 16*13 + 16*13*17*2);

}

TEST(TensorDescriptor, CollapseDims1)
{
    TensorDescriptor t(DataType::Float, {11,13,17,4}, {1, 16, 16*13, 16*13*17});

    {
        TensorDescriptor u = t;
        EXPECT_THROW(u.collapseDims(0,2), std::runtime_error);

        u.collapseDims(1,3);

        EXPECT_EQ(u.dimensions(), 3);
        EXPECT_EQ(u.sizes(), std::vector<size_t>({11,13*17, 4}));
        EXPECT_EQ(u.strides(), std::vector<size_t>({1, 16, 16*13*17}));

        EXPECT_EQ(u.totalLogicalElements(), t.totalLogicalElements());
        EXPECT_EQ(u.totalAllocatedElements(), t.totalAllocatedElements());
        EXPECT_EQ(u.totalAllocatedBytes(), t.totalAllocatedBytes());

    }
}

TEST(TensorDescriptor, CollapseDims2)
{
    TensorDescriptor t(DataType::Float, {11,13,17,4});

    {
        TensorDescriptor u = t;
        u.collapseDims(0,2);

        EXPECT_EQ(u.dimensions(), 3);
        EXPECT_EQ(u.sizes(), std::vector<size_t>({11*13,17, 4}));
        EXPECT_EQ(u.strides(), std::vector<size_t>({1, 11*13, 11*13*17}));

        EXPECT_EQ(u.totalLogicalElements(), t.totalLogicalElements());
        EXPECT_EQ(u.totalAllocatedElements(), t.totalAllocatedElements());
        EXPECT_EQ(u.totalAllocatedBytes(), t.totalAllocatedBytes());

    }

    {
        TensorDescriptor u = t;
        u.collapseDims(0,4);

        EXPECT_EQ(u.dimensions(), 1);
        EXPECT_EQ(u.sizes(), std::vector<size_t>({11*13*17*4}));
        EXPECT_EQ(u.strides(), std::vector<size_t>({1}));

        EXPECT_EQ(u.totalLogicalElements(), t.totalLogicalElements());
        EXPECT_EQ(u.totalAllocatedElements(), t.totalAllocatedElements());
        EXPECT_EQ(u.totalAllocatedBytes(), t.totalAllocatedBytes());

    }

    {
        TensorDescriptor u = t;
        u.collapseDims(1,4);

        EXPECT_EQ(u.dimensions(), 2);
        EXPECT_EQ(u.sizes(), std::vector<size_t>({11,13*17*4}));
        EXPECT_EQ(u.strides(), std::vector<size_t>({1, 11}));

        EXPECT_EQ(u.totalLogicalElements(), t.totalLogicalElements());
        EXPECT_EQ(u.totalAllocatedElements(), t.totalAllocatedElements());
        EXPECT_EQ(u.totalAllocatedBytes(), t.totalAllocatedBytes());
    }

    {
        TensorDescriptor u = t;
        u.collapseDims(1,3);

        EXPECT_EQ(u.dimensions(), 3);
        EXPECT_EQ(u.sizes(), std::vector<size_t>({11,13*17,4}));
        EXPECT_EQ(u.strides(), std::vector<size_t>({1, 11, 11*13*17}));

        EXPECT_EQ(u.totalLogicalElements(), t.totalLogicalElements());
        EXPECT_EQ(u.totalAllocatedElements(), t.totalAllocatedElements());
        EXPECT_EQ(u.totalAllocatedBytes(), t.totalAllocatedBytes());
    }
}


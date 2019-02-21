/*******************************************************************************
 *
 * MIT License
 *
 * Copyright (c) 2019 Advanced Micro Devices, Inc.
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

#pragma once

#include <map>
#include <memory>
#include <string>
#include <vector>

#include <Tensile/Tensile_fwd.hpp>
#include <Tensile/SolutionLibrary_fwd.hpp>

#include <Tensile/KernelArguments.hpp>
#include <Tensile/geom.hpp>

namespace Tensile
{
    class Problem
    {
    public:
        virtual ~Problem() = default;

        virtual std::string description() const = 0;
    };

    class ProblemInputs
    {
    public:
        virtual ~ProblemInputs() = default;

    };

    struct KernelInvocation
    {
    public:
        Solution const * solution;

        dim3 workGroupSize;
        dim3 numWorkGroups;
        dim3 numWorkItems;
        size_t sharedMemBytes = 0;

        KernelArguments args;
    };

    class Hardware
    {
    public:
        virtual ~Hardware() = default;

        virtual std::string description() const = 0;
    };

    /// Generally encapsulates a single kernel.
    class Solution
    {
    public:
        virtual ~Solution() = default;

        virtual std::string name() const = 0;
        virtual std::string description() const = 0;

    };

    class SolutionAdapter
    {
    public:
        virtual ~SolutionAdapter() = default;

        virtual std::string name() const = 0;
    };

    template <typename MyProblem, typename MySolution>
    std::shared_ptr<SolutionLibrary<MyProblem, MySolution>> LoadLibraryFile(std::string const& filename);
}


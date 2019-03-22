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

#include <iostream>
#include <sstream>
#include <array>

#include <Tensile/TensorDescriptor.hpp>

namespace Tensile
{
    template <typename T>
    T CeilDivide(T num, T den)
    {
        return (num + (den-1))/den;
    }

    template <typename T>
    T RoundUpToMultiple(T val, T den)
    {
        return CeilDivide(val, den) * den;
    }

    template <typename T>
    void WriteTensor(std::ostream & stream, T * data, TensorDescriptor const& desc)
    {
        if(desc.dimensions() != 3)
            throw std::runtime_error("Fix this function to work with dimensions != 3");

        std::vector<size_t> index3{0,0,0};

        stream << "Tensor("
            << desc.sizes()[0] << ", "
            << desc.sizes()[1] << ", "
            << desc.sizes()[2] << ")";

       stream << std::endl;

        for(index3[2] = 0; index3[2] < desc.sizes()[2]; index3[2]++)
        {
            stream << "[" << std::endl;
            for(index3[0] = 0; index3[0] < desc.sizes()[0]; index3[0]++)
            {
                for(index3[1] = 0; index3[1] < desc.sizes()[1]; index3[1]++)
                {
                    size_t idx = desc.index(index3);
                    stream << data[idx] << " ";
                }
                stream << std::endl;
            }
            stream << "]" << std::endl;
        }
    }

    template <typename Container, typename Joiner>
    void streamJoin(std::ostream & stream, Container const& c, Joiner const& j)
    {
        bool first = true;
        for(auto const& item: c)
        {
            if(!first) stream << j;
            stream << item;
            first = false;
        }
    }

    template <typename T>
    inline std::ostream & stream_write(std::ostream & stream, T const& val)
    {
        return stream << val;
    }

    template <typename T, typename... Ts>
    inline std::ostream & stream_write(std::ostream & stream, T const& val, Ts const&... vals)
    {
        return stream_write(stream << val, vals...);
    }

    template <typename... Ts>
    inline std::string concatenate(Ts const&... vals)
    {
        std::ostringstream msg;
        stream_write(msg, vals...);

        return msg.str();
    }

    template <typename T, size_t N>
    inline std::ostream & operator<<(std::ostream & stream, std::array<T, N> const& array)
    {
        streamJoin(stream, array, ", ");
        return stream;
    }
}

#define TENSILE_STR_(x) #x
#define TENSILE_STR(x) TENSILE_STR_(x)
#define TENSILE_LINENO TENSILE_STR(__LINE__)
#define TENSILE_LINEINFO __FILE__ ":" TENSILE_LINENO

#define TENSILE_ASSERT_EXC(exp)                                             \
    do                                                                      \
    {                                                                       \
        if(!(exp))                                                          \
        {                                                                   \
            throw std::runtime_error("Error in " TENSILE_LINEINFO ": " #exp);  \
        }                                                                   \
    } while(false)


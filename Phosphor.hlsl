// Subpixel nearest
// Based on CRT-Hyllian Magpie port as upstream
// https://github.com/Blinue/Magpie/blob/dev/src/Effects/CRT/CRT_Hyllian.hlsl
// Original author Blinue at https://github.com/Blinue/Magpie/issues/733#issuecomment-1764348560

// CRT-Hyllian
// 移植自 https://github.com/libretro/common-shaders/blob/master/crt/shaders/crt-hyllian.cg
// 要求整数倍缩放

/*
   Hyllian's CRT Shader

   Copyright (C) 2011-2016 Hyllian - sergiogdb@gmail.com

   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to deal
   in the Software without restriction, including without limitation the rights
   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in
   all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
   THE SOFTWARE.

*/

//!MAGPIE EFFECT
//!VERSION 4

//!TEXTURE
Texture2D INPUT;

//!TEXTURE
Texture2D OUTPUT;

//!SAMPLER
//!FILTER POINT
SamplerState sam;


//!PASS 1
//!STYLE PS
//!IN INPUT
//!OUT OUTPUT

float4 Pass1(float2 pos) {
    float3 dotMaskWeights = lerp(
        float3(1.0, 0.7, 1.0),
        float3(0.7, 1.0, 0.7),
        floor(fmod(pos.x * GetOutputSize().x, 2.0))
    );
    return float4(INPUT.SampleLevel(sam, pos, 0).rgb * dotMaskWeights, 1);
}

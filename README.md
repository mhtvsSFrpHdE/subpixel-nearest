# Subpixel Neatest
A nearest upscaling algorithm variant, apply CRT-like vertical scanline but not make them too aggressive.  
By adding phosphor scanline to image, it magically brings anti-aliasing effect  
but also doesn't make image blurs like if doing `Bicubic` or `FSR 1.0`.  
In ideal situation, scaling result can beat `FSR 1.0` or `Lossless Scaling LS1`.

I believe something happened out there at the LCD subpixel area.  
There is also font rendering solution utilize LCD subpixel like `Microsoft Cleartype`, `RGB subpixel font anti-aliasing`.

Some people report this effect doesn't work on non HiDpi displays.  
Generally, why the upscaling method will work and suitable for some people like me,  
the principleis still pretty unknown.

I have no knowledge about graphical programming,  
You're welcome to share your thought, optimization, or correct implementation of certain feature.

## Drawbacks
- Require higher monitor brightness to provide most correct image.  
  Although color boost generally improves brightness, but suffer in color distortion.
- May work only on HiDpi displays, like `24 inch 3840x2160`.

## Install
Put to Magpie `effects` folder like `effects\Phosphor.hlsl`.

## Usage
- `Phosphor.hlsl` is the best choice, but you need to give your monitor more brightness manually.
- `Phosphor_All.hlsl` add color boost switch, which allows brighter image without raise monitor brightness.
 But in some case it distorts color of the image.

### Phosphor_All
`Enable Color Boost`:  
Try make image brighter while apply scanline.  
`Color Boost Value`:  
Higher value presents brighter image, default value should look like standard nearest.  
Set to 1.0 will disable color boost.

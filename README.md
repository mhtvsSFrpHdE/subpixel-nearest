# Subpixel Neatest
A nearest upscaling algorithm variant, apply CRT-like vertical scanline but not make them too aggressive.  
By adding phosphor scanline to image, it magically brings anti-aliasing effect  
but also doesn't make image blurs like if doing `Bicubic` or `FSR 1.0`.

I believe something happened out there at the LCD subpixel area.  
There is also font rendering solution utilize LCD subpixel like `Microsoft Cleartype`, `RGB subpixel font anti-aliasing`.

Some people report this effect doesn't work on non HiDpi displays.  
Generally, why the upscaling method will work and suitable for some people like me,  
the principleis still pretty unknown.

# SDF Font Example

- [SDF_Font_Example.fuse](SDF_Font_Example.fuse) <br />*... can be downloaded and copied manually into your fuses folder if needed*
- [SDF_Font_Example.comp](../../Comp/nmbr73/SDF_Font_Example.comp) <br />*... needs the repository to be checked out as described in the [README](../../README.md)*
- Uses [shader_fontgen/shadertoy.png](../../../Data/Font/shader_fontgen/shadertoy.png) as its input texture

With Otavio Good's [shader_fontgen](https://github.com/otaviogood/shader_fontgen) one can create a SDF (signed distance function) based font texture. For a good introduction into SDF Fonts based on the technique proposed by [Chris Green of Valve at SIGGRAPH 2007](https://steamcdn-a.akamaihd.net/apps/valve/2007/SIGGRAPH2007_AlphaTestedMagnification.pdf) see [SDFont](https://github.com/ShoYamanishi/SDFont), a *Signed Distance Font Generator and Runtime Utility* by [Shoichiro Yamanishi](https://github.com/ShoYamanishi). See [About SDF fonts](https://docs.unity3d.com/Packages/com.unity.textmeshpro@3.2/manual/FontAssetsSDF.html) in the Unity manual to quickly get the idea.

![comp](SDF_Font_Example_comp.png)

Examples of how to render the SDF font into text:
- [SDF font 0](https://www.shadertoy.com/view/NtG3Dd) by [IFHEo](https://www.shadertoy.com/user/IFHEo)
- [SDF Font Texture Adventures ](https://www.shadertoy.com/view/ldfcDr) ... uses the font texture and adds some effects

Shadertoys using the SDF font texture:
- [GPU and OS detector v2](https://www.shadertoy.com/view/7ssyzr) by [archee](https://www.shadertoy.com/user/archee)
- [iResolution, iMouse, iDate, etc](https://www.shadertoy.com/view/llySRh) by [FabriceNeyret2](https://www.shadertoy.com/user/FabriceNeyret2)
- [\[SH17C\] Physically Based Shading](https://www.shadertoy.com/view/4sSfzK) by [knarkowicz](https://www.shadertoy.com/user/knarkowicz)

Other Shadertoys that display text:
- [Pangram](https://www.shadertoy.com/view/XdXGRB) ... just "paints" the letters - no texture needed
- [96-bit 8x12 Font](https://www.shadertoy.com/view/Mt2GWD) ... a pixel font - no texture needed

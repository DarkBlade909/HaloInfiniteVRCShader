// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "HaloInfinte/-DarkBlade Edit- Halo Infinite Spartan Armor"
{
	Properties
	{
		[NoScaleOffset]_ASGMap("ASGMap", 2D) = "white" {}
		[NoScaleOffset]_CC1Mask("CC1 Mask", 2D) = "black" {}
		[NoScaleOffset]_CC2Mask("CC2 Mask", 2D) = "white" {}
		[NoScaleOffset]_BumpMap("NormalMap", 2D) = "bump" {}
		[KeywordEnum(OpenGL,DirectX)] _NormalMapFormat("NormalMapFormat", Float) = 1
		_DetailAlbedoMap1("Normal Detail", 2D) = "bump" {}
		_RoughnessDetail("Roughness Detail", 2D) = "black" {}
		[Toggle(_RIMLIGHTING_ON)] _RimLighting("Rim Lighting", Float) = 0
		_DetailRoughMultiplier("Detail Rough Multiplier", Range( 0 , 1)) = 0.9
		_AODiffuseMixing("AO DiffuseMixing", Range( 0 , 1)) = 0.5
		_EmissiveIntencity("EmissiveIntencity", Range( 0 , 5)) = 1
		[Header(ColorZone0)]_Color("Color 0", Color) = (1,0,0,0)
		_Zone0TileableIntensity("Zone0 Tileable Intensity ", Range( 0 , 5)) = 0
		_MetallicFloorZone0("Metallic Floor Zone0", Range( 0 , 1)) = 0
		_RoughnessZone0("Roughness Zone0", Range( 0 , 1)) = 0.65
		[Header(ColorZone1)]_Color1("Color 1", Color) = (0,1,0,0)
		_Zone1TileableIntensity("Zone1 Tileable Intensity ", Range( 0 , 5)) = 0
		_MetallicFloorZone1("Metallic Floor Zone1", Range( 0 , 1)) = 0
		_RoughnessZone1("Roughness Zone1", Range( 0 , 1)) = 0.65
		[Header(ColorZone2)]_Color2("Color 2", Color) = (0,0,1,0)
		_Zone2TileableIntensity("Zone2 Tileable Intensity ", Range( 0 , 5)) = 0
		_MetallicFloorZone2("Metallic Floor Zone2", Range( 0 , 1)) = 0
		_RoughnessZone2("Roughness Zone2", Range( 0 , 1)) = 0.65
		[Header(ColorZone3)]_Color3("Color 3", Color) = (0,1,1,0)
		_Zone3TileableIntensity("Zone3 Tileable Intensity ", Range( 0 , 5)) = 0
		_MetallicFloorZone3("Metallic Floor Zone3", Range( 0 , 1)) = 0
		_RoughnessZone3("Roughness Zone3", Range( 0 , 1)) = 0.65
		[Header(ColorZone4)]_Color4("Color 4", Color) = (1,1,0,0)
		_Zone4TileableIntensity("Zone4 Tileable Intensity ", Range( 0 , 5)) = 0
		_MetallicFloorZone4("Metallic Floor Zone4", Range( 0 , 1)) = 0
		_RoughnessZone4("Roughness Zone4", Range( 0 , 1)) = 0.65
		[Header(ColorZone5)]_Color5("Color 5", Color) = (1,0,1,0)
		_Zone5TileableIntensity("Zone5 Tileable Intensity ", Range( 0 , 5)) = 0
		_MetallicFloorZone5("Metallic Floor Zone5", Range( 0 , 1)) = 0
		_RoughnessZone5("Roughness Zone5", Range( 0 , 1)) = 0.65
		[Header(ColorZone6 grunge)]_Color6("Color 6", Color) = (0,0,0,0)
		_GrungeAmmount("Grunge Ammount", Range( 0 , 1)) = 1
		_GrungePower("Grunge Power", Range( 0.22 , 2.2)) = 0.7
		_RoughnessGrunge("Roughness Grunge", Range( 0 , 1)) = 0.75
		_GrungeHeightStrength("Grunge Height Strength", Range( 0 , 1)) = 0.15
		[Header(Dust and Emissives)]_CC2BColor("CC2B Color", Color) = (0.8773585,0.7514915,0.6166341,0)
		_RoughnessDust("Roughness Dust", Range( 0 , 1)) = 0.8
		[KeywordEnum(CC2BDustNoEmssive,CC2BDustZone5Emissive,CC2BEmissive,NoCC2B)] _CC2Bswitch("CC2B switch ", Float) = 0
		[Header(ColorZone7 MetalWear)]_Color7("EdgeWearColor", Color) = (0.3764706,0.3764706,0.3764706,0)
		_EdgeWearAmmount("Edge Wear Ammount", Range( 0 , 1)) = 1
		_EdgeWearPower("Edge Wear Power", Range( 0.22 , 2.2)) = 1
		_RoughnessEdgeWear("Roughness Edge Wear", Range( 0 , 1)) = 0.5
		_WearHeightStrength("Wear Height Strength", Range( 0 , 1)) = 0.15
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#pragma multi_compile _NORMALMAPFORMAT_OPENGL _NORMALMAPFORMAT_DIRECTX
		#pragma multi_compile _CC2BSWITCH_CC2BDUSTNOEMSSIVE _CC2BSWITCH_CC2BDUSTZONE5EMISSIVE _CC2BSWITCH_CC2BEMISSIVE _CC2BSWITCH_NOCC2B
		#pragma shader_feature_local _RIMLIGHTING_ON
		#ifdef UNITY_PASS_SHADOWCASTER
			#undef INTERNAL_DATA
			#undef WorldReflectionVector
			#undef WorldNormalVector
			#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
			#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
			#define WorldNormalVector(data,normal) half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))
		#endif
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
			float3 worldNormal;
			INTERNAL_DATA
		};

		uniform sampler2D _BumpMap;
		uniform sampler2D _DetailAlbedoMap1;
		uniform float4 _DetailAlbedoMap1_ST;
		uniform float _Zone0TileableIntensity;
		uniform sampler2D _CC2Mask;
		uniform sampler2D _CC1Mask;
		uniform float _Zone1TileableIntensity;
		uniform float _Zone2TileableIntensity;
		uniform float _Zone3TileableIntensity;
		uniform float _Zone4TileableIntensity;
		uniform float _Zone5TileableIntensity;
		uniform sampler2D _ASGMap;
		uniform float _EdgeWearAmmount;
		uniform float _EdgeWearPower;
		uniform float4 _ASGMap_ST;
		float4 _ASGMap_TexelSize;
		uniform float _WearHeightStrength;
		uniform float _GrungeHeightStrength;
		uniform float4 _Color;
		uniform float4 _Color1;
		uniform float4 _Color2;
		uniform float4 _Color3;
		uniform float4 _Color4;
		uniform float4 _Color7;
		uniform float4 _Color5;
		uniform float4 _CC2BColor;
		uniform float4 _Color6;
		uniform float _GrungeAmmount;
		uniform float _GrungePower;
		uniform float _AODiffuseMixing;
		uniform float _EmissiveIntencity;
		uniform float _MetallicFloorZone0;
		uniform float _MetallicFloorZone1;
		uniform float _MetallicFloorZone2;
		uniform float _MetallicFloorZone3;
		uniform float _MetallicFloorZone4;
		uniform float _MetallicFloorZone5;
		uniform float _RoughnessZone0;
		uniform float _RoughnessZone1;
		uniform float _RoughnessZone2;
		uniform float _RoughnessZone3;
		uniform float _RoughnessZone4;
		uniform float _RoughnessZone5;
		uniform float _RoughnessEdgeWear;
		uniform float _RoughnessGrunge;
		uniform float _RoughnessDust;
		uniform sampler2D _RoughnessDetail;
		uniform float4 _RoughnessDetail_ST;
		uniform float _DetailRoughMultiplier;


		float3 CombineSamplesSharp128_g201( float S0, float S1, float S2, float Strength )
		{
			{
			    float3 va = float3( 0.13, 0, ( S1 - S0 ) * Strength );
			    float3 vb = float3( 0, 0.13, ( S2 - S0 ) * Strength );
			    return normalize( cross( va, vb ) );
			}
		}


		float3 CombineSamplesSharp128_g202( float S0, float S1, float S2, float Strength )
		{
			{
			    float3 va = float3( 0.13, 0, ( S1 - S0 ) * Strength );
			    float3 vb = float3( 0, 0.13, ( S2 - S0 ) * Strength );
			    return normalize( cross( va, vb ) );
			}
		}


		struct Gradient
		{
			int type;
			int colorsLength;
			int alphasLength;
			float4 colors[8];
			float2 alphas[8];
		};


		Gradient NewGradient(int type, int colorsLength, int alphasLength, 
		float4 colors0, float4 colors1, float4 colors2, float4 colors3, float4 colors4, float4 colors5, float4 colors6, float4 colors7,
		float2 alphas0, float2 alphas1, float2 alphas2, float2 alphas3, float2 alphas4, float2 alphas5, float2 alphas6, float2 alphas7)
		{
			Gradient g;
			g.type = type;
			g.colorsLength = colorsLength;
			g.alphasLength = alphasLength;
			g.colors[ 0 ] = colors0;
			g.colors[ 1 ] = colors1;
			g.colors[ 2 ] = colors2;
			g.colors[ 3 ] = colors3;
			g.colors[ 4 ] = colors4;
			g.colors[ 5 ] = colors5;
			g.colors[ 6 ] = colors6;
			g.colors[ 7 ] = colors7;
			g.alphas[ 0 ] = alphas0;
			g.alphas[ 1 ] = alphas1;
			g.alphas[ 2 ] = alphas2;
			g.alphas[ 3 ] = alphas3;
			g.alphas[ 4 ] = alphas4;
			g.alphas[ 5 ] = alphas5;
			g.alphas[ 6 ] = alphas6;
			g.alphas[ 7 ] = alphas7;
			return g;
		}


		float4 SampleGradient( Gradient gradient, float time )
		{
			float3 color = gradient.colors[0].rgb;
			UNITY_UNROLL
			for (int c = 1; c < 8; c++)
			{
			float colorPos = saturate((time - gradient.colors[c-1].w) / ( 0.00001 + (gradient.colors[c].w - gradient.colors[c-1].w)) * step(c, (float)gradient.colorsLength-1));
			color = lerp(color, gradient.colors[c].rgb, lerp(colorPos, step(0.01, colorPos), gradient.type));
			}
			#ifndef UNITY_COLORSPACE_GAMMA
			color = half3(GammaToLinearSpaceExact(color.r), GammaToLinearSpaceExact(color.g), GammaToLinearSpaceExact(color.b));
			#endif
			float alpha = gradient.alphas[0].x;
			UNITY_UNROLL
			for (int a = 1; a < 8; a++)
			{
			float alphaPos = saturate((time - gradient.alphas[a-1].y) / ( 0.00001 + (gradient.alphas[a].y - gradient.alphas[a-1].y)) * step(a, (float)gradient.alphasLength-1));
			alpha = lerp(alpha, gradient.alphas[a].x, lerp(alphaPos, step(0.01, alphaPos), gradient.type));
			}
			return float4(color, alpha);
		}


		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_BumpMap6 = i.uv_texcoord;
			float3 tex2DNode6 = UnpackNormal( tex2D( _BumpMap, uv_BumpMap6 ) );
			float3 appendResult354 = (float3(tex2DNode6.r , -tex2DNode6.g , 1.0));
			float2 uv_DetailAlbedoMap1 = i.uv_texcoord * _DetailAlbedoMap1_ST.xy + _DetailAlbedoMap1_ST.zw;
			float3 tex2DNode364 = UnpackNormal( tex2D( _DetailAlbedoMap1, uv_DetailAlbedoMap1 ) );
			float3 appendResult363 = (float3(tex2DNode364.r , -tex2DNode364.g , 1.0));
			float2 uv_CC2Mask8 = i.uv_texcoord;
			float4 tex2DNode8 = tex2D( _CC2Mask, uv_CC2Mask8 );
			float CC2R16 = tex2DNode8.r;
			float CC2G17 = tex2DNode8.g;
			float2 uv_CC1Mask7 = i.uv_texcoord;
			float4 tex2DNode7 = tex2D( _CC1Mask, uv_CC1Mask7 );
			float CC1R12 = saturate( ( ( tex2DNode7.r - CC2R16 ) - CC2G17 ) );
			float CC1G13 = saturate( ( ( tex2DNode7.g - CC2R16 ) - CC2G17 ) );
			float CC1B14 = tex2DNode7.b;
			float Zone0MaskBase52 = ( 1.0 - saturate( ( CC2R16 + CC2G17 + CC1R12 + CC1G13 + CC1B14 ) ) );
			float ColorZone0Mask245 = Zone0MaskBase52;
			float ColorZone1Mask246 = CC1R12;
			float ColorZone2Mask247 = CC1G13;
			float ColorZone3Mask248 = CC1B14;
			float ColorZone4Mask249 = CC2R16;
			float2 uv_ASGMap5 = i.uv_texcoord;
			float4 tex2DNode5 = tex2D( _ASGMap, uv_ASGMap5 );
			float Metallic10 = tex2DNode5.g;
			float EdgeWear27 = saturate( pow( ( Metallic10 * _EdgeWearAmmount ) , _EdgeWearPower ) );
			float temp_output_156_0 = saturate( ( CC2G17 - EdgeWear27 ) );
			float ColorZone5Mask250 = temp_output_156_0;
			float localCalculateUVsSharp110_g201 = ( 0.0 );
			float2 uv_ASGMap = i.uv_texcoord * _ASGMap_ST.xy + _ASGMap_ST.zw;
			float2 temp_output_85_0_g201 = uv_ASGMap;
			float2 UV110_g201 = temp_output_85_0_g201;
			float4 TexelSize110_g201 = _ASGMap_TexelSize;
			float2 UV0110_g201 = float2( 0,0 );
			float2 UV1110_g201 = float2( 0,0 );
			float2 UV2110_g201 = float2( 0,0 );
			{
			{
			    UV110_g201.y -= TexelSize110_g201.y * 0.5;
			    UV0110_g201 = UV110_g201;
			    UV1110_g201 = UV110_g201 + float2( TexelSize110_g201.x, 0 );
			    UV2110_g201 = UV110_g201 + float2( 0, TexelSize110_g201.y );
			}
			}
			float4 break134_g201 = tex2D( _ASGMap, UV0110_g201 );
			float S0128_g201 = break134_g201.g;
			float4 break136_g201 = tex2D( _ASGMap, UV1110_g201 );
			float S1128_g201 = break136_g201.g;
			float4 break138_g201 = tex2D( _ASGMap, UV2110_g201 );
			float S2128_g201 = break138_g201.g;
			float temp_output_91_0_g201 = -_WearHeightStrength;
			float Strength128_g201 = temp_output_91_0_g201;
			float3 localCombineSamplesSharp128_g201 = CombineSamplesSharp128_g201( S0128_g201 , S1128_g201 , S2128_g201 , Strength128_g201 );
			float localCalculateUVsSharp110_g202 = ( 0.0 );
			float2 temp_output_85_0_g202 = uv_ASGMap;
			float2 UV110_g202 = temp_output_85_0_g202;
			float4 TexelSize110_g202 = _ASGMap_TexelSize;
			float2 UV0110_g202 = float2( 0,0 );
			float2 UV1110_g202 = float2( 0,0 );
			float2 UV2110_g202 = float2( 0,0 );
			{
			{
			    UV110_g202.y -= TexelSize110_g202.y * 0.5;
			    UV0110_g202 = UV110_g202;
			    UV1110_g202 = UV110_g202 + float2( TexelSize110_g202.x, 0 );
			    UV2110_g202 = UV110_g202 + float2( 0, TexelSize110_g202.y );
			}
			}
			float4 break134_g202 = tex2D( _ASGMap, UV0110_g202 );
			float S0128_g202 = break134_g202.b;
			float4 break136_g202 = tex2D( _ASGMap, UV1110_g202 );
			float S1128_g202 = break136_g202.b;
			float4 break138_g202 = tex2D( _ASGMap, UV2110_g202 );
			float S2128_g202 = break138_g202.b;
			float temp_output_91_0_g202 = -_GrungeHeightStrength;
			float Strength128_g202 = temp_output_91_0_g202;
			float3 localCombineSamplesSharp128_g202 = CombineSamplesSharp128_g202( S0128_g202 , S1128_g202 , S2128_g202 , Strength128_g202 );
			#if defined(_NORMALMAPFORMAT_OPENGL)
				float3 staticSwitch355 = tex2DNode6;
			#elif defined(_NORMALMAPFORMAT_DIRECTX)
				float3 staticSwitch355 = ( ( ( appendResult354 + ( appendResult363 * ( ( _Zone0TileableIntensity * ColorZone0Mask245 ) + ( _Zone1TileableIntensity * ColorZone1Mask246 ) + ( _Zone2TileableIntensity * ColorZone2Mask247 ) + ( _Zone3TileableIntensity * ColorZone3Mask248 ) + ( _Zone4TileableIntensity * ColorZone4Mask249 ) + ( _Zone5TileableIntensity * ColorZone5Mask250 ) ) ) ) + localCombineSamplesSharp128_g201 ) + localCombineSamplesSharp128_g202 );
			#else
				float3 staticSwitch355 = ( ( ( appendResult354 + ( appendResult363 * ( ( _Zone0TileableIntensity * ColorZone0Mask245 ) + ( _Zone1TileableIntensity * ColorZone1Mask246 ) + ( _Zone2TileableIntensity * ColorZone2Mask247 ) + ( _Zone3TileableIntensity * ColorZone3Mask248 ) + ( _Zone4TileableIntensity * ColorZone4Mask249 ) + ( _Zone5TileableIntensity * ColorZone5Mask250 ) ) ) ) + localCombineSamplesSharp128_g201 ) + localCombineSamplesSharp128_g202 );
			#endif
			float3 NormalMap15 = staticSwitch355;
			o.Normal = NormalMap15;
			float temp_output_12_0_g200 = 0.0;
			float3 Zone0Color112 = saturate( ( ( _Color * saturate( ( Zone0MaskBase52 - EdgeWear27 ) ) ).rgb * ( ( float3( 0,0,0 ) * temp_output_12_0_g200 ) + ( 1.0 - temp_output_12_0_g200 ) ) ) );
			float temp_output_12_0_g198 = 0.0;
			float3 Zone1Color113 = saturate( ( ( _Color1 * saturate( ( CC1R12 - EdgeWear27 ) ) ).rgb * ( ( float3( 0,0,0 ) * temp_output_12_0_g198 ) + ( 1.0 - temp_output_12_0_g198 ) ) ) );
			float temp_output_12_0_g196 = 0.0;
			float3 Zone2Color111 = saturate( ( ( _Color2 * saturate( ( CC1G13 - EdgeWear27 ) ) ).rgb * ( ( float3( 0,0,0 ) * temp_output_12_0_g196 ) + ( 1.0 - temp_output_12_0_g196 ) ) ) );
			float temp_output_12_0_g199 = 0.0;
			float3 Zone3Color114 = saturate( ( ( _Color3 * saturate( ( CC1B14 - EdgeWear27 ) ) ).rgb * ( ( float3( 0,0,0 ) * temp_output_12_0_g199 ) + ( 1.0 - temp_output_12_0_g199 ) ) ) );
			float temp_output_12_0_g197 = 0.0;
			float3 Zone4Color110 = saturate( ( ( _Color4 * saturate( ( CC2R16 - EdgeWear27 ) ) ).rgb * ( ( float3( 0,0,0 ) * temp_output_12_0_g197 ) + ( 1.0 - temp_output_12_0_g197 ) ) ) );
			float3 EdgeWearColor108 = (( _Color7 * EdgeWear27 )).rgb;
			float temp_output_12_0_g121 = 0.0;
			float3 Zone5ColorMix115 = saturate( ( ( _Color5 * temp_output_156_0 ).rgb * ( ( float3( 0,0,0 ) * temp_output_12_0_g121 ) + ( 1.0 - temp_output_12_0_g121 ) ) ) );
			float CC2B18 = tex2DNode8.b;
			float3 temp_output_330_0 = ( CC2B18 * (_CC2BColor).rgb );
			float3 temp_cast_6 = (0.0).xxx;
			#if defined(_CC2BSWITCH_CC2BDUSTNOEMSSIVE)
				float3 staticSwitch332 = ( Zone5ColorMix115 + temp_output_330_0 );
			#elif defined(_CC2BSWITCH_CC2BDUSTZONE5EMISSIVE)
				float3 staticSwitch332 = temp_output_330_0;
			#elif defined(_CC2BSWITCH_CC2BEMISSIVE)
				float3 staticSwitch332 = Zone5ColorMix115;
			#elif defined(_CC2BSWITCH_NOCC2B)
				float3 staticSwitch332 = temp_cast_6;
			#else
				float3 staticSwitch332 = ( Zone5ColorMix115 + temp_output_330_0 );
			#endif
			float3 Zone6Color109 = (_Color6).rgb;
			float AO9 = tex2DNode5.r;
			float Smoothness11 = tex2DNode5.b;
			float GrungeMask34 = saturate( pow( ( Smoothness11 * _GrungeAmmount ) , _GrungePower ) );
			float3 lerpResult319 = lerp( ( Zone0Color112 + Zone1Color113 + Zone2Color111 + Zone3Color114 + Zone4Color110 + EdgeWearColor108 + staticSwitch332 ) , Zone6Color109 , ( AO9 * GrungeMask34 ));
			float3 FinalColor137 = saturate( ( lerpResult319 * ( ( AO9 * _AODiffuseMixing ) + ( 1.0 - _AODiffuseMixing ) ) ) );
			o.Albedo = FinalColor137;
			float3 temp_cast_7 = (0.0).xxx;
			float3 temp_cast_8 = (0.0).xxx;
			float3 temp_cast_9 = (0.0).xxx;
			#if defined(_CC2BSWITCH_CC2BDUSTNOEMSSIVE)
				float3 staticSwitch333 = temp_cast_7;
			#elif defined(_CC2BSWITCH_CC2BDUSTZONE5EMISSIVE)
				float3 staticSwitch333 = ( _EmissiveIntencity * Zone5ColorMix115 );
			#elif defined(_CC2BSWITCH_CC2BEMISSIVE)
				float3 staticSwitch333 = temp_output_330_0;
			#elif defined(_CC2BSWITCH_NOCC2B)
				float3 staticSwitch333 = temp_cast_9;
			#else
				float3 staticSwitch333 = temp_cast_7;
			#endif
			float3 Emissive191 = staticSwitch333;
			o.Emission = Emissive191;
			float mettalicResult232 = saturate( ( ( Zone0MaskBase52 * _MetallicFloorZone0 ) + ( CC1R12 * _MetallicFloorZone1 ) + ( CC1G13 * _MetallicFloorZone2 ) + ( CC1B14 * _MetallicFloorZone3 ) + ( CC2R16 * _MetallicFloorZone4 ) + ( CC2G17 * _MetallicFloorZone5 ) + EdgeWear27 ) );
			o.Metallic = mettalicResult232;
			float lerpResult349 = lerp( ( ( ColorZone0Mask245 * _RoughnessZone0 ) + ( ColorZone1Mask246 * _RoughnessZone1 ) + ( ColorZone2Mask247 * _RoughnessZone2 ) + ( ColorZone3Mask248 * _RoughnessZone3 ) + ( ColorZone4Mask249 * _RoughnessZone4 ) + ( ColorZone5Mask250 * _RoughnessZone5 ) ) , _RoughnessEdgeWear , EdgeWear27);
			float lerpResult348 = lerp( lerpResult349 , _RoughnessGrunge , GrungeMask34);
			float lerpResult420 = lerp( lerpResult348 , _RoughnessDust , -CC2B18);
			float4 temp_cast_10 = (lerpResult420).xxxx;
			float4 temp_cast_11 = (lerpResult420).xxxx;
			Gradient gradient437 = NewGradient( 0, 2, 2, float4( 0, 0, 0, 0.1058824 ), float4( 0.8773585, 0.8773585, 0.8773585, 0.3441215 ), 0, 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
			float2 uv_RoughnessDetail = i.uv_texcoord * _RoughnessDetail_ST.xy + _RoughnessDetail_ST.zw;
			float4 lerpResult434 = lerp( temp_cast_10 , ( temp_cast_11 - SampleGradient( gradient437, tex2D( _RoughnessDetail, uv_RoughnessDetail ).r ) ) , _DetailRoughMultiplier);
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float fresnelNdotV459 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode459 = ( 0.0 + 0.92 * pow( 1.0 - fresnelNdotV459, 5.26 ) );
			#ifdef _RIMLIGHTING_ON
				float4 staticSwitch464 = lerpResult434;
			#else
				float4 staticSwitch464 = ( lerpResult434 + fresnelNode459 );
			#endif
			float4 finalSmooth295 = ( 1.0 - saturate( staticSwitch464 ) );
			o.Smoothness = finalSmooth295.r;
			o.Occlusion = AO9;
			o.Alpha = 1;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Standard keepalpha fullforwardshadows 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float4 tSpace0 : TEXCOORD2;
				float4 tSpace1 : TEXCOORD3;
				float4 tSpace2 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				half3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
				half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				half3 worldBinormal = cross( worldNormal, worldTangent ) * tangentSign;
				o.tSpace0 = float4( worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x );
				o.tSpace1 = float4( worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y );
				o.tSpace2 = float4( worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z );
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				float3 worldPos = float3( IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w );
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = float3( IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z );
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				SurfaceOutputStandard o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputStandard, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18800
56;572;1319;480;5211.58;-276.1884;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;19;-5140.655,-813.6512;Inherit;False;4075.92;1120.549;Texture Input;57;398;443;15;355;441;442;395;365;401;450;354;368;418;353;9;363;391;390;386;393;362;389;6;388;387;383;379;382;81;364;64;384;392;95;369;373;88;381;18;11;13;14;12;306;305;307;10;308;302;300;309;7;16;17;8;5;410;;1,1,1,1;0;0
Node;AmplifyShaderEditor.TexturePropertyNode;444;-4999.797,-321.187;Inherit;True;Property;_CC2Mask;CC2 Mask;2;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;None;5fb850ce49c741f43bb728c38aee2ea6;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;8;-4681.463,-279.8399;Inherit;True;Property;_CC2Mask_old;CC2 Mask old;2;1;[NoScaleOffset];Create;False;0;0;0;False;0;False;-1;None;89eb9b2f8da074d4aadc6dd349522002;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;16;-4391.833,-279.8399;Inherit;False;CC2R;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;17;-4391.833,-215.8399;Inherit;False;CC2G;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;410;-4997.708,-758.1188;Inherit;True;Property;_ASGMap;ASGMap;0;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;None;eb37bc35f290fa64f82f7d06770f4a3b;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;7;-4679.838,-471.8398;Inherit;True;Property;_CC1Mask;CC1 Mask;1;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;4a91151ab44e2074cab61caef9c506b1;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;309;-4178.52,-145.8965;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;302;-4201.271,-240.1189;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;176;-1047.801,-442.958;Inherit;False;1513;694;Simple Contrast/knee adjustment for wear and grunge;3;35;36;50;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;300;-4203.201,-332.833;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;5;-4732.264,-758.7197;Inherit;True;Property;_ASGMap2;ASGMap2;0;1;[NoScaleOffset];Create;False;0;0;0;False;0;False;-1;None;a5289ae850704fe4e921a5e92ec02b16;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;307;-4072.874,-181.8839;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;308;-4068.076,-276.9571;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;10;-4402.259,-694.7197;Inherit;False;Metallic;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;36;-996.8006,-392.958;Inherit;False;1412;335;Wear;6;20;22;21;27;26;23;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;20;-850.8006,-342.958;Inherit;False;10;Metallic;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;305;-3947.764,-253.7854;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;306;-3947.764,-157.7853;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;23;-946.8005,-278.958;Inherit;False;Property;_EdgeWearAmmount;Edge Wear Ammount;45;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;13;-3819.764,-157.7853;Inherit;False;CC1G;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;-610.8005,-342.958;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;14;-4391.833,-359.8399;Inherit;False;CC1B;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;12;-3817.753,-257.3914;Inherit;False;CC1R;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;26;-623.3385,-236.0709;Inherit;False;Property;_EdgeWearPower;Edge Wear Power;46;0;Create;True;0;0;0;False;0;False;1;1.65;0.22;2.2;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;174;476.2335,-437.622;Inherit;False;997.9117;485;BaseColorMask, inverse of all other zones;9;38;42;41;37;40;45;51;146;52;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;37;526.2335,-387.622;Inherit;False;16;CC2R;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;40;524.1989,-256.958;Inherit;False;12;CC1R;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;38;526.2335,-323.6223;Inherit;False;17;CC2G;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;41;524.1989,-192.958;Inherit;False;13;CC1G;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;42;524.1989,-128.958;Inherit;False;14;CC1B;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;22;-82.80083,-342.958;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;45;798.2335,-291.6223;Inherit;False;5;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;175;-4656.449,335.5491;Inherit;False;4770.954;1117.542;ZoneClorization;8;171;170;169;168;167;166;165;164;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SaturateNode;50;44.19912,-336.958;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;27;220.1992,-352.958;Inherit;False;EdgeWear;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;146;952.9634,-288.2354;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;170;-2070.864,926.5673;Inherit;False;1221;510;ColorZone5;9;158;94;157;156;97;92;91;115;250;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;158;-1956.865,1232.567;Inherit;False;27;EdgeWear;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;51;1084.199,-288.958;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;94;-1956.865,1152.567;Inherit;False;17;CC2G;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;166;-2119.803,386.3632;Inherit;False;1248.863;518.4703;ColorZone4;10;110;215;84;85;90;153;154;87;155;249;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;11;-4402.259,-630.7195;Inherit;False;Smoothness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;157;-1780.865,1184.567;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;164;-4605.476,385.5491;Inherit;False;1228.8;531.4999;ColorZone0;9;47;53;46;163;4;60;54;112;245;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;169;-3365.632,925.0906;Inherit;False;1287.807;528;ColorZone3;8;149;80;148;83;147;77;114;248;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;168;-4606.449,923.1078;Inherit;False;1234;489;ColorZone1;9;63;143;144;68;145;65;66;113;246;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;35;-997.8006,-82.95805;Inherit;False;1413;329;Grunge;7;34;33;32;31;30;29;49;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;52;1231.145,-294.5475;Inherit;False;Zone0MaskBase;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;165;-3371.885,387.1251;Inherit;False;1251.154;514.5886;ColorZone2;10;111;214;71;70;76;150;151;152;73;247;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;63;-4479.449,1133.108;Inherit;False;12;CC1R;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;31;-915.8005,-32.95805;Inherit;False;11;Smoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;73;-3245.785,597.1251;Inherit;False;13;CC1G;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;156;-1652.865,1200.567;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;53;-4507.612,620.2418;Inherit;False;52;Zone0MaskBase;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;32;-947.8005,125.6002;Inherit;False;Property;_GrungeAmmount;Grunge Ammount;37;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;80;-3220.632,1154.091;Inherit;False;14;CC1B;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;87;-1981.007,596.3628;Inherit;False;16;CC2R;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;250;-1363.478,1193.14;Inherit;False;ColorZone5Mask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;248;-2639.802,1180.403;Inherit;False;ColorZone3Mask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-643.8005,63.04196;Inherit;False;Property;_GrungePower;Grunge Power;38;0;Create;True;0;0;0;False;0;False;0.7;0.7;0.22;2.2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;246;-3881.772,1160.903;Inherit;False;ColorZone1Mask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;245;-3870.308,638.8777;Inherit;False;ColorZone0Mask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;29;-630.3506,-27.72076;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;296;-4635.48,1469.324;Inherit;False;3145.949;1120.693;SmoothNessAdjust;43;438;435;436;437;432;347;350;295;341;292;464;463;434;459;460;461;420;431;348;422;342;419;349;285;351;279;283;280;281;282;278;275;273;271;268;264;265;266;274;270;272;267;269;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;247;-2642.314,629.6193;Inherit;False;ColorZone2Mask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;249;-1390.337,618.4454;Inherit;False;ColorZone4Mask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;271;-4572.18,2159.324;Inherit;False;250;ColorZone5Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;265;-4572.18,1775.324;Inherit;False;247;ColorZone2Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;30;-115.8008,-32.95805;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;273;-4572.18,1583.324;Inherit;False;Property;_RoughnessZone0;Roughness Zone0;15;0;Create;True;0;0;0;False;0;False;0.65;0.65;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;270;-4572.18,2223.324;Inherit;False;Property;_RoughnessZone5;Roughness Zone5;35;0;Create;True;0;0;0;False;0;False;0.65;0.65;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;274;-4572.18,1711.324;Inherit;False;Property;_RoughnessZone1;Roughness Zone1;19;0;Create;True;0;0;0;False;0;False;0.65;0.65;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;264;-4572.18,1647.324;Inherit;False;246;ColorZone1Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;267;-4572.18,1967.324;Inherit;False;Property;_RoughnessZone3;Roughness Zone3;27;0;Create;True;0;0;0;False;0;False;0.65;0.698;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;269;-4572.18,2095.324;Inherit;False;Property;_RoughnessZone4;Roughness Zone4;31;0;Create;True;0;0;0;False;0;False;0.65;0.65;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;268;-4572.18,1519.324;Inherit;False;245;ColorZone0Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;266;-4572.18,1903.324;Inherit;False;248;ColorZone3Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;272;-4572.18,2031.324;Inherit;False;249;ColorZone4Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;275;-4572.18,1839.324;Inherit;False;Property;_RoughnessZone2;Roughness Zone2;23;0;Create;True;0;0;0;False;0;False;0.65;0.65;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;281;-4252.184,1935.324;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;280;-4252.184,1807.324;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;49;12.19918,-32.95805;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;279;-4252.184,1679.324;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;278;-4255.359,1540.743;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;282;-4252.184,2063.324;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;283;-4252.184,2191.324;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;350;-3908.723,1693.162;Inherit;False;Property;_RoughnessEdgeWear;Roughness Edge Wear;47;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;97;-1956.865,976.5673;Inherit;False;Property;_Color5;Color 5;32;1;[Header];Create;True;1;ColorZone5;0;0;False;0;False;1,0,1,0;1,0.6443301,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;34;216.1992,-36.95805;Inherit;False;GrungeMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;351;-3825.553,1763.59;Inherit;False;27;EdgeWear;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;285;-4039.16,1548.74;Inherit;False;6;6;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;18;-4391.833,-151.8399;Inherit;False;CC2B;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;342;-3563.311,1768.955;Inherit;False;34;GrungeMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;344;-1476.141,1473.386;Inherit;False;1647.082;591.7666;This is Just Going To be a Mess untill I find a Better Way to do this;13;324;325;331;336;330;334;332;333;191;340;189;190;345;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;419;-3334.592,1774.668;Inherit;False;18;CC2B;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;155;-1989.007,657.3628;Inherit;False;27;EdgeWear;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;152;-3246.284,669.0932;Inherit;False;27;EdgeWear;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;347;-3636.657,1696.643;Inherit;False;Property;_RoughnessGrunge;Roughness Grunge;39;0;Create;True;0;0;0;False;0;False;0.75;0.75;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;47;-4501.309,696.0551;Inherit;False;27;EdgeWear;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;143;-4478.492,1200.77;Inherit;False;27;EdgeWear;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;349;-3690.352,1555.687;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;91;-1508.865,992.5673;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;149;-3219.877,1221.544;Inherit;False;27;EdgeWear;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;212;-1380.865,1024.567;Inherit;False;MF_SimpleDetailDiffuse;-1;;121;8f1b3c672f7d6844b9a9b322ef2782cb;0;3;1;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;12;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;46;-4301.309,648.0552;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;324;-1411.954,1711.85;Inherit;False;Property;_CC2BColor;CC2B Color;41;1;[Header];Create;True;1;Dust and Emissives;0;0;False;0;False;0.8773585,0.7514915,0.6166341,0;0.8773585,0.7514915,0.6166341,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;144;-4303.448,1149.108;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;422;-3314.786,1702.675;Inherit;False;Property;_RoughnessDust;Roughness Dust;42;0;Create;True;0;0;0;False;0;False;0.8;0.8;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;431;-3172.312,1774.933;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;154;-1813.007,609.3628;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;148;-3044.834,1169.882;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;171;-839.3092,932.5456;Inherit;False;878;325;EdgeWearColor;5;105;106;107;129;108;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;151;-3071.24,617.4312;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;348;-3370.92,1556.394;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;106;-757.3092,1142.546;Inherit;False;27;EdgeWear;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;163;-4179.676,643.5488;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;147;-2916.834,1185.882;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;115;-1092.865,1024.567;Inherit;False;Zone5ColorMix;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;145;-4175.45,1165.108;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;68;-4479.449,973.1078;Inherit;False;Property;_Color1;Color 1;16;1;[Header];Create;True;1;ColorZone1;0;0;False;0;False;0,1,0,0;0.1981131,0.1981131,0.1981131,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;105;-789.3092,982.5456;Inherit;False;Property;_Color7;EdgeWearColor;44;1;[Header];Create;False;1;ColorZone7 MetalWear;0;0;False;0;False;0.3764706,0.3764706,0.3764706,0;0.3584905,0.3584905,0.3584905,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;153;-1685.007,625.3628;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;4;-4483.676,435.5491;Inherit;False;Property;_Color;Color 0;12;1;[Header];Create;False;1;ColorZone0;0;0;False;0;False;1,0,0,0;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;150;-2943.24,633.4312;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;420;-3022.297,1551.561;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;331;-1152.954,1664.85;Inherit;False;18;CC2B;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GradientNode;437;-3353.264,1898.205;Inherit;False;0;2;2;0,0,0,0.1058824;0.8773585,0.8773585,0.8773585,0.3441215;1,0;1,1;0;1;OBJECT;0
Node;AmplifyShaderEditor.ColorNode;83;-3214.632,975.0906;Inherit;False;Property;_Color3;Color 3;24;1;[Header];Create;True;1;ColorZone3;0;0;False;0;False;0,1,1,0;0.2075471,0.2075471,0.2075471,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;90;-1981.007,436.3632;Inherit;False;Property;_Color4;Color 4;28;1;[Header];Create;True;1;ColorZone4;0;0;False;0;False;1,1,0,0;1,0.6698079,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;325;-1152.954,1728.85;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;76;-3245.785,437.1251;Inherit;False;Property;_Color2;Color 2;20;1;[Header];Create;True;1;ColorZone2;0;0;False;0;False;0,0,1,0;1,0.6472527,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;432;-3440.417,1962.005;Inherit;True;Property;_RoughnessDetail;Roughness Detail;6;0;Create;True;0;0;0;False;0;False;-1;7c96a328f628ea74ebcdcc9e227d8db9;7c96a328f628ea74ebcdcc9e227d8db9;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;54;-4035.676,467.549;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;468;-2865.53,1684.957;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;70;-2813.785,453.1251;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;77;-2782.632,991.0906;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;336;-1092.704,1559.966;Inherit;False;115;Zone5ColorMix;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;392;-3596.078,196.8922;Inherit;False;250;ColorZone5Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;330;-944.954,1664.85;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;84;-1533.007,436.3632;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;65;-4047.45,973.1078;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GradientSampleNode;436;-3139.703,1965.293;Inherit;True;2;0;OBJECT;;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;167;-863.7588,389.5759;Inherit;False;928.2639;514.446;ColorZone6 Grunge Color;3;109;188;104;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;381;-3612.667,53.94315;Inherit;False;249;ColorZone4Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;107;-533.3094,998.5456;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;382;-3607.783,-60.33113;Inherit;False;248;ColorZone3Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;81;-3618.677,-117.8716;Inherit;False;Property;_Zone3TileableIntensity;Zone3 Tileable Intensity ;25;0;Create;True;0;0;0;False;0;False;0;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;383;-3609.225,-170.722;Inherit;False;247;ColorZone2Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;64;-3618.186,-361.9804;Inherit;False;Property;_Zone1TileableIntensity;Zone1 Tileable Intensity ;17;0;Create;True;0;0;0;False;0;False;0;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;95;-3615.176,116.1432;Inherit;False;Property;_Zone5TileableIntensity;Zone5 Tileable Intensity ;33;0;Create;True;0;0;0;False;0;False;0;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;379;-3618.71,-437.2046;Inherit;False;245;ColorZone0Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;88;-3617.397,1.071315;Inherit;False;Property;_Zone4TileableIntensity;Zone4 Tileable Intensity ;29;0;Create;True;0;0;0;False;0;False;0;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;373;-3624.285,-510.9993;Inherit;False;Property;_Zone0TileableIntensity;Zone0 Tileable Intensity ;13;0;Create;True;0;0;0;False;0;False;0;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;384;-3610.816,-297.5163;Inherit;False;246;ColorZone1Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;364;-4211.875,-603.3275;Inherit;True;Property;_DetailAlbedoMap1;Normal Detail;5;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;369;-3617.854,-233.3815;Inherit;False;Property;_Zone2TileableIntensity;Zone2 Tileable Intensity ;21;0;Create;True;0;0;0;False;0;False;0;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;389;-3293.871,-84.73036;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;390;-3300.106,37.5667;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;438;-2754.399,1730.965;Inherit;False;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;213;-3907.676,483.549;Inherit;False;MF_SimpleDetailDiffuse;-1;;200;8f1b3c672f7d6844b9a9b322ef2782cb;0;3;1;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;12;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;388;-3290.444,-199.4868;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;398;-2818.591,-247.7675;Inherit;False;Property;_WearHeightStrength;Wear Height Strength;48;0;Create;True;0;0;0;False;0;False;0.15;0.15;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;216;-2638.632,1023.091;Inherit;False;MF_SimpleDetailDiffuse;-1;;199;8f1b3c672f7d6844b9a9b322ef2782cb;0;3;1;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;12;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;362;-3922.942,-547.8304;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;334;-751.7397,1523.386;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;387;-3302.732,-330.1895;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;214;-2669.785,485.125;Inherit;False;MF_SimpleDetailDiffuse;-1;;196;8f1b3c672f7d6844b9a9b322ef2782cb;0;3;1;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;12;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;215;-1405.007,468.363;Inherit;False;MF_SimpleDetailDiffuse;-1;;197;8f1b3c672f7d6844b9a9b322ef2782cb;0;3;1;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;12;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;129;-405.3095,998.5456;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;340;-637.2459,1745.071;Inherit;False;Constant;_Float0;Float 0;42;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;104;-818.4949,439.5759;Inherit;False;Property;_Color6;Color 6;36;1;[Header];Create;True;1;ColorZone6 grunge;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;6;-3343.648,-772.3865;Inherit;True;Property;_BumpMap;NormalMap;3;1;[NoScaleOffset];Create;False;0;0;0;False;0;False;-1;None;7159ce5c54617184fbabd0cea014e4cc;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;393;-3316.522,134.8345;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;217;-3903.45,1021.108;Inherit;False;MF_SimpleDetailDiffuse;-1;;198;8f1b3c672f7d6844b9a9b322ef2782cb;0;3;1;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;12;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;386;-3319.489,-472.0633;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;110;-1117.007,468.363;Inherit;False;Zone4Color;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;9;-4402.259,-758.7197;Inherit;False;AO;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;461;-2727.875,1998.58;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.StaticSwitch;332;-463.9946,1628.551;Inherit;False;Property;_CC2Bswitch;CC2B switch ;43;0;Create;True;0;0;0;False;0;False;1;0;0;True;;KeywordEnum;4;CC2BDustNoEmssive;CC2BDustZone5Emissive;CC2BEmissive;NoCC2B;Create;False;True;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;460;-2707.425,1860.687;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;108;-213.3093,998.5456;Inherit;False;EdgeWearColor;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;113;-3615.45,1021.108;Inherit;False;Zone1Color;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;467;-2567.871,1722.743;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;112;-3619.676,483.549;Inherit;False;Zone0Color;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;188;-624,432;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;435;-2824.784,1659.489;Inherit;False;Property;_DetailRoughMultiplier;Detail Rough Multiplier;9;0;Create;True;0;0;0;False;0;False;0.9;0.854;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;363;-3781.294,-570.5067;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;172;754.0269,301.7415;Inherit;False;2190.679;594.2961;Final Color Mixing;20;137;160;131;319;321;318;127;320;135;136;133;134;132;130;125;128;122;123;124;121;;1,1,1,1;0;0
Node;AmplifyShaderEditor.NegateNode;418;-2529.719,-289.8423;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;353;-3052.585,-641.2862;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;111;-2365.786,485.125;Inherit;False;Zone2Color;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;114;-2323.011,1028.262;Inherit;False;Zone3Color;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;391;-3103.008,-233.0154;Inherit;False;6;6;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;124;804.0269,543.7415;Inherit;False;114;Zone3Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;128;800.6077,679.1947;Inherit;False;108;EdgeWearColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;123;804.0269,479.7416;Inherit;False;111;Zone2Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;125;804.0269,606.7415;Inherit;False;110;Zone4Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;132;1809.288,558.205;Inherit;False;9;AO;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;263;-5817.336,1496.093;Inherit;False;1129.953;961.6295;Metallic Floor Values For Each Channel;22;298;232;242;259;260;261;262;257;244;258;256;222;218;253;225;252;223;255;226;224;254;251;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;122;804.0269,415.7416;Inherit;False;113;Zone1Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;320;1217.288,606.205;Inherit;False;9;AO;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;318;1217.288,670.205;Inherit;False;34;GrungeMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;134;1809.288,654.205;Inherit;False;Property;_AODiffuseMixing;AO DiffuseMixing;10;0;Create;True;0;0;0;False;0;False;0.5;0.616;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;121;804.0269,349.7414;Inherit;False;112;Zone0Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;401;-2307.232,-517.8495;Inherit;False;Normal From Texture;-1;;201;9728ee98a55193249b513caf9a0f1676;13,149,1,147,1,143,1,141,1,139,1,151,1,137,1,153,1,159,1,157,1,155,1,135,1,108,0;4;87;SAMPLER2D;_Sampler87401;False;85;FLOAT2;0,0;False;74;SAMPLERSTATE;0;False;91;FLOAT;1.5;False;2;FLOAT3;40;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;443;-2386.873,-238.3842;Inherit;False;Property;_GrungeHeightStrength;Grunge Height Strength;40;0;Create;True;0;0;0;False;0;False;0.15;0.15;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;459;-2459.527,1858.424;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0.92;False;3;FLOAT;5.26;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;434;-2521.94,1552.747;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;368;-2573.307,-614.5901;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;354;-2861.264,-701.7808;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;109;-432,434;Inherit;False;Zone6Color;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;361;848.1083,1521.473;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;463;-2329.781,1502.492;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;224;-5767.337,1994.094;Inherit;False;Property;_MetallicFloorZone3;Metallic Floor Zone3;26;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;133;2097.288,558.205;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;365;-2351.555,-704.3558;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;130;1092.027,463.7417;Inherit;False;7;7;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;223;-5767.337,1866.094;Inherit;False;Property;_MetallicFloorZone2;Metallic Floor Zone2;22;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;226;-5767.337,2250.093;Inherit;False;Property;_MetallicFloorZone5;Metallic Floor Zone5;34;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;255;-5767.337,2058.093;Inherit;False;16;CC2R;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;450;-2123.505,-290.6581;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;253;-5767.337,1802.094;Inherit;False;13;CC1G;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;251;-5767.337,1546.093;Inherit;False;52;Zone0MaskBase;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;136;2097.288,654.205;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;321;1425.288,606.205;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;254;-5767.337,1930.094;Inherit;False;14;CC1B;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;256;-5767.337,2186.093;Inherit;False;17;CC2G;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;222;-5767.337,1738.094;Inherit;False;Property;_MetallicFloorZone1;Metallic Floor Zone1;18;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;218;-5767.337,1610.093;Inherit;False;Property;_MetallicFloorZone0;Metallic Floor Zone0;14;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;225;-5767.337,2122.093;Inherit;False;Property;_MetallicFloorZone4;Metallic Floor Zone4;30;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;252;-5767.337,1674.093;Inherit;False;12;CC1R;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;470;-2029.501,-582.846;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;127;1217.288,542.205;Inherit;False;109;Zone6Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;189;-1426.141,1886.153;Inherit;False;Property;_EmissiveIntencity;EmissiveIntencity;11;0;Create;True;0;0;0;False;0;False;1;1;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;257;-5463.336,1578.093;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;244;-5511.336,2346.093;Inherit;False;27;EdgeWear;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;260;-5463.336,1962.094;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;319;1665.288,462.2052;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;258;-5463.336,1706.093;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;259;-5463.336,1834.094;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;345;-1417.34,1972.946;Inherit;False;115;Zone5ColorMix;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;261;-5463.336,2090.093;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;442;-2001.62,-520.2008;Inherit;False;Normal From Texture;-1;;202;9728ee98a55193249b513caf9a0f1676;13,149,2,147,2,143,2,141,2,139,2,151,2,137,2,153,2,159,2,157,2,155,2,135,2,108,0;4;87;SAMPLER2D;_Sampler87442;False;85;FLOAT2;0,0;False;74;SAMPLERSTATE;0;False;91;FLOAT;1.5;False;2;FLOAT3;40;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;395;-1879.721,-704.2906;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;135;2273.288,558.205;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;464;-2192.249,1530.458;Inherit;False;Property;_RimLighting;Rim Lighting;8;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;262;-5463.336,2218.093;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;441;-1670.774,-703.5346;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;292;-1971.661,1519.802;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;131;2401.288,462.2052;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;242;-5207.335,1898.094;Inherit;False;7;7;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;190;-886.1409,1902.153;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;333;-469.7442,1779.667;Inherit;False;Property;_CC2Bswitch;CC2B switch ;43;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;4;CC2BDustNoEmssive;CC2BDustZone5Emissive;CC2BEmissive;NoCC2B;Reference;332;False;True;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;160;2529.288,478.2051;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;298;-5086.028,1893.872;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;355;-1539.66,-775.4061;Inherit;False;Property;_NormalMapFormat;NormalMapFormat;4;0;Create;True;0;0;0;False;0;False;1;1;1;True;;KeywordEnum;2;OpenGL;DirectX;Create;False;True;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;341;-1843.661,1522.197;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;15;-1263.262,-776.4338;Inherit;False;NormalMap;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;191;-72.05916,1779.519;Inherit;False;Emissive;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;232;-4894.028,1893.872;Inherit;False;mettalicResult;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;161;-5511.27,335.1269;Inherit;False;831.3411;458;Tileable texture Input and Chacing ;3;56;59;58;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;173;1487.733,-435.0443;Inherit;False;1273.303;527.9916;Output;7;0;138;140;142;192;141;139;v 0.35 I am the Yang;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;137;2673.288,462.2052;Inherit;False;FinalColor;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;295;-1690.084,1517.408;Inherit;False;finalSmooth;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;92;-1668.865,1104.567;Inherit;False;56;DetailColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;140;1516.199,-176.958;Inherit;False;232;mettalicResult;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;71;-2973.785,565.1251;Inherit;False;56;DetailColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;141;1516.199,-114.7138;Inherit;False;295;finalSmooth;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;60;-4195.676,563.5488;Inherit;False;56;DetailColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;85;-1709.007,564.3628;Inherit;False;56;DetailColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;192;1516.199,-240.958;Inherit;False;191;Emissive;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;138;1516.199,-368.958;Inherit;False;137;FinalColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;139;1516.199,-304.958;Inherit;False;15;NormalMap;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;58;-5469.672,387.1269;Inherit;True;Property;_DetailAlbedoMap;DetailTexture;7;0;Create;False;0;0;0;False;0;False;-1;None;742efabb85163d44081a018bb8ca6a79;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;142;1516.199,-48.95805;Inherit;False;9;AO;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;59;-5165.928,389.5665;Inherit;False;True;True;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;66;-4127.45,1101.108;Inherit;False;56;DetailColor;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;56;-4941.928,389.5665;Inherit;False;DetailColor;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;2163.883,-367.958;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;HaloInfinte/-DarkBlade Edit- Halo Infinite Spartan Armor;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CommentaryNode;178;-4654.112,-1171.974;Inherit;False;100;100;Comment;0;Licensed Under AGPL 3.0, You may redistribute, and modify this program, all derivitive works must carry the same license ;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;177;-4645.379,-1006.093;Inherit;False;100;100;Made for assets from Halo Infinite, Protoyped in Unreal Engine by R93_Sniper, ported to Unity in amplify by PointDevice;0;Made for assets from Halo Infinite, Protoyped in Unreal Engine by R93_Sniper, ported to Unity in amplify by PointDevice;1,1,1,1;0;0
WireConnection;8;0;444;0
WireConnection;16;0;8;1
WireConnection;17;0;8;2
WireConnection;309;0;17;0
WireConnection;302;0;7;2
WireConnection;302;1;16;0
WireConnection;300;0;7;1
WireConnection;300;1;16;0
WireConnection;5;0;410;0
WireConnection;307;0;302;0
WireConnection;307;1;309;0
WireConnection;308;0;300;0
WireConnection;308;1;309;0
WireConnection;10;0;5;2
WireConnection;305;0;308;0
WireConnection;306;0;307;0
WireConnection;13;0;306;0
WireConnection;21;0;20;0
WireConnection;21;1;23;0
WireConnection;14;0;7;3
WireConnection;12;0;305;0
WireConnection;22;0;21;0
WireConnection;22;1;26;0
WireConnection;45;0;37;0
WireConnection;45;1;38;0
WireConnection;45;2;40;0
WireConnection;45;3;41;0
WireConnection;45;4;42;0
WireConnection;50;0;22;0
WireConnection;27;0;50;0
WireConnection;146;0;45;0
WireConnection;51;0;146;0
WireConnection;11;0;5;3
WireConnection;157;0;94;0
WireConnection;157;1;158;0
WireConnection;52;0;51;0
WireConnection;156;0;157;0
WireConnection;250;0;156;0
WireConnection;248;0;80;0
WireConnection;246;0;63;0
WireConnection;245;0;53;0
WireConnection;29;0;31;0
WireConnection;29;1;32;0
WireConnection;247;0;73;0
WireConnection;249;0;87;0
WireConnection;30;0;29;0
WireConnection;30;1;33;0
WireConnection;281;0;266;0
WireConnection;281;1;267;0
WireConnection;280;0;265;0
WireConnection;280;1;275;0
WireConnection;49;0;30;0
WireConnection;279;0;264;0
WireConnection;279;1;274;0
WireConnection;278;0;268;0
WireConnection;278;1;273;0
WireConnection;282;0;272;0
WireConnection;282;1;269;0
WireConnection;283;0;271;0
WireConnection;283;1;270;0
WireConnection;34;0;49;0
WireConnection;285;0;278;0
WireConnection;285;1;279;0
WireConnection;285;2;280;0
WireConnection;285;3;281;0
WireConnection;285;4;282;0
WireConnection;285;5;283;0
WireConnection;18;0;8;3
WireConnection;349;0;285;0
WireConnection;349;1;350;0
WireConnection;349;2;351;0
WireConnection;91;0;97;0
WireConnection;91;1;156;0
WireConnection;212;1;91;0
WireConnection;46;0;53;0
WireConnection;46;1;47;0
WireConnection;144;0;63;0
WireConnection;144;1;143;0
WireConnection;431;0;419;0
WireConnection;154;0;87;0
WireConnection;154;1;155;0
WireConnection;148;0;80;0
WireConnection;148;1;149;0
WireConnection;151;0;73;0
WireConnection;151;1;152;0
WireConnection;348;0;349;0
WireConnection;348;1;347;0
WireConnection;348;2;342;0
WireConnection;163;0;46;0
WireConnection;147;0;148;0
WireConnection;115;0;212;0
WireConnection;145;0;144;0
WireConnection;153;0;154;0
WireConnection;150;0;151;0
WireConnection;420;0;348;0
WireConnection;420;1;422;0
WireConnection;420;2;431;0
WireConnection;325;0;324;0
WireConnection;54;0;4;0
WireConnection;54;1;163;0
WireConnection;468;0;420;0
WireConnection;70;0;76;0
WireConnection;70;1;150;0
WireConnection;77;0;83;0
WireConnection;77;1;147;0
WireConnection;330;0;331;0
WireConnection;330;1;325;0
WireConnection;84;0;90;0
WireConnection;84;1;153;0
WireConnection;65;0;68;0
WireConnection;65;1;145;0
WireConnection;436;0;437;0
WireConnection;436;1;432;0
WireConnection;107;0;105;0
WireConnection;107;1;106;0
WireConnection;389;0;81;0
WireConnection;389;1;382;0
WireConnection;390;0;88;0
WireConnection;390;1;381;0
WireConnection;438;0;468;0
WireConnection;438;1;436;0
WireConnection;213;1;54;0
WireConnection;388;0;369;0
WireConnection;388;1;383;0
WireConnection;216;1;77;0
WireConnection;362;0;364;2
WireConnection;334;0;336;0
WireConnection;334;1;330;0
WireConnection;387;0;64;0
WireConnection;387;1;384;0
WireConnection;214;1;70;0
WireConnection;215;1;84;0
WireConnection;129;0;107;0
WireConnection;393;0;95;0
WireConnection;393;1;392;0
WireConnection;217;1;65;0
WireConnection;386;0;373;0
WireConnection;386;1;379;0
WireConnection;110;0;215;0
WireConnection;9;0;5;1
WireConnection;332;1;334;0
WireConnection;332;0;330;0
WireConnection;332;2;336;0
WireConnection;332;3;340;0
WireConnection;108;0;129;0
WireConnection;113;0;217;0
WireConnection;467;0;438;0
WireConnection;112;0;213;0
WireConnection;188;0;104;0
WireConnection;363;0;364;1
WireConnection;363;1;362;0
WireConnection;418;0;398;0
WireConnection;353;0;6;2
WireConnection;111;0;214;0
WireConnection;114;0;216;0
WireConnection;391;0;386;0
WireConnection;391;1;387;0
WireConnection;391;2;388;0
WireConnection;391;3;389;0
WireConnection;391;4;390;0
WireConnection;391;5;393;0
WireConnection;401;87;410;0
WireConnection;401;91;418;0
WireConnection;459;0;460;0
WireConnection;459;4;461;0
WireConnection;434;0;420;0
WireConnection;434;1;467;0
WireConnection;434;2;435;0
WireConnection;368;0;363;0
WireConnection;368;1;391;0
WireConnection;354;0;6;1
WireConnection;354;1;353;0
WireConnection;109;0;188;0
WireConnection;361;0;332;0
WireConnection;463;0;434;0
WireConnection;463;1;459;0
WireConnection;133;0;132;0
WireConnection;133;1;134;0
WireConnection;365;0;354;0
WireConnection;365;1;368;0
WireConnection;130;0;121;0
WireConnection;130;1;122;0
WireConnection;130;2;123;0
WireConnection;130;3;124;0
WireConnection;130;4;125;0
WireConnection;130;5;128;0
WireConnection;130;6;361;0
WireConnection;450;0;443;0
WireConnection;136;0;134;0
WireConnection;321;0;320;0
WireConnection;321;1;318;0
WireConnection;470;0;401;40
WireConnection;257;0;251;0
WireConnection;257;1;218;0
WireConnection;260;0;254;0
WireConnection;260;1;224;0
WireConnection;319;0;130;0
WireConnection;319;1;127;0
WireConnection;319;2;321;0
WireConnection;258;0;252;0
WireConnection;258;1;222;0
WireConnection;259;0;253;0
WireConnection;259;1;223;0
WireConnection;261;0;255;0
WireConnection;261;1;225;0
WireConnection;442;87;410;0
WireConnection;442;91;450;0
WireConnection;395;0;365;0
WireConnection;395;1;470;0
WireConnection;135;0;133;0
WireConnection;135;1;136;0
WireConnection;464;1;463;0
WireConnection;464;0;434;0
WireConnection;262;0;256;0
WireConnection;262;1;226;0
WireConnection;441;0;395;0
WireConnection;441;1;442;40
WireConnection;292;0;464;0
WireConnection;131;0;319;0
WireConnection;131;1;135;0
WireConnection;242;0;257;0
WireConnection;242;1;258;0
WireConnection;242;2;259;0
WireConnection;242;3;260;0
WireConnection;242;4;261;0
WireConnection;242;5;262;0
WireConnection;242;6;244;0
WireConnection;190;0;189;0
WireConnection;190;1;345;0
WireConnection;333;1;340;0
WireConnection;333;0;190;0
WireConnection;333;2;330;0
WireConnection;333;3;340;0
WireConnection;160;0;131;0
WireConnection;298;0;242;0
WireConnection;355;1;6;0
WireConnection;355;0;441;0
WireConnection;341;0;292;0
WireConnection;15;0;355;0
WireConnection;191;0;333;0
WireConnection;232;0;298;0
WireConnection;137;0;160;0
WireConnection;295;0;341;0
WireConnection;59;0;58;0
WireConnection;56;0;59;0
WireConnection;0;0;138;0
WireConnection;0;1;139;0
WireConnection;0;2;192;0
WireConnection;0;3;140;0
WireConnection;0;4;141;0
WireConnection;0;5;142;0
ASEEND*/
//CHKSM=672F0ABC0E8018C190C62B152A486E7DD22356BA
Shader "Custom/C_3_2"
{
    Properties
    {
        _Bump("Bump",2D) = "bump"{}
        _Depth("Depth",Range(0,50)) = 1 
        _Cube("Cube Map",CUBE) = "white"{}
        _Metallicity("Metallicity", Range(0,1)) = 0
    }

    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _Bump;
        half _Depth;
        samplerCUBE _Cube;
        half _Metallicity;
        
        struct Input 
            {
                float2 uv_Bump;
                float3 worldRefl; INTERNAL_DATA
            };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = texCUBE(_Cube,IN.worldRefl).rgb;
            o.Normal = UnpackNormal(tex2D(_Bump,IN.uv_Bump)) * 0.3;
            o.Normal *= float3(_Depth,_Depth,1);
            o.Emission = texCUBE(_Cube,WorldReflectionVector (IN,o.Normal)).rgb;
            o.Emission *= float3 (_Metallicity,_Metallicity,_Metallicity);
        }
        ENDCG

    }
    FallBack "Diffuse"

}
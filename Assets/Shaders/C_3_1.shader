Shader "Custom/C_3_1"
{
    Properties
    {
        _Diffuse("Diffuse",2D) = "white"{}
        _Bump("Bump",2D) = "bump"{}
        _Bump_Range("Bump_Range",Range(0.1,10)) = 1 
        _Depth("Depth",Range(0,50)) = 1 
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

        struct Input 
            {
                float2 uv_Diffuse;
                float2 uv_Bump;
            };

        sampler2D _Diffuse;
        sampler2D _Bump;
        half _Bump_Range;
        half _Depth;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = tex2D(_Diffuse, IN.uv_Diffuse).rgb ;
            o.Normal = UnpackNormal(tex2D(_Bump, IN.uv_Bump)) * _Bump_Range;
            o.Normal *= float3(_Depth,_Depth,1);
        }
        ENDCG

    }
    FallBack "Diffuse"
}
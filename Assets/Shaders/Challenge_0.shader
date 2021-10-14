Shader "Custom/Challenge_0"
{
    Properties
    {
        _Tint("Tint",Color) = (1,1,1,1)
        _Emission("Emission",Color) = (1,1,1,1)
        _Normal("Normal",Color) = (1,1,1,1)
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

        struct Input {

                float2 uv_MainTex;

            };

        fixed3 _Tint;
        fixed3 _Emission;
        fixed3 _Normal;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = _Tint;
            o.Emission = _Emission;
        }
        ENDCG

    }
    FallBack "Diffuse"
}

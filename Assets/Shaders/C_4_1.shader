Shader "Custom/C_4_1"
{
    Properties
    {
        _Rim("Rim",Color) = (0,0.5,0.5,0.0)
        _Rim_Power("Rim Power",Range(0,5)) = 1
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
            float3 viewDir;
            float3 worldPos;
        };

        fixed3 _Rim;
        half _Rim_Power;
        
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            half saturation = 1 - saturate(dot(normalize(IN.viewDir),o.Normal));
            o.Emission = _Rim * pow(saturation,_Rim_Power);
        }
        ENDCG
    }
    FallBack "Diffuse"
}

Shader "Custom/C_6_1"
{
    Properties
    {
        _RimColor("Rim Color",Color) = (0,0.5,0.5,0.0)
        _RimPower("Rim Power", Range(0.5,8)) = 3.0
    }

    SubShader
    {
        Tags { "Queue"="Transparent" }
        LOD 200

        Pass
        {
            ZWrite On
            ColorMask 0
        }
        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        struct Input
        {
            float3 viewDir;
            float3 worldPos;
            float2 uv_Texture;
        };

        fixed3 _Tint1;
        fixed3 _Tint2;
        half _Band_Width;
        sampler2D _Texture;
        
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            half saturation = 1 - saturate(dot(normalize(IN.viewDir),o.Normal));
            if(frac(IN.worldPos.y * 10 * 0.5) > _Band_Width)
            {
                o.Emission = _Tint1;
            }
            else
            {
                o.Emission = _Tint2;
            }
            o.Albedo = tex2D(_Texture,IN.uv_Texture) ;
            
        }
        ENDCG
    }
    FallBack "Diffuse"
}

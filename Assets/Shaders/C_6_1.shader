Shader "Custom/C_4_2"
{
    Properties
    {
        _Tint1("Tint 1",Color) = (0,0.5,0.5,0.0)
        _Tint2("Tint 2",Color) = (1,0.5,1.0,0.0)
        _Band_Width("Band With", Range(0,5)) = 1
        _Texture("Texture", 2D) = "white"{} 

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

Shader "Custom/Challenge_2"
{
    Properties
    {
        _Tint("Tint",Color) = (1,1,1,1)
        _Range("Range",Range(0,5)) = 1
        _Texture("Texture",2D) = "white"{} 
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
                float2 uv_Texture;
            };

        fixed3 _Tint;
        half _Range;
        sampler2D _Texture;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = (tex2D(_Texture,IN.uv_Texture) * _Range).rgb;
            o.Albedo.g = 1;
        }
        ENDCG

    }
    FallBack "Diffuse"
}

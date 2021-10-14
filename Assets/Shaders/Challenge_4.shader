Shader "Custom/Challenge_4"
{
    Properties
    {
        _Diffuse("Diffuse",2D) = "white"{}
        _Emissive("Emissive",2D) = "white"{}
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

                float2 uv_Diffuse;
                float2 uv_Emissive;

            };

        sampler2D _Diffuse;
        sampler2D _Emissive;


        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            
            o.Albedo = (tex2D(_Diffuse, IN.uv_Diffuse) );
            o.Emission = (tex2D(_Emissive, IN.uv_Emissive) );

        }
        ENDCG
    }
    FallBack "Diffuse"
}
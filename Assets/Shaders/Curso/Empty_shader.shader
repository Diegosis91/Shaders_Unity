Shader "Custom/Empty_Shader"
{
    Properties
    {

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
            
        };


        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            
        }
        ENDCG
    }
    FallBack "Diffuse"
}

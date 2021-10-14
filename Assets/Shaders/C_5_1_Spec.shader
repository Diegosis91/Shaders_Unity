Shader "Custom/C_5_1_Spec" {
Properties{
		_Color("Color", Color) = (1,1,1,1)
        _MetallicTex ("Metallic (R)", 2D) = "white" {}
        _SpecColor("Specular", Color) = (1,1,1,1)
		_Emission("Emission", Range(0,5)) = 0.5
		_Spec("Spec", Range(0,5)) = 0.5
	}
	SubShader{
		Tags{
			"Queue" = "Geometry"
		}

		CGPROGRAM
		#pragma surface surf StandardSpecular

        sampler2D _MetallicTex;
        fixed4 _Color;
		half _Emission;
		half _Spec;

		struct Input {
			float2 uv_MetallicTex;
		};

		void surf(Input IN, inout SurfaceOutputStandardSpecular o) {
            o.Albedo = _Color.rgb ;
            o.Smoothness = tex2D (_MetallicTex, IN.uv_MetallicTex).r ;
            o.Specular = _SpecColor.rgb * _Spec;
            o.Emission = tex2D (_MetallicTex, IN.uv_MetallicTex).r * _Emission;
		}
		ENDCG
	}
	FallBack "Diffuse"

}

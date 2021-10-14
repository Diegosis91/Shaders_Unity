Shader "Custom/C_5_3" {
Properties{
		_Color("Color", Color) = (1,1,1)
        _RampTex("Ramp Texture", 2D) = "white"{}
	}
	SubShader{
		
		CGPROGRAM
		#pragma surface surf ToonRamp

        sampler2D _RampTex;
        fixed3 _Color;

		struct Input {
			float2 uv_MainTex;
            float3 viewDir; 
		};

		float4 LightingToonRamp (SurfaceOutput surff, fixed3 lightDir, fixed atten)
        {
            float diff = dot(surff.Normal, lightDir);
            float factorxy = diff * 0.5 + 0.5;
            float2 factor = factorxy;
            float3 ramp = tex2D(_RampTex,factor).rgb;
            
            float4 output;
            output.rgb = surff.Albedo * _LightColor0.rgb * ramp;
            output.a = surff.Alpha;
            return output;
        }

        void surf (Input IN, inout SurfaceOutput o)
        {
            float diff2 = dot(o.Normal, IN.viewDir);
            float h = diff2 * 0.5 + 0.5;
			float2 rh = h;
			o.Albedo = tex2D(_RampTex, rh).rgb;
        } 
		ENDCG
	}
	FallBack "Diffuse"

}


Shader "LT/Lesson1"
{
	Properties {
        _Color ("Main Color", Color ) = (1,0,0,1)
    }

	SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			uniform float4 _Color;

			float4  vert(float4 v : POSITION) : SV_POSITION
			{
				return UnityObjectToClipPos(v * float4(2, 0.5, 5, 1));
			}

			fixed4 frag(void) : COLOR
			{
				return _Color;
			}

			ENDCG
		}
	}
}
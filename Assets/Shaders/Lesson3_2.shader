//https://www.cnblogs.com/coldcode/p/5546617.html

Shader "LT/Lesson3_Transparent"
{
	Properties
	{
		_Color("Color", Color) = (1, 1, 1, 0.5)
    }

	SubShader
	{
		Tag

		Pass
		{
			Cull Off
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			uniform float4 _Color;

			appdata_base vert(appdata_base input)
			{
				input.texcoord = input.vertex;
				input.vertex = UnityObjectToClipPos(input.vertex);
				return input;
			}

			fixed4 frag(appdata_base input) : COLOR
			{
				if(input.texcoord.y < 0)
				{
					discard;
				}
				return _Color;
			}

			ENDCG
		}
	}
}
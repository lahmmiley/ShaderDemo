
Shader "LT/Lesson3_Cull"
{
	Properties
	{
		_Color("Color", Color) = (1, 1, 1, 1)
    }

	SubShader
	{
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
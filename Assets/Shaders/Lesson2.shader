
Shader "LT/Lesson2"
{
	Properties {
		_OffsetX ("Offset X", Range(-1.5, 1.5)) = 0
		_OffsetY ("Offset Y", Range(-1.5, 1.5)) = 0
		_OffsetZ ("Offset Z", Range(-1.5, 1.5)) = 0
    }

	SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			struct VertextOutput {
				float4 pos : SV_POSITION;
				fixed4 col : COLOR;
			};

			uniform float _OffsetX;
			uniform float _OffsetY;
			uniform float _OffsetZ;

			VertextOutput vert(appdata_base input)
			{
				VertextOutput result;
				result.pos = UnityObjectToClipPos(input.vertex);
				result.col = input.vertex + float4(_OffsetX, _OffsetY, _OffsetZ, 0);
				return result;
			}

			fixed4 frag(VertextOutput input) : COLOR
			{
				return input.col;
			}

			ENDCG
		}
	}
}
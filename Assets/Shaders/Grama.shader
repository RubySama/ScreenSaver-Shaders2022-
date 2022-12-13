Shader "Unlit/Grama"
{
    Properties
    {
        _MainText("Texture", 2D) = "white" {}
    }

        SubShader
    {
        Tags { "RenderType" = "Opaque"}
        LOD 100

        Pass
        {

            HLSLPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

                struct Attributes
                {

                    float4 position : POSITION;
                    float2 uv : TEXCOORD0;
                };

                struct Varyings
                {
                    float4 positionVAR : SV_POSITION;
                    float2 uvVAR : TEXCOORD0;
                };

                Varyings vert(Attributes Input)
                {
                    Varyings Output;


                    Output.positionVAR = TransformObjectToHClip(Input.position.xyz);
                    Output.uvVAR = Input.uv;

                    return Output;
                }

                float4 frag(Varyings Input) : SV_TARGET
                {
                    float4 color = float4(0.5, 0.7, 0.5, 1.0);

                    return color;
                }



            ENDHLSL
        }
    }
}

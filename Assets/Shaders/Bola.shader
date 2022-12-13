Shader "Unlit/Bola"
{
    Properties
    {
        _MainText ("Texture", 2D) = "white" {}
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
                    float2 center_pos = float2(0.4, 0.5);
                    float circle = length(float2(Input.uvVAR.x, Input.uvVAR.y) - center_pos);

                    float4 color = float4( .0, .2, .0, 1.0);
                    if(circle < 0.25)
                        color = float4(1.0, 0.0, 0.0, 1.0);

                    return color;
                }


            
            ENDHLSL
        }
    }
}

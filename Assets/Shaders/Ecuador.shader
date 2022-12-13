Shader "Unlit/Ecuador"
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
            //muda a linguagem pro HLSL
            HLSLPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

                struct Attributes
                {
        //:POSITION � uma diretiva de p�s compila��o
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

        //Output.positionVAR = Input.position;
        Output.positionVAR = TransformObjectToHClip(Input.position.xyz);
        Output.uvVAR = Input.uv;

        return Output;
    }
    //var de 4 dimens�es: RGBA
    float4 frag(Varyings Input) : SV_TARGET
    {
        float4 color = float4(0, 0.0, 0.5, 1.0);
        if (Input.uvVAR.x > 0.5)
            color = float4(1.0, 0.5, 0, 1.0);
        else if (Input.uvVAR.x > 0.25)
            color = float4(0.3, 0.0, 0, 1.0);

        float2 center_pos = float2(0.5, 0.5);
        float circle = length(float2(Input.uvVAR.x, Input.uvVAR.y) - center_pos);

        if (circle < 0.15)//Input.uvVAR.y > 0.5)
            color = float4(0.05, 0.05, 0.05, 1.0);

        return color;
    }


        //termina o c�digo em HLSL
        ENDHLSL
    }
    }
}
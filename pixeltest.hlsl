
cbuffer ConstantBuffer : register(b0)
{
    matrix world;
    matrix view;
    matrix proj;
    float3 vLightDir;
}

SamplerState mySampler : register(s0);
Texture2D myTexture : register(t0);

struct PsInput
{
    float4 pos : SV_Position;
    float3 norm : NORMAL;
    float4 col : COLOR;
    float2 uv : TEXCOORD;
};

float4 main(const PsInput input) : SV_Target
{
    float light = saturate(dot(input.norm, vLightDir));
    float4 diffuse = myTexture.Sample(mySampler, input.uv);
    float3 color = 0.5 * (input.col.xyz + diffuse.xyz) * light;
    return float4(color.xyz, 1);
}

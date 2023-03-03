
struct VS_OUTPUT
{
    float4 pos : SV_POSITION;
    float4 col : COLOR;
};

VS_OUTPUT vs_main(float3 pos : POSITION, float3 col : COLOR)
{
    VS_OUTPUT Out;
    Out.pos = float4(pos.xyz, 1);
    Out.col = float4(col.rgb, 1);
	return Out;
}

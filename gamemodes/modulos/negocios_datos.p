// Shared declarations for public storefronts and configured initial prices.
#define RP_BIZ_PUBLIC (6)
#define RP_PUBLIC_MAX (256)
#define RP_PUBLIC_BUY (31005)
#define RP_BIZ_ADMIN_CONFIRM (31006)
enum RP_PublicData {
    pbID, pbDoor, pbKind, pbOwner, pbName[64], pbOwnerName[25], bool:pbActive,
    Float:pbX, Float:pbY, Float:pbZ, Float:pbA,
    Float:pbInsideX, Float:pbInsideY, Float:pbInsideZ, Float:pbInsideA,
    pbInterior, pbWorld, Text3D:pbLabel, pbPickup
};
new RP_Public[RP_PUBLIC_MAX][RP_PublicData];
enum RP_PriceData { bpType, bpDB, bpPrice, bpCurrency };
new RP_BizPrices[1024][RP_PriceData];
new RP_PublicInside[MAX_PLAYERS];
enum RP_InitialQuote { bqType, bqIndex, bqDB, bqPrice, bqCurrency, bqExpiry, bqGeneration, bool:bqProcessing };
new RP_Quote[MAX_PLAYERS][RP_InitialQuote];
new RP_AdminType[MAX_PLAYERS], RP_AdminDB[MAX_PLAYERS], RP_AdminAction[MAX_PLAYERS];

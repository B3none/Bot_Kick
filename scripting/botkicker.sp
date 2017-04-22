#include <sourcemod>
#include <colors>
#pragma newdecls required

#define TAG_MESSAGE "[\x0CB3none_BotKick\x01]"

public Plugin myinfo =
{
    name = "Bot Removal",
    author = "B3none",
    description = "Ensures that there are 0 bots in the server.",
    version = "0.0.2"
}

Handle g_Cvar_bot_quota = INVALID_HANDLE;
int g_bot_quota
int g_max_players

public void OnConfigsExecuted()
{
    g_Cvar_bot_quota = FindConVar("bot_quota");
    g_bot_quota = GetConVarInt(g_Cvar_bot_quota);
    g_max_players = GetMaxClients();
}

public void OnClientPutInServer(int client)
{
    if(!IsFakeClient(client))
    {
        return;
    }
    
    if(g_bot_quota < GetConVarInt(g_Cvar_bot_quota))
    {
        SetConVarInt(g_Cvar_bot_quota, g_bot_quota);
    }
    
    int i;
    int count;
    
    for(i = 1; i<=g_max_players; i++)
    {
        if(IsClientInGame(i) && GetClientTeam(i)>1)
        {
            count++;
        }
    }
    
    if(count<=g_bot_quota)
    {
        return;
    }
    
    char name[32];
    if(!GetClientName(client, name, sizeof(name)))
    {
        return;
    }
    
    ServerCommand("bot_kick %s", name);
    PrintToChatAll("%s Bot %s has been kicked.", TAG_MESSAGE, name);
} 

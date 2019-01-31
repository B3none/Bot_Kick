#include <sourcemod>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo =
{
    name = "Bot Removal",
    author = "B3none",
    description = "Ensures that there are 0 bots in the server.",
    version = "0.0.3"
    "url" = "https://github.com/b3none"
}

public void OnPluginStart()
{
	HookEvent("round_start", OnRoundStart);
}

public Action OnRoundStart(Handle event, const char[] name, bool dontBroadcast)
{
	ServerCommand("bot_kick");
}

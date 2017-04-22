#include <sourcemod>
#pragma newdecls required

#define TAG_MESSAGE "[\x0CB3none_BotRemoval\x01]"

public Plugin myinfo =
{
    name = "Bot Removal",
    author = "B3none",
    description = "Ensures that there are 0 bots in the server.",
    version = "0.0.2"
}

public void OnPluginStart()
{
	HookEvent("round_start", OnRoundStart);
}

public Action OnRoundStart(Handle event, const char[] name, bool dontBroadcast)
{
	ServerCommand("bot_kick");
	PrintToChatAll("%s New round has begun, no bots allowed!");
}

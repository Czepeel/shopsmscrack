#include <sourcemod>
#include <functions>

public void OnAllPluginsLoaded() {
	Handle hPlugin = FindPluginByFile("shopsms.smx");
	if (hPlugin == INVALID_HANDLE) {
		PrintToServer("[SHOPSMSCRACK] File shopsms.smx not found.");
		return;
	}
	
	Function funcAction = GetFunctionByName(hPlugin, "ValidateLicenseCallback");
	if (funcAction != INVALID_FUNCTION) {
		Call_StartFunction(hPlugin, funcAction);
		Call_PushCell(0);
		Call_PushString("updated");
		Call_PushCell(-1);
		Call_PushCell(0);
		Call_Finish();
		PrintToServer("[SHOPSMSCRACK] Shopsms license - success.");
	} else {
		PrintToServer("[SHOPSMSCRACK] Shopsms license - failed.");
	}
}
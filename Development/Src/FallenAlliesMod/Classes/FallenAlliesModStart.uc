// [Fallen Allies Mod (2021)]

class FallenAlliesModStart extends EventMutator;

function OnEventManagerCreated(EventManager Manager)
{
    Manager.AddListener(new class'FallenAlliesListener');
    `log("MOD LOADED: Fallen Allies");
}

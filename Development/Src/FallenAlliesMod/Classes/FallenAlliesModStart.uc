// [Fallen Allies Mod (2021)]

class FallenAlliesModStart extends ModStart;

function OnStart(CorePlayerController Core)
{
    Core.AddPlugin(new class'FallenAlliesPlugin');
}

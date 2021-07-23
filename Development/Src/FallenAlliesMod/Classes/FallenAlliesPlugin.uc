// [Fallen Allies Mod (2021)]

// When an ally is defeated in battle, this mod writes their name,
// character level, and class into the in-game journal under a "Fallen
// Allies" section, in the "Peoples" category.
//
// This mod also ensures the custom journal entry is saved directly in
// save files.
class FallenAlliesPlugin extends Plugin;

var RPGTacJournalEntry CustomEntry;

// Override. Instantiate the custom journal entry we'll
// be working with.
function OnInitialization()
{
    if(CustomEntry == none)
    {
        CustomEntry = Core.Spawn(class'RPGTacJournalEntry',,,,,,true);
        CustomEntry.EntryName = "Fallen Allies";
        CustomEntry.Category = EJournal_People;
        Core.AddJournalEntry(CustomEntry);
    }
}

// Override. Update the custom journal entry whenever
// an ally is defeated.
function OnPawnDefeated(RPGTacPawn DefeatedPawn, bool IsAlly) 
{
    if(IsAlly)
    {
        // CustomEntry = GetJournalEntry();
        CustomEntry.EntryInfo = CustomEntry.EntryInfo 
            $ DefeatedPawn.CharacterName 
            $ " (lvl. " $ DefeatedPawn.CharacterLevel $ " "
            $ DefeatedPawn.CharacterClasses[DefeatedPawn.CurrentCharacterClass].ClassName
            $ ")\n";
    }
}

// Override. Temporarily remove the custom entry
// from the main journal entries array so it doesn't get
// serialized with other base-game entries. This is done 
// because normal journal entries do not serialize their
// contents; they serialize name and object archetype.
// The Fallen Allies journal entry doesn't have an archetype
// and cause an error if loaded like a normal entry.
function PreSerialize()
{
    Core.JournalEntries.RemoveItem(CustomEntry);
}

// Override. Save this mod's custom entry content
// as a separate json entity in the save file.
function JSonObject Serialize()
{
    local JSonObject Data;

    Data = new () class'JSonObject';
    Data.SetStringValue("JournalEntry", CustomEntry.EntryInfo);

    return Data;
}

// Override. Per PreSerialize(), we return the custom journal entry
// back into the main journal entries array.
function PostSerialize()
{
    Core.AddJournalEntry(CustomEntry);
}

// Override. Populate the custom journal entry with content
// from the player's save file.
function Deserialize(JSonObject Data)
{
    //`log("DEBUG" $ Id $ " is deserializing 'JournalEntry'");
    CustomEntry.EntryInfo = Data.GetStringValue("JournalEntry");
}

/*
private function RPGTacJournalEntry GetCustomEntry()
{
    local RPGTacJournalEntry Entry;

    foreach Core.JournalEntries(Entry) 
    {
        if(Entry.EntryName == "Fallen Allies" && Entry.Category == EJournal_People)
        {
            return Entry;
        }
    }

    return none;
}
*/

DefaultProperties
{
    Id = "FallenAllies"
}

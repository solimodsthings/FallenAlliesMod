// [Fallen Allies Mod (2021)]

// When an ally is defeated in battle,
// this mod writes their name, character level, and class
// into the in-game journal under a "Fallen Allies" section,
// in the "Peoples" category.
//
// This mod also ensures the custom journal entry is saved
// directly in save files.
class FallenAlliesListener extends EventListener;

var EventManager Parent;

function OnInitialization(EventManager Manager)
{
    self.Parent = Manager;
    self.Id = "FallenAllies";
}

function OnPawnDefeated(RPGTacPawn DefeatedPawn, bool IsAlly) 
{
    local RPGTacJournalEntry Entry;

    if(IsAlly)
    {
        Entry = GetDefeatedAllyJournalEntry();
        Entry.EntryInfo = Entry.EntryInfo 
            $ DefeatedPawn.CharacterName 
            $ " (lvl " $ DefeatedPawn.CharacterLevel $ " "
            $ DefeatedPawn.CharacterClasses[DefeatedPawn.CurrentCharacterClass].ClassName
            $ ")\n";
    }
}

private function RPGTacJournalEntry GetDefeatedAllyJournalEntry()
{
   local RPGTacJournalEntry Entry;

    foreach Parent.JournalEntries(Entry) 
    {
        if(Entry.EntryName == "Fallen Allies" && Entry.Category == EJournal_People)
        {
            return Entry;
        }
    }

    // This part only executes if the journal entry doesn't exist yet
    Entry = Parent.SpawnJournalEntryInstance();
    Entry.EntryName = "Fallen Allies";
    Entry.Category = EJournal_People;
    Parent.AddJournalEntry(Entry);

    return Entry;
}

function JSonObject Serialize()
{
    local RPGTacJournalEntry Entry;
    local JSonObject Data;

    Entry = GetDefeatedAllyJournalEntry();

    Data = new () class'JSonObject';
    Data.SetStringValue("JournalEntry", Entry.EntryInfo);

    return Data;
}

function Deserialize(JSonObject Data)
{
    local RPGTacJournalEntry Entry;

    Entry = GetDefeatedAllyJournalEntry();
    Entry.EntryInfo = Data.GetStringValue("JournalEntry");
}
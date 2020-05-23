/* Dead Cells Autosplitter (17-May-2020)
 * Maintained by R30hedron (@R30hedron#9520 on Discord)
 * Special thanks to Mintys (@Minty#4831) and Blargel (@Blargel#0213) for previously creating/maintaining the autosplitter.
 * Thanks to Midknight13 (@Midknight13#3966) for verifying GOG version addresses
 * 
 * Currently works for the following Dead Cells versions. Additional versions added by request.
 *     Steam v. 1.6.2
 *     Steam v. 1.8.5
 *     GOG   v. 1.7.1
 */

 /*
  * Update notes:
  * To add a new version of the game to the autosplitter, do the following:
  * 1) Find the following memory addresses:
  *    - Stage name: Will be hooked into the "discord.hdll" module
  *    - Time: Will be hooked into the "libhl.dll" module.
  *    - X and Y coordinates for the player
  *       We need both the X and Y coordinates for the beheaded and the head separately.
  *       Easiest way to do so is to use the left door in the Throne Room, which should have an
  *       X coordinate of 490.8
  * 2) Add a new state, following the conventions below.
  * 3) Calculate the MD5 hashes for the version's deadcells.exe and deadcells_gl.exe and
  *    add them to the switch cases in the init function
  */

state("deadcells", "1.6.2") {
    string11 stage   : "discord.hdll", 0x1574, 0x1C;
    double   time    : "libhl.dll", 0x49184, 0x434, 0x0, 0x58, 0x5C, 0x28;
    int      control : "libhl.dll", 0x49184, 0x434, 0x0, 0x58, 0x68, 0xF8, 0xA0;
    double   headx   : "libhl.dll", 0x49184, 0x434, 0x0, 0x58, 0x68, 0xF8, 0xA0, 0x200;
    double   playerx : "libhl.dll", 0x49184, 0x434, 0x0, 0x58, 0x64, 0x200;
    double   playery : "libhl.dll", 0x49184, 0x434, 0x0, 0x58, 0x64, 0x208;
    int      health  : "libhl.dll", 0x49184, 0x434, 0x0, 0x58, 0x64, 0xE8;
}

state("deadcells", "1.8.5") {
    string11 stage   : "discord.hdll", 0x1574, 0x1C;
    double   time    : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x5C, 0x20;
    int      control : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x68, 0xF8, 0xA0;
    double   headx   : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x68, 0xF8, 0xA0, 0x200;
    double   playerx : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x64, 0x200;
    double   playery : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x64, 0x208;
    int      health  : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x64, 0xE8;
}

state("deadcells", "Unknown Version") {
    string11 stage   : "discord.hdll", 0x1574, 0x1C;
    double   time    : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x5C, 0x20;
}

/* Variable Info
 * [stage]   : Contains the current level name. Used for splits
 * 
 * [time]    : Stores the current in-game timer value.
 *
 * [control] : Memory address for what object is controlled by the player.
 *             If equal to zero, player does not have control.
 *
 * [headx]   : Stores the x coordinates for the head of the Beheaded.
 *             headx > 2020 means you just (probably) barely entered the fountain
 * 
 * [playerx]
 * [playery] : Stores the x and y coordinates for the Beheaded, but not the head.
 *             Used to determine if the player's body is in a certain region to mean you've ended the run
 *             playerx > 1465 means you are far enough forward in Throne Room
 *             playery < 1100 means you are in the final room in the Collector boss fight
 * 
 * [health]  : Stores current player health
 *             Used as a failsafe to prevent the timer splitting if the player dies in the Collector boss fight
 */

gameTime {
    //runs at all times when the timer is running.
    //returns in-game time
    return TimeSpan.FromSeconds(current.time);
}

isLoading {
    return true;
}

startup
{
    //runs when starting livesplit
    //options added here
    
    //Localization strings
    vars.pq = new List<string> {
    	"Prisoners' ",
	"Quartier de"  // French
    };
    vars.passage = new List<string> {
        "Passage to ",
        "Passageway ",
        "Passage ver"  // French
    };
    vars.throne = new List<string> {
        "Throne Room",
        "Salle du tr"  // French
    };
    vars.observatory = new List<string> {
        "Observatory",
        "Observatoir"  // French
    };
    
    settings.Add("enter", false, "Split on entering transition");
    settings.SetToolTip("enter", "Enable splits on entering \"Passage to\" areas.");
    
    settings.Add("leave", true, "Split on leaving transition");
    settings.SetToolTip("leave", "Enable splits on leaving \"Passage to\" areas (on by default).");
    
    settings.Add("debug", false, "Print debug statements");
    settings.SetToolTip("debug", "Prints debug statements to console; can be viewed through DebugView");
}

init
{
    //runs once when starting Dead Cells.
    //Used to determine version
    //print("init");
    
    //md5 checksum code adapted from Zment's Defy Gravity autosplitter
    
    byte[] exeMD5HashBytes = new byte[0];
    using (var md5 = System.Security.Cryptography.MD5.Create())
    {
        using (var s = File.Open(modules.First().FileName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
        {
            exeMD5HashBytes = md5.ComputeHash(s);
        }
    }
    
    var MD5Hash = exeMD5HashBytes.Select(x => x.ToString("X2")).Aggregate((a, b) => a + b);
    print("MD5: " + MD5Hash);
    
    
    switch (MD5Hash)
    {
        case "44775C673E44220D82B54A43DDE45606": //1.6.2
        case "7C89DD5B7AFDD68F60ACFF657C65E261": //1.6.2_gl
            version = "1.6.2";
            break;
	case "B09AA0C6C1B9E323F3DF47ECC6AE40FD": //1.7.1 GOG
        case "86666DB94BF117E113DCC2687E619E86": //1.7.1_gl GOG
        case "0CE0734F106EBC3DCC2AA6195B221F0F": //1.8.5
        case "56F5EA4738D6D01EE1D2408DBA2295B3": //1.8.5_gl
            version = "1.8.5";
            break;
        default:
            version = "Unknown Version";
            MessageBox.Show(timer.Form,
      			"Dead Cells Autosplitter Error:\n\n"
			      + "This autosplitter does not support this game version."
			      + "Please contact R30hedron (@R30hedron#9520 on Discord)\n"
            + "with the following string and the game's version number.\n\n"
			      + "MD5Hash: " + MD5Hash,
			      "Dead Cells Autosplitter Error",
			      MessageBoxButtons.OK,
			      MessageBoxIcon.Error);
            break;
    }
}

update
{
    if (settings["debug"])
    {
        print("MD5    : " + MD5Hash);
        print("stage  : " + old.stage   + "/" + current.stage);
        print("time   : " + old.time    + "/" + current.time);
	print("control: " + old.control + "/" + current.control);
	print("headx  : " + old.headx   + "/" + current.headx);
	print("playerx: " + old.playerx + "/" + current.playerx);
	print("playery: " + old.playery + "/" + current.playery);
	print("health : " + old.health  + "/" + current.health);
    }
}

reset
{
    //runs repeatedly when timer is running.
    //if true, reset splitter
    //print("reset");
    
    return current.time == 0 && vars.pq.Contains(current.stage);
}

start
{
    //runs repeatedly when timer is at 0.0 and ready to start.
    //if true, splitter will start
    //print("start");
    
    return old.time == 0 && current.time > 00 && current.time < 0.1;
}

split
{
    //runs repeatedly when timer is running.
    //if true, split.
    
    //Check if leaving the intermediate areas.
    
    var exitPassage = false;
    
    if (settings["enter"])
    {
    	exitPassage = current.stage != old.stage && vars.passage.Contains(current.stage);
    } 
    if (settings["leave"])
    {
    	exitPassage = current.stage != old.stage && vars.passage.Contains(old.stage);
    }
    
    //Check if player loses control in Throne Room and head x coord is different from beheaded x coord
    var exitFountain  = vars.throne.Contains(current.stage) && 
                        old.headx > 2020 && //Check if head is far enough to the right
                        current.playerx > 1495 && //Failsafe to ensure player is to the right of the arena
                        old.control != 0 && current.control == 0;
    
    //Check if player loses control in Observatory during final cutscene
    var killCollector = vars.observatory.Contains(current.stage) &&
                        current.playery < 1100 && //Check if player is in the final areana location
                        current.health != 0 && //Check if player is not dead
                        old.control != 0 && current.control == 0;

    return exitPassage || exitFountain || killCollector;
}

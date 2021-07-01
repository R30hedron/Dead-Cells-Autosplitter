/* Dead Cells Autosplitter (01-JUL-2021)
 * Maintained by R30hedron (@R30hedron#9520 on Discord)
 * Special thanks to Mintys (@Minty#4831) and Blargel (@Blargel#0213) for previously creating/maintaining the autosplitter.
 * Thanks to Midknight13 (@Midknight13#3966) for verifying GOG version addresses
 * Thanks to Evian (@Evian#6930) for verifying version 23.9 addresses
 * 
 * Currently works for the following Dead Cells versions. Additional versions added by request.
 *     Steam v. 16.2 (Preferred for older 5 BC runs)
 *     Steam v. 17.1 (Preferred for older Fresh File runs)
 *     Steam v. 17.4
 *     Steam v. 18.5
 *     Steam v. 19.7
 *     Steam v. 20.8
 *     Steam v. 21.5
 *     Steam v. 22.0
 *     Steam v. 23.9
 *     Steam v. 24.3 (Current Patch)
 *
 *     GOG   v. 17.1
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
  * 4) Add version number to list above
  */

state("deadcells", "16.2") {
    string10 stage   : "discord.hdll", 0x1574, 0x1C;
    double   time    : "libhl.dll", 0x49184, 0x434, 0x0, 0x58, 0x5C, 0x28;
    int      control : "libhl.dll", 0x49184, 0x434, 0x0, 0x58, 0x68, 0xF8, 0xA0;
    double   headx   : "libhl.dll", 0x49184, 0x434, 0x0, 0x58, 0x68, 0xF8, 0xA0, 0x200;
    double   playerx : "libhl.dll", 0x49184, 0x434, 0x0, 0x58, 0x64, 0x200;
    double   playery : "libhl.dll", 0x49184, 0x434, 0x0, 0x58, 0x64, 0x208;
    int      health  : "libhl.dll", 0x49184, 0x434, 0x0, 0x58, 0x64, 0xE8;
}

state("deadcells", "17.1, 17.4, or 18.5") {//Includes GoG 17.1
    string10 stage   : "discord.hdll", 0x1574, 0x1C;
    double   time    : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x5C, 0x20;
    int      control : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x68, 0xF8, 0xA0;
    double   headx   : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x68, 0xF8, 0xA0, 0x200;
    double   playerx : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x64, 0x200;
    double   playery : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x64, 0x208;
    int      health  : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x64, 0xE8;
}

state("deadcells", "19.7") {
    string10 stage   : "discord.hdll", 0x1574, 0x1C;
    double   time    : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x5C, 0x20;
    int      control : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x68, 0xF8, 0xA0;
    double   headx   : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x68, 0xF8, 0xA0, 0x210;
    double   playerx : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x64, 0x210;
    double   playery : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x64, 0x218;
    int      health  : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x64, 0xE8;
}

state("deadcells", "20.8") { //20.7
    string10 stage   : "discord.hdll", 0x1574, 0x1C;
    double   time    : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x5C, 0x20;
    int      control : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x68, 0xFC, 0xA0;
    double   headx   : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x68, 0xFC, 0xA0, 0x218;
    double   playerx : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x64, 0x218;
    double   playery : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x64, 0x220;
    int      health  : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x64, 0xF0;
}

state("deadcells", "21.5") {
    string10 stage   : "discord.hdll", 0x1574, 0x1C;
    double   time    : "libhl.dll", 0x49184, 0x3C8, 0x0, 0x58, 0x5C, 0x20;
    int      control : "libhl.dll", 0x49184, 0x3C8, 0x0, 0x58, 0x68, 0x104, 0xA0;
    double   headx   : "libhl.dll", 0x49184, 0x3C8, 0x0, 0x58, 0x68, 0x104, 0xA0, 0x218;
    double   playerx : "libhl.dll", 0x49184, 0x3C8, 0x0, 0x58, 0x64, 0x218;
    double   playery : "libhl.dll", 0x49184, 0x3C8, 0x0, 0x58, 0x64, 0x220;
    int      health  : "libhl.dll", 0x49184, 0x3C8, 0x0, 0x58, 0x64, 0xF0;
}

state("deadcells", "22.0") {
    string10 stage   : "discord.hdll", 0x1574, 0x1C;
    double   time    : "libhl.dll", 0x49184, 0x3BC, 0x0, 0x58, 0x5C, 0x20;
    int      control : "libhl.dll", 0x49184, 0x3BC, 0x0, 0x58, 0x68, 0x104, 0xA0;
    double   headx   : "libhl.dll", 0x49184, 0x3BC, 0x0, 0x58, 0x68, 0x104, 0xA0, 0x208;
    double   playerx : "libhl.dll", 0x49184, 0x3BC, 0x0, 0x58, 0x64, 0x208;
    double   playery : "libhl.dll", 0x49184, 0x3BC, 0x0, 0x58, 0x64, 0x210;
    int      health  : "libhl.dll", 0x49184, 0x3BC, 0x0, 0x58, 0x64, 0xFC;
}

state("deadcells", "23.9") { //23.8
    string10 stage   : "discord.hdll", 0x1574, 0x1C;
    double   time    : "libhl.dll", 0x49184, 0x3B4, 0x0, 0x58, 0x5C, 0x20;
    int      control : "libhl.dll", 0x49184, 0x3B4, 0x0, 0x58, 0x68, 0x104, 0xA0;
    double   headx   : "libhl.dll", 0x49184, 0x3B4, 0x0, 0x58, 0x68, 0x104, 0xA0, 0x208;
    double   playerx : "libhl.dll", 0x49184, 0x3B4, 0x0, 0x58, 0x64, 0x208;
    double   playery : "libhl.dll", 0x49184, 0x3B4, 0x0, 0x58, 0x64, 0x210;
    int      health  : "libhl.dll", 0x49184, 0x3B4, 0x0, 0x58, 0x64, 0xFC;
}

state("deadcells", "24.3") {
    string10 stage   : "discord.hdll", 0x1574, 0x1C;
    double   time    : "libhl.dll", 0x48184, 0x3B8, 0x0, 0x58, 0x5C, 0x20;
    int      control : "libhl.dll", 0x48184, 0x3B8, 0x0, 0x58, 0x68, 0x104, 0xA0;
    double   headx   : "libhl.dll", 0x48184, 0x3B8, 0x0, 0x58, 0x68, 0x104, 0xA0, 0x208;
    double   playerx : "libhl.dll", 0x48184, 0x3B8, 0x0, 0x58, 0x64, 0x208;
    double   playery : "libhl.dll", 0x48184, 0x3B8, 0x0, 0x58, 0x64, 0x210;
    int      health  : "libhl.dll", 0x48184, 0x3B8, 0x0, 0x58, 0x64, 0xFC;
}

state("deadcells", "Unknown Version") {
    //Default to 24.3
    string10 stage   : "discord.hdll", 0x1574, 0x1C;
    double   time    : "libhl.dll", 0x48184, 0x3B8, 0x0, 0x58, 0x5C, 0x20;
    int      control : "libhl.dll", 0x48184, 0x3B8, 0x0, 0x58, 0x68, 0x104, 0xA0;
    double   headx   : "libhl.dll", 0x48184, 0x3B8, 0x0, 0x58, 0x68, 0x104, 0xA0, 0x208;
    double   playerx : "libhl.dll", 0x48184, 0x3B8, 0x0, 0x58, 0x64, 0x208;
    double   playery : "libhl.dll", 0x48184, 0x3B8, 0x0, 0x58, 0x64, 0x210;
    int      health  : "libhl.dll", 0x48184, 0x3B8, 0x0, 0x58, 0x64, 0xFC;
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
        "Prisoners'",
        "Quartier d", // French
        "Celdas de "  // Spanish
    };
    vars.passage = new List<string> {
        "Passage to",
        "Passageway",
        "Passage ve", // French
        "Pasaje a l",
        "Pasaje al "  //Spanish
    };
    vars.throne = new List<string> {
        "Throne Roo",
        "Salle du t", // French
        "Sala del T"  // Spanish
    };
    vars.observatory = new List<string> {
        "Observator",
        "Observatoi", // French
      //"Observator"  //Spanish
    };
    
    settings.Add("enter", false, "Split on entering transition");
    settings.SetToolTip("enter", "Enable splits on entering \"Passage to\" areas.");
    
    settings.Add("leave", true, "Split on leaving transition");
    settings.SetToolTip("leave", "Enable splits on leaving \"Passage to\" areas (on by default).");
    
    settings.Add("debug", false, "Print debug statements");
    settings.SetToolTip("debug", "Prints debug statements to console; can be viewed through DebugView.\n"
                               + "You should only enable this if you are helping to debug the autosplitter.");
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
    vars.MD5Hash = MD5Hash;
    print("MD5: " + MD5Hash);
    
    
    switch (MD5Hash)
    {
        case "44775C673E44220D82B54A43DDE45606": //16.2
        case "7C89DD5B7AFDD68F60ACFF657C65E261": //16.2_gl
            version = "16.2";
            break;
        case "CE5EE20A1358B472222717129B6BC130": //17.1
        case "1AF83FDD50EFDE7C235A2703C7005A51": //17.1_gl
        case "CA7B1C70879BC1431C74AE914B9DDA3B": //17.4
        case "D9246EF63709168B2591B5C29CD270F7": //17.4_gl
        case "B09AA0C6C1B9E323F3DF47ECC6AE40FD": //17.1 GOG
        case "86666DB94BF117E113DCC2687E619E86": //17.1_gl GOG
        case "0CE0734F106EBC3DCC2AA6195B221F0F": //18.5
        case "56F5EA4738D6D01EE1D2408DBA2295B3": //18.5_gl
            version = "17.1, 17.4, or 18.5";
            break;
        case "3124766B0AF66816797E8181BF4A1298": //19.7
        case "D9ADFE07B4361524E7B5727BCCAB7842": //19.7_gl
        case "26FC75193F4B530DE0AE7082F9C7E32E": //19.7 hotfix
        case "04D91182EF920120267DEF438F6BDE1C": //19.7_gl hotfix
        case "2374914D7B73B09EDDDD21778F0DBF07": //19.7 hotfix 2
        case "EE243B6BDE53A0D8EE6EBB4265B2B692": //19.7_gl hotfix 2
            version = "19.7";
            break;
        case "E8C26AEEC84DFE64D30AFB25F2972C67": //20.7
        case "BE9B6159292CD054DE223E97CA746FA9": //20.7_gl
        case "52852A88C226BC11CC087BAE5EA748C8": //20.8
        case "6CFE2E36EE96484A65672166341C7CCC": //20.8_gl
            version = "20.8";
            break;
        case "B3645A26A4F1D72080269719B927E0CE": //21.5
        case "5D62B02629585DF0BC3FB49B28B4E53C": //21.5_gl
            version = "21.5";
            break;
        case "58BEAB263FFE1BDE26161C8743083466": //22.0
        case "E8F678AED55C8F36892E38E620C5A09E": //22.0_gl
            version = "22.0";
            break;
        case "3D7DD501610C37672FEDBDEDEFD78989": //23.8
        case "25C6EB4748D31401E01BD0B7EDE2491E": //23.8_gl
        case "E31E422C84F968475715489AED00871D": //23.9
        case "8D1D8E36F790FB2869655F17957DCCBC": //23.9_gl
            version = "23.9";
            break;
        case "B5409CCCEB559C8E6DFA2BE4AC7FB2B8": //24.2
        case "A47D233B2815BE4E45904254A3AA292B": //24.2_gl
        case "6789DF62008784E7D883E6CDEA6D3BFA": //24.3
        case "6DF010E1C7FCCDF55F47A65E7ACB1EFE": //24.3_gl
            version = "24.3";
            break;
        default:
            version = "Unknown Version";
            MessageBox.Show(timer.Form,
                "Dead Cells Autosplitter Error:\n\n"
                + "This autosplitter does not support this game version.\n"
                + "Please contact R30hedron (@R30hedron#9520 on Discord)\n"
                + "with the following string and the game's version number.\n\n"
                + "MD5Hash: " + MD5Hash + "\n\n"
                + "Defaulting to the most recent known memory addesses...",
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
        print("--------------------------------------------------\n" + 
        "MD5    : " + vars.MD5Hash + "\n" +
        "stage  : " + old.stage   + " / " + current.stage + "\n" +
        "time   : " + old.time    + " / " + current.time + "\n" +
        "control: " + old.control + " / " + current.control + "\n" +
        "headx  : " + old.headx   + " / " + current.headx + "\n" +
        "playerx: " + old.playerx + " / " + current.playerx + "\n" +
        "playery: " + old.playery + " / " + current.playery + "\n" +
        "health : " + old.health  + " / " + current.health);
    }
}

reset
{
    //runs repeatedly when timer is running.
    //if true, reset splitter
    
    if (settings["debug"] && (current.time == 0 && vars.pq.Contains(current.stage)))
    {
        print("DEBUG: Reset");
    }
    
    return current.time == 0 && vars.pq.Contains(current.stage);
}

start
{
    //runs repeatedly when timer is at 0.0 and ready to start.
    //if true, splitter will start
    
    if (settings["debug"] && (old.time == 0 && current.time > 00 && current.time < 0.1))
    {
        print("DEBUG: Start");
    }
    
    return old.time == 0 && current.time > 00 && current.time < 0.1;
}

split
{
    //runs repeatedly when timer is running.
    //if true, split.
    
    //Check if entering or leaving the intermediate areas.
    var enterPassage = false;
    var exitPassage  = false;
    
    if (settings["enter"])
    {
    	enterPassage = current.stage != old.stage && vars.passage.Contains(current.stage);
    } 
    if (settings["leave"])
    {
    	exitPassage  = current.stage != old.stage && vars.passage.Contains(old.stage);
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
    
    var isSplit = false;
    isSplit = enterPassage || exitPassage || exitFountain || killCollector;
    
    if (settings["debug"] && isSplit)
    {
        print("DEBUG: Split");
    }
    
    return isSplit;
}

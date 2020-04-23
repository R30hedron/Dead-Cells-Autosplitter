/* Dead Cells Autosplitter (22-Apr-2020)
 * Maintained by R30hedron (@R30hedron#9520 on Discord)
 * Special thanks to Blargel (@Blargel#0213) and Mintys (@Minty#4831) for previously creating/maintaining the autosplitter.
 * 
 * Currently works for Dead Cells Steam v. 1.6 and 1.8. Additional versions added by request.
 */
 
state("deadcells", "1.8") {
    string11 stage    : "discord.hdll", 0x1574, 0x1C;
    double   time     : "libhl.dll", 0x49184, 0x440, 0x0, 0x58, 0x5C, 0x20;
}

/* Variable Info
 * [stage]   : Contains the current level name. Used for splits
 * 
 * [time]    : Stores the current in-game timer value.
 * 
 * [control] : Memory address for what object is controlled by the player.
 */

gameTime {
    //runs at all times when the timer is running.
    //returns in-game time
    return TimeSpan.FromSeconds(current.time);
}

init
{
    //runs once when starting Dead Cells.
    //Used to determine version
    //print("init");
    
    //md5 checksum code pulled from Zment's Defy Gravity autosplitter
    
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
        case "0CE0734F106EBC3DCC2AA6195B221F0F": //1.8
        case "56F5EA4738D6D01EE1D2408DBA2295B3": //1.8_gl
            version = "1.8";
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

reset
{
    //runs repeatedly when timer is running.
    //if true, reset splitter
    //print("reset");
    
    return current.time == 0 && current.stage == "Prisoners' ";
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
    
    var exitPassage   = current.stage != old.stage && (old.stage == "Passage to " || old.stage == "Passageway " || old.stage == "Passage ver");
    
    return exitPassage
}

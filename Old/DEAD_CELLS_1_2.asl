state("deadcells"){
  string11 stage    : "discord.hdll", 0x0001574, 0x1C;
  double   time     : "libhl.dll", 0x00049184, 0x434, 0x0, 0x58, 0x5C, 0x28;
  int      cutscene : "libhl.dll", 0x00049184, 0xB0,  0x0, 0x18, 0x50;
  byte     control  : "libhl.dll", 0x00049184, 0x434, 0x0, 0x58, 0x64, 0x230;
}

gameTime {
  return TimeSpan.FromSeconds(current.time);
}

start {
  return old.time == 0 && current.time > 0 && current.time < 0.1;
}

reset {
  return current.time == 0 && current.stage == "Prisoners' ";
}

isLoading {
  return true;
}

split {
  var exitPassage  = current.stage != old.stage && old.stage == "Passage to ";
  var exitFountain = current.stage == "Throne Room" && current.control == 32 && old.cutscene == 0 && current.cutscene != 0;
  // TODO: Figure out how to split for the collector fight

  return exitPassage || exitFountain;
}

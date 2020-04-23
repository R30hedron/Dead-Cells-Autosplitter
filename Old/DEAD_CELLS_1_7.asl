state("deadcells"){
  string11 stage    : "discord.hdll", 0x0001574, 0x1C;
  double   time     : "libhl.dll", 0x00049184, 0x440, 0x0, 0x58, 0x5C, 0x20;
  int      cutscene : "libhl.dll", 0x00049184, 0xCC,  0x0, 0x18, 0x50;
  byte     control  : "libhl.dll", 0x00049184, 0x440, 0x0, 0x58, 0x64, 0x230;
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
  var headUnattached = (current.control & 8) != 8;

  var exitPassage   = current.stage != old.stage && (old.stage == "Passage to " || old.stage == "Passageway " || old.stage == "Passage ver");
  var exitFountain  = current.stage == "Throne Room" && headUnattached && old.cutscene == 0 && current.cutscene != 0;
  var killCollector = current.stage == "Observatory" && old.cutscene == 0 && current.cutscene != 0;
  
  print("headUnattached: " + headUnattached);
  print("killCollector: " + killCollector);
  print("current.stage: " + current.stage);
  print("current.cutscene: " + current.cutscene);

  return exitPassage || exitFountain || killCollector;
}

--[[
Vibe coded. lowkey sucks
The ASCII Art makes no sense,

TODO: Update it. and test if it even runs, fix formatting (like what is this).

]]



-- miku.lua
-- A playful terminal celebration of Hatsune Miku in pure Lua.
-- No external dependencies. Best experienced in a terminal that supports ANSI colors.

local term = {
  reset   = "\27[0m",
  bold    = "\27[1m",
  cyan    = "\27[36m",
  magenta = "\27[35m",
  blue    = "\27[34m",
  green   = "\27[32m",
  yellow  = "\27[33m",
}

-- cross-platform sleep (seconds)
local function sleep(sec)
  local t0 = os.clock()
  while os.clock() - t0 < sec do end
end

-- typewriter effect
local function typewrite(s, delay, color)
  io.write(color or "", "")
  for i = 1, #s do
    io.write(s:sub(i, i))
    io.flush()
    sleep(delay or 0.02)
  end
  io.write(term.reset .. "\n")
end

-- center text within width
local function center(s, width)
  width = width or 64
  local pad = math.max(0, math.floor((width - #s) / 2))
  return string.rep(" ", pad) .. s
end

-- simple marquee scroller
local function marquee(text, width, cycles, color)
  width = width or 56
  cycles = cycles or 2
  local gap = string.rep(" ", width)
  local scroll = text .. gap
  local n = #scroll
  for c = 1, cycles do
    for i = 1, n do
      local frame = scroll:sub(i) .. scroll:sub(1, i - 1)
      io.write("\r" .. color .. frame:sub(1, width) .. term.reset)
      io.flush()
      sleep(0.03)
    end
  end
  io.write("\n")
end

-- ASCII splash (keeps it simple & friendly)
local function splash()
  local lines = {
    term.cyan .. term.bold .. 
    "      _   _       _                       ",
    "     | | (_)     | |                      ",
    "  ___| |_ _ _   _| |__  _   _  ___  _   _ ",
    " / _ \\ __| | | | | '_ \\| | | |/ _ \\| | | |",
    "|  __/ |_| | |_| | |_) | |_| | (_) | |_| |",
    " \\___|\\__|_|\\__,_|_.__/ \\__, |\\___/ \\__,_|",
    "                        __/ |             ",
    "                       |___/              " .. term.reset
  }
  for _, ln in ipairs(lines) do
    print(center(ln, 64))
    sleep(0.04)
  end
end

local praises = {
  "Hatsune Miku is a spark of creativity that inspires millions ✨",
  "Her voice turns ideas into songs—and songs into memories 🎶",
  "From concerts to code, Miku brings joy everywhere 💎",
  "She’s iconic, innovative, and endlessly uplifting 🌟",
  "Where there’s Miku, there’s community, art, and heart 💙",
  "Adored worldwide—digital yet deeply human in impact 🌍",
}

local facts = {
  "Debuted: August 31, 2007 (Crypton Future Media)",
  "Voicebank: Yamaha VOCALOID; Character: Piapro Studio (NT variants too)",
  "Genres: Pop, EDM, rock, and countless fan-made styles",
  "Performances: Real-time 3D concerts with global tours",
  "Community: Millions of producers, artists, and fans worldwide",
  "Symbol: Twin teal ponytails, headset, and infinite creativity",
}

local function banner()
  typewrite(center("♡ Hatsune Miku Celebration ♡", 64), 0.01, term.magenta .. term.bold)
  print(center(term.blue .. string.rep("═", 40) .. term.reset, 64))
end

local function show_praises()
  for _, line in ipairs(praises) do
    typewrite(center(line, 64), 0.01, term.green)
    sleep(0.05)
  end
end

local function show_facts()
  print()
  typewrite(center("Facts & Highlights", 64), 0.02, term.yellow .. term.bold)
  for i, f in ipairs(facts) do
    typewrite(center(("• " .. f), 64), 0.01, term.cyan)
  end
end

local function ticker()
  print()
  marquee("HATSUNE MIKU • LOVELY • GREAT • AMAZING • ADORED • ICONIC • INSPIRING •", 60, 2, term.magenta .. term.bold)
end

local function outro()
  print()
  typewrite(center("Keep creating. Keep sharing. Keep singing. ♫", 64), 0.02, term.blue)
  typewrite(center("Thank you, Miku! 💙", 64), 0.02, term.cyan .. term.bold)
end

-- Run show
banner()
splash()
show_pshow_praises()
show_facts()
ticker()

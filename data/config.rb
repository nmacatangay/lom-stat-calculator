# SETUP
WEAPON_SYMBOLS = %i[kn sw ax 2s 2a ha sp st gl fl bw]
MAIN_WEAPON = :kn

# CALCULATOR
STAT_SYMBOLS = %i[pwr dex def mag con mnd chr]
WEAPON_GROWTH = {
  'kn': { pwr: 0.75, dex: 1.25, def: 0.75, mag: 0.75, con: 0.50, mnd: 1.00, chr: 1.00 },
  'sw': { pwr: 1.00, dex: 1.00, def: 1.00, mag: 0.75, con: 0.75, mnd: 0.75, chr: 0.75 },
  'ax': { pwr: 1.00, dex: 0.75, def: 1.00, mag: 0.75, con: 0.75, mnd: 1.00, chr: 0.50 },
  '2s': { pwr: 1.25, dex: 1.00, def: 0.75, mag: 0.75, con: 0.75, mnd: 0.50, chr: 0.75 },
  '2a': { pwr: 1.25, dex: 0.75, def: 1.25, mag: 0.75, con: 0.50, mnd: 0.75, chr: 0.50 },
  'ha': { pwr: 1.75, dex: 0.75, def: 0.50, mag: 0.75, con: 0.75, mnd: 0.75, chr: 0.75 },
  'sp': { pwr: 0.75, dex: 1.25, def: 1.00, mag: 0.75, con: 0.50, mnd: 0.75, chr: 1.00 },
  'st': { pwr: 0.50, dex: 0.75, def: 0.75, mag: 1.25, con: 0.50, mnd: 0.75, chr: 1.25 },
  'gl': { pwr: 1.25, dex: 0.75, def: 0.75, mag: 0.50, con: 1.00, mnd: 0.75, chr: 0.75 },
  'fl': { pwr: 0.75, dex: 1.25, def: 0.50, mag: 0.75, con: 0.50, mnd: 0.75, chr: 1.25 },
  'bw': { pwr: 0.50, dex: 1.75, def: 0.75, mag: 0.75, con: 0.50, mnd: 0.75, chr: 1.00 }
}
BASE_STATS = { pwr: 5.00, dex: 5.00, def: 5.00, mag: 5.00, con: 5.00, mnd: 5.00, chr: 5.00 }
MINIMUM_STAT = 85

# SETUP & CALCULATOR
MAX_LEVEL = 98 # 98

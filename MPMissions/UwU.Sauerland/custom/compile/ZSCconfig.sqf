/* Single Currency 3.0 uses storages to store money which can be accessed by anyone if open of course (safe,lockbox). Each storage has his own money, so no global access. */

// Name of your currency
CurrencyName = "Coins"; 

// Objects that can hold money. Vehicles are added automaticly. Size of  money capacity is depended on ammount of magazines the object can hold.
ZSC_MoneyStorage = ["VaultStorage","LockboxStorage","StorageShed_DZ","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","GunRack_DZ","WoodCrate_DZ","TentStorage","TentStorageDomed","TentStorageDomed2"];

// Multiplier how much money an object can hold. This number X ammount of magazines it can hold. ( so URAL -> 500 items * 1000 = 5 MIL cash).
ZSC_MaxMoneyInStorageMultiplier = 100000;

// (True = No Animation / False = Animation)
InstantTrading = false; 


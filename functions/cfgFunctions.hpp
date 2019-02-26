class HT {
    class briefcase {
        class addBriefcaseEHs {};
        class addInteractions {};
        class attachBriefcase {};
        class checkBriefcase {};
        class dropBriefcase {};
        class onAnimChanged {};
        class onDisconnect {};
        class onGetIn {};
        class onGetOut {};
        class onKilled {};
        class onUnconscious {};
        class onWeaponChanged {};
    };
    class common {
		class findMaxMoonDate {};
        class handleNegotiator {};
        class initBoatBox {};
        class markSpawns {};
		class temp3dMarker {};
        class unloadBoat {};
    };
	class endings {
        class endMission {postInit = 1;}
        class triggerController {};
	};
	class setup {
        class isWoodland {};
		class params {postInit = 1;};
		class setTime {};
		class setWeather {};
        class timeTracker {};
    };
    class spawn {
        class addMoney {};
        class bluforSpawn {};
        class checkSlope {};
        class findSpawnPos {};
        class getMapSize {};
        class insideMap {};
        class opforSpawn {};
        class setupTimer {};
	};
    class waverespawn {
        class addToWave {};
        class canRespawn {};
        class getStatus {};
        class init {postInit = 1;};
        class onPlayerKilled {};
        class onPlayerRespawn {};
        class playerCountdown {};
        class prepareRespawn {};
        class pubVars {preInit = 1;};
        class removeFromWave {};
        class resetPlayerVars {};
        class respawnHint {};
        class setWaveSize {};
        class startWaveLoops {};
        class waveCountdown {};
    };
};

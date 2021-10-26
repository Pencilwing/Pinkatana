function atuin_create() {

	//Atuin is the global controller of the game. A persistent object, it has several responsibilities
	//Aside from initiating scenes (spawns dynamic objects like characters and collectables), it assigns 
	//control of entities to other entities. 
	//It also handles several global variables like playSpeed (in-game speed) and wether or not controls are
	//enabled.
	//If it's a global variable, Atuin declared it.
	//Atuin also deals with camera behaviour. Any camera actions like zooming or panning are to be perfomed
	//through Atuin, with help from target objects.


	game_set_speed(60,gamespeed_fps)
	
	window_set_cursor(cr_none);

	//create global variables
	gameCurrentFrame = 0
	playSpeed = 1;
	playSpeedDefault = 1;
	pause =false;
	controlsEnabled = true;
	hitStop = false;
	hitStopDur = 0;
	restart = false;
	t = 0;
	volumeLevel = 3;
	lastRoom = 0;
	startingTime = 0;
	finalTime = 0;
	victory = false;
	time = 0;
	//gamestate pertinent objects
	gamestateList = ds_list_create();

	//initiate enumerators
	enum_init();

	//cutscene
	

	//create camera and viewport variables
	//atuin_displaySetup();
	
	//Initialize device variable
	deviceCount = 0;
	controlScheme = false;
	currentGamepad = 0;
	
	//Initialize Axis variables
	LAxUp = 0;
	LAxDown = 0;
	LAxRight = 0;
	LAxLeft = 0;

	//Initialize debugging tool variables
	traceBtn = false;
	saveStateBtn = false;
	loadStateBtn = false;
	simulateBtn = false;
	hboxBtn = false;
	spitBtn = false;
	pSelectBtn = false;
	cSelectBtn = false;
	exitBtn = false;
	slowBtn  = false;
	resolutionBtn = false;
	traceText = ds_list_create();
	hboxVisible = false;
	traceVisible = true;

}

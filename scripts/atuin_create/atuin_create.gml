function atuin_create() {

	//Atuin is the global controller of the game. A persistent object, it has several responsibilities
	//Aside from initiating scenes (spawns dynamic objects like characters and collectables), it assigns 
	//control of entities to other entities. 
	//It also handles several global variables like playSpeed (in-game speed) and wether or not controls are
	//enabled.
	//If it's a global variable, Atuin declared it.
	//Atuin also deals with camera behaviour. Any camera actions like zooming or panning are to be perfomed
	//through Atuin, with help from target objects.
	
	//constants
	#macro EMPTY -69420

	game_set_speed(60,gamespeed_fps)
	
	window_set_cursor(cr_none);

	//create global variables
	gameCurrentFrame = 0
	playSpeed = 1;
	playSpeedDefault = 1;
	pause = false;
	controlsEnabled = true;
	hitStop = false;
	hitStopDur = 0;
	restart = false;
	t = 0;
	
	currentSave = EMPTY;
	
	volumeLevel = 3;
	sfxLevel = 3;
	musicLevel = 3;
	
	currentOST = sNone;
	lastRoom = 0;
	startingTime = 0;
	finalTime = 0;
	victory = false;
	
	//gameplay settings
	slashInverted = 1;
	timerVisible = false;
	timerRunning = false;
	cutscenesVisible = false;
	speedRunMode = false;
	fastReset = true;
	
	time = 0;
	hours = 0;
	minutes = 0;
	seconds = 0;
	milliseconds = 0;
	
	//create save files
	
	loadSavesIntoVariables();
	
	
	
	//window_set_fullscreen(true);
	
	//gamestate pertinent objects
	gamestateList = ds_list_create();

	//initiate enumerators
	enum_init();

	//cutscene
	retrieveInputMapping()
	
	//set input mapping icons
		inputSprites = ds_map_create();
	
		ds_map_add(inputSprites,"17",spr_kbCtrl)
		ds_map_add(inputSprites,"18",spr_kbAlt)
		ds_map_add(inputSprites,"32",spr_kbSpace)
		ds_map_add(inputSprites,"37",spr_kbLeft)
		ds_map_add(inputSprites,"38",spr_kbUp)
		ds_map_add(inputSprites,"39",spr_kbRight)
		ds_map_add(inputSprites,"40",spr_kbDown)
		ds_map_add(inputSprites,"16",spr_kbShift)
		ds_map_add(inputSprites,"90",spr_kbZ)
		ds_map_add(inputSprites,"88",spr_kbX)
		ds_map_add(inputSprites,"67",spr_kbC)
		ds_map_add(inputSprites,"86",spr_kbV)
		ds_map_add(inputSprites,"66",spr_kbB)
		ds_map_add(inputSprites,"78",spr_kbN)
		ds_map_add(inputSprites,"77",spr_kbM)
		ds_map_add(inputSprites,"44",spr_kbComma)
		ds_map_add(inputSprites,"46",spr_kbDot)
		ds_map_add(inputSprites,"47",spr_kbSlash)
		ds_map_add(inputSprites,"35",spr_kbEnd)
		ds_map_add(inputSprites,"65",spr_kbA)
		ds_map_add(inputSprites,"83",spr_kbS)
		ds_map_add(inputSprites,"68",spr_kbD)
		ds_map_add(inputSprites,"70",spr_kbF)
		ds_map_add(inputSprites,"71",spr_kbG)
		ds_map_add(inputSprites,"72",spr_kbH)
		ds_map_add(inputSprites,"74",spr_kbJ)
		ds_map_add(inputSprites,"75",spr_kbK)
		ds_map_add(inputSprites,"76",spr_kbL)
		ds_map_add(inputSprites,"59",spr_kbPointComma)
		ds_map_add(inputSprites,"39",spr_kbSingleQuote)
		ds_map_add(inputSprites,"13",spr_kbEnter)
		ds_map_add(inputSprites,"34",spr_kbPageDown)
		ds_map_add(inputSprites,"9" ,spr_kbTab)
		ds_map_add(inputSprites,"81",spr_kbQ)
		ds_map_add(inputSprites,"87",spr_kbW)
		ds_map_add(inputSprites,"69",spr_kbE)
		ds_map_add(inputSprites,"82",spr_kbR)
		ds_map_add(inputSprites,"84",spr_kbT)
		ds_map_add(inputSprites,"89",spr_kbY)
		ds_map_add(inputSprites,"85",spr_kbU)
		ds_map_add(inputSprites,"73",spr_kbI)
		ds_map_add(inputSprites,"79",spr_kbO)
		ds_map_add(inputSprites,"80",spr_kbP)
		ds_map_add(inputSprites,"91",spr_kbLeftSquareBrace)
		ds_map_add(inputSprites,"93",spr_kbRightSquareBrace)
		ds_map_add(inputSprites,"124",spr_kbSeparator)
		ds_map_add(inputSprites,"33",spr_kbPageup)
		ds_map_add(inputSprites,"96",spr_kbTilde)
		ds_map_add(inputSprites,"49",spr_kb1)
		ds_map_add(inputSprites,"50",spr_kb2)
		ds_map_add(inputSprites,"51",spr_kb3)
		ds_map_add(inputSprites,"52",spr_kb4)
		ds_map_add(inputSprites,"53",spr_kb5)
		ds_map_add(inputSprites,"54",spr_kb6)
		ds_map_add(inputSprites,"55",spr_kb7)
		ds_map_add(inputSprites,"56",spr_kb8)
		ds_map_add(inputSprites,"57",spr_kb9)
		ds_map_add(inputSprites,"48",spr_kb0)
		ds_map_add(inputSprites,"45",spr_kbDash)
		ds_map_add(inputSprites,"61",spr_kbEquals)
		ds_map_add(inputSprites,"8",spr_kbBackspace)
		ds_map_add(inputSprites,"36",spr_kbHome)
		ds_map_add(inputSprites,"27",spr_kbEscape)
		ds_map_add(inputSprites,"112",spr_kbF1)
		ds_map_add(inputSprites,"113",spr_kbF2)
		ds_map_add(inputSprites,"114",spr_kbF3)
		ds_map_add(inputSprites,"115",spr_kbF4)
		ds_map_add(inputSprites,"116",spr_kbF5)
		ds_map_add(inputSprites,"117",spr_kbF6)
		ds_map_add(inputSprites,"118",spr_kbF7)
		ds_map_add(inputSprites,"119",spr_kbF8)
		ds_map_add(inputSprites,"120",spr_kbF9)
		ds_map_add(inputSprites,"121",spr_kbF10)
		ds_map_add(inputSprites,"122",spr_kbF11)
		ds_map_add(inputSprites,"123",spr_kbF12)
		ds_map_add(inputSprites,"45",spr_kbInsert)
		ds_map_add(inputSprites,"44",spr_kbPrintScreen)
		ds_map_add(inputSprites,"46",spr_kbDelete)
	
		ds_map_add(inputSprites,"1",spr_kbLeftClick)
		ds_map_add(inputSprites,"3",spr_kbMidClick)
		ds_map_add(inputSprites,"2",spr_kbRightClick)
	
		ds_map_add(inputSprites,"32781",spr_gpPadu)
		ds_map_add(inputSprites,"32782",spr_gpPadd)
		ds_map_add(inputSprites,"32783",spr_gpPadl)
		ds_map_add(inputSprites,"32784",spr_gpPadr)
		ds_map_add(inputSprites,"32772",spr_gpFace4)
		ds_map_add(inputSprites,"32771",spr_gpFace3)
		ds_map_add(inputSprites,"32770",spr_gpFace2)
		ds_map_add(inputSprites,"32769",spr_gpFace1)
		ds_map_add(inputSprites,"32773",spr_gpShLt)
		ds_map_add(inputSprites,"32775",spr_gpShLb)
		ds_map_add(inputSprites,"32774",spr_gpShRt)
		ds_map_add(inputSprites,"32776",spr_gpShRb)
		ds_map_add(inputSprites,"32778",spr_gpStart)
		ds_map_add(inputSprites,"32777",spr_gpSelect)
		ds_map_add(inputSprites,"32785",spr_gpAxislh)
		ds_map_add(inputSprites,"32786",spr_gpAxislv)
		ds_map_add(inputSprites,"32779",spr_gpStickL)
		ds_map_add(inputSprites,"32787",spr_gpAxisrh)
		ds_map_add(inputSprites,"32788",spr_gpAxisrv)
		ds_map_add(inputSprites,"32780",spr_gpStickR)

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

}

function retrieveInputMapping()
	{
		
		//create check input info map
		inputInfo = ds_map_create();
		ds_map_clear(inputInfo);
		
		ini_open("PINKinputMapping.ini")
		
		//keyboard mappings
		ds_map_add(inputInfo, "kb_move", ini_read_string("keyboard","move", EMPTY))
		ds_map_add(inputInfo, "kb_aim", ini_read_string("keyboard","aim", EMPTY))
		ds_map_add(inputInfo, "kb_left", ini_read_real("keyboard","left", EMPTY))
		ds_map_add(inputInfo, "kb_right", ini_read_real("keyboard","right",EMPTY))
		ds_map_add(inputInfo, "kb_up", ini_read_real("keyboard","up",EMPTY))
		ds_map_add(inputInfo, "kb_down", ini_read_real("keyboard","down",EMPTY))
		
		ds_map_add(inputInfo, "kb_slash", ini_read_real("keyboard","slash",EMPTY))
		ds_map_add(inputInfo, "kb_interact", ini_read_real("keyboard","interact",EMPTY))
		
		ds_map_add(inputInfo, "kb_pause", ini_read_real("keyboard","pause",EMPTY))
		ds_map_add(inputInfo, "kb_confirm", ini_read_real("keyboard","confirm",EMPTY))
		ds_map_add(inputInfo, "kb_back", ini_read_real("keyboard","back",EMPTY))
		
		//gamepad mappings
		ds_map_add(inputInfo,"gp_move", ini_read_string("gamepad","move", EMPTY))
		ds_map_add(inputInfo,"gp_aim", ini_read_string("gamepad","aim", EMPTY))
		ds_map_add(inputInfo,"gp_left", ini_read_real("gamepad","left", EMPTY))
		ds_map_add(inputInfo,"gp_right", ini_read_real("gamepad","right",EMPTY))
		ds_map_add(inputInfo,"gp_up", ini_read_real("gamepad","up",EMPTY))
		ds_map_add(inputInfo,"gp_down", ini_read_real("gamepad","down",EMPTY))
		
		ds_map_add(inputInfo,"gp_slash", ini_read_real("gamepad","slash",EMPTY))
		ds_map_add(inputInfo,"gp_interact", ini_read_real("gamepad","interact",EMPTY))
		
		ds_map_add(inputInfo,"gp_pause", ini_read_real("gamepad","pause",EMPTY))
		ds_map_add(inputInfo,"gp_confirm", ini_read_real("gamepad","confirm",EMPTY))
		ds_map_add(inputInfo,"gp_back", ini_read_real("gamepad","back",EMPTY))
		
		
		ini_close();	
		
	}
	
function getInput(input)
{
	//If control scheme is on keyboard
	if(oAtuin.controlScheme == 0)
	{
		var inputId = ds_map_find_value(oAtuin.inputInfo,"kb_" + input)
		if(is_string(inputId))
		{
			if(inputId == "mouse")
			{
			var mouse;
			mouse[0] = mouse_x 
			mouse[1] = mouse_y 
			return mouse;
			}
		}else{
		return real(ds_map_find_value(oAtuin.inputInfo,"kb_" + input))
		}
	//If control scheme is on gamepad
	}else{
		var inputId = ds_map_find_value(oAtuin.inputInfo,"gp_" + input)
		if(is_string(inputId))
		{
			if(inputId == "axisr")
			{
			var axisR;
			axisR[0] =  x + real(gamepad_axis_value(oAtuin.currentGamepad, gp_axisrh))
			axisR[1] = y + real(gamepad_axis_value(oAtuin.currentGamepad, gp_axisrv))
			return axisR;
			}
			
			if(inputId == "axisl")
			{
			var axisL;
			axisL[0] =  gamepad_axis_value(oAtuin.currentGamepad, gp_axislh)
			axisL[1] = gamepad_axis_value(oAtuin.currentGamepad, gp_axislv)
			return axisL;
			}
			
		}else{
			return real(ds_map_find_value(oAtuin.inputInfo,"gp_" + input))
		}
	
	}
	
}

function saveToCurrentFile()
	{
		//save in current file
		var save = oAtuin.currentSave[0]
		var playerX = oAtuin.currentSave[2]
		var playerY = oAtuin.currentSave[3]
	
		ini_open("PINKsaveData.ini");

		ini_write_real(save,"empty",0);
		ini_write_real(save,"positionX",playerX);
		ini_write_real(save,"positionY",playerY);
		ini_write_string(save,"location","Jam Level");
		ini_write_real(save,"time", oAtuin.time)

		ini_close();
		
		loadSavesIntoVariables()
	}
	
function wipeCurrentFile(saveFile)
	{
		//save in current file
		var save = saveFile
	
		ini_open("PINKsaveData.ini");

		ini_write_real(save,"empty",1);
		ini_write_real(save,"positionX",0);
		ini_write_real(save,"positionY",0);
		ini_write_string(save,"location","Jam Level");
		ini_write_real(save,"time",0)
		
		loadSavesIntoVariables()
	
		ini_close();
	}
	
function loadSavesIntoVariables()
{
		ini_open("PINKsaveData.ini")
	
		oAtuin.save1[0] = "file1"
		oAtuin.save1[1] = ini_read_real("file1","empty", 0)
		oAtuin.save1[2] = ini_read_real("file1","positionX", 0)
		oAtuin.save1[3] = ini_read_real("file1","positionY", 0)
		oAtuin.save1[4] = ini_read_string("file1","location", 0)
		oAtuin.save1[5] = ini_read_real("file1","time", 0)
	
		oAtuin.save2[0] = "file2"
		oAtuin.save2[1] = ini_read_real("file2","empty", 0)
		oAtuin.save2[2] = ini_read_real("file2","positionX", 0)
		oAtuin.save2[3] = ini_read_real("file2","positionY", 0)
		oAtuin.save2[4] = ini_read_string("file2","location", 0)
		oAtuin.save2[5] = ini_read_real("file2","time", 0)
	
		oAtuin.save3[0] = "file3"
		oAtuin.save3[1] = ini_read_real("file3","empty", 0)
		oAtuin.save3[2] = ini_read_real("file3","positionX", 0)
		oAtuin.save3[3] = ini_read_real("file3","positionY", 0)
		oAtuin.save3[4] = ini_read_string("file3","location", 0)
		oAtuin.save3[5] = ini_read_real("file3","time", 0)
		
		ini_close();
		
		if(oAtuin.currentSave != EMPTY)
		{
			if(oAtuin.currentSave[0] == "file1") oAtuin.currentSave = oAtuin.save1;
			else if(oAtuin.currentSave[0] == "file2") oAtuin.currentSave = oAtuin.save2;
			else if(oAtuin.currentSave[0] == "file3") oAtuin.currentSave = oAtuin.save3;
		}
	
}
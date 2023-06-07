package;

import flixel.math.FlxMath;
import flixel.math.FlxRandom;
import flixel.math.FlxPoint;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import sys.FileSystem;
import openfl.Lib;
#if desktop
import Discord.DiscordClient;
#end

using StringTools;

class PlayMenuState extends MusicBeatState
{
	var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;

	var optionShit:Array<String> = ['disruption', 'applecore', 'disability', 'wireframe', 'algebra', 'deformation', 'ferocious', 'extras'];

	var newGaming:FlxText;
	var newGaming2:FlxText;
	var newInput:Bool;

	public static var firstStart:Bool = true;

	public static var finishedFunnyMove:Bool = false;

	var lerpScore:Int = 0;
	var intendedScore:Int = 0;

	var bg:FlxSprite;

	var magenta:FlxSprite;
	var difSpr:FlxSprite;
	var camFollow:FlxObject;
	public static var bgPaths:Array<String> = 
	[
		'backgrounds/biorange',
		'backgrounds/cudroid',
		'backgrounds/dreambean',
		'backgrounds/roflcopter',
		'backgrounds/vio',
		'backgrounds/zevisly'
	];

	override function create()
	{
		if (!FlxG.sound.music.playing)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}

		persistentUpdate = persistentDraw = true;
		
		if (FlxG.save.data.eyesores == null)
		{
			FlxG.save.data.eyesores = true;
		}

		#if desktop
		DiscordClient.changePresence("In the Menus", null);
		#end
		
		if (FlxG.save.data.unlockedcharacters == null)
		{
			FlxG.save.data.unlockedcharacters = [true,true,false,false,false,false];
		}
		
		bg = new FlxSprite(-80).loadGraphic(Paths.image('menu/${optionShit[0]}'));
		bg.scrollFactor.set();
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		bg.color = 0xFFFDE871;
		add(bg);

		magenta = new FlxSprite(-80).loadGraphic(bg.graphic);
		magenta.scrollFactor.set();
		magenta.setGraphicSize(Std.int(magenta.width * 1.1));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = true;
		magenta.color = 0xFFfd719b;
		add(magenta);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		FlxG.camera.follow(camFollow, null, 0.06);
		
		camFollow.setPosition(640, 150.5);
		for (i in 0...optionShit.length)
		{
			var tex = Paths.getSparrowAtlas('buttons/' + optionShit[i]);
			var menuItem:FlxSprite = new FlxSprite(0, FlxG.height * 1.6);
			menuItem.frames = tex;
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItem.screenCenter(X);
			menuItems.add(menuItem);
			menuItem.scrollFactor.set(0, 1);
			menuItem.antialiasing = true;
			if (firstStart)
				FlxTween.tween(menuItem,{y: 60 + (i * 160)},1 + (i * 0.25) ,{ease: FlxEase.expoInOut, onComplete: function(flxTween:FlxTween) 
					{
						finishedFunnyMove = true; 
						changeItem();
					}});
			else
				menuItem.y = 60 + (i * 160);
		}

		firstStart = false;

		difSpr = new FlxSprite(0, 0).loadGraphic(Paths.image('diff/hard'));
		difSpr.scale.set(0.5, 0.5);
		difSpr.scrollFactor.set();
		difSpr.screenCenter();
		difSpr.x *= 2.35;
		difSpr.y *= 3.2;
		add(difSpr);

		var versionShit:FlxText = new FlxText(5, FlxG.height - 24, 0, "1.2 Golden Apple Engine", 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat(Paths.font("comic.ttf"), 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		if (FlxG.save.data.dfjk)
			controls.setKeyboardScheme(KeyboardScheme.Solo, true);
		else
			controls.setKeyboardScheme(KeyboardScheme.Duo(true), true);

		changeItem();

		super.create();
	}

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.UI_BACK)
			{
				FlxG.switchState(new MainMenuState());
			}

			if (controls.ACCEPT)
			{
				selectedSomethin = true;

				magenta.loadGraphic(Paths.image('menu/${optionShit[curSelected]}'));
				magenta.setGraphicSize(1280);
				magenta.updateHitbox();
				magenta.screenCenter();

				FlxG.sound.play(Paths.sound('confirmMenu'));

				FlxFlicker.flicker(magenta, 1.1, 0.15, false);

				menuItems.forEach(function(spr:FlxSprite)
				{
					if (curSelected != spr.ID)
					{
						FlxTween.tween(spr, {alpha: 0}, 1.3, {
							ease: FlxEase.quadOut,
							onUpdate: function(twn:FlxTween)
							{
								difSpr.alpha = spr.alpha;
							},
							onComplete: function(twn:FlxTween)
							{
								difSpr.kill();
								spr.kill();
							}
						});
					}
					else
					{
						FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
						{
							var daChoice:String = optionShit[curSelected];
							switch (daChoice)
							{
								case 'story mode':
									FlxG.switchState(new StoryMenuState());
								case 'extras':
									FlxG.switchState(new CategorySelect());
								default:
									var poop:String = Highscore.formatSong(daChoice, 1);
									trace(poop);
							
									PlayState.SONG = Song.loadFromJson(poop, daChoice);
									PlayState.isStoryMode = false;
									PlayState.storyDifficulty = 1;
									PlayState.xtraSong = false;
							
									PlayState.storyWeek = 1;
									PlayState.characteroverride = 'none';
									PlayState.formoverride = 'none';
									LoadingState.loadAndSwitchState(new PlayState());
							}
						});
					}
				});
				
			}
		}

		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.screenCenter(X);
		});
	}

	override function beatHit()
	{
		super.beatHit();
		
	}

	function changeItem(huh:Int = 0)
	{
		if (finishedFunnyMove)
		{
			curSelected += huh;

			if (curSelected >= menuItems.length)
				curSelected = 0;
			if (curSelected < 0)
				curSelected = menuItems.length - 1;	
		}

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');

			if (spr.ID == curSelected && finishedFunnyMove)
			{
				spr.animation.play('selected');
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y);
			}

			spr.updateHitbox();
		});

		#if !switch
		intendedScore = Highscore.getScore(optionShit[curSelected], 1);
		#end

		bg.loadGraphic(Paths.image('menu/${optionShit[curSelected]}'));
		bg.setGraphicSize(1280);
		bg.updateHitbox();
		bg.screenCenter();

		var optionShit:Array<String> = ['disruption', 'applecore', 'disability', 'wireframe', 'algebra', 'deformation', 'ferocious', 'extras'];

		difSpr.visible = true;

		switch (curSelected) {
			case 1:
				difSpr.loadGraphic(Paths.image('diff/extreme'));
			case 2 | 3:
				difSpr.loadGraphic(Paths.image('diff/normal'));
			case 7:
				difSpr.visible = false;
			default:
				difSpr.loadGraphic(Paths.image('diff/hard'));
		}
	}
	public static function randomizeBG():flixel.system.FlxAssets.FlxGraphicAsset
	{
		var chance:Int = FlxG.random.int(0, bgPaths.length - 1);
		return Paths.image(bgPaths[chance]);
	}
}

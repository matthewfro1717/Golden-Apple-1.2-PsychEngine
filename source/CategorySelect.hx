package;

import lime.app.Application;
import flash.text.TextField;
import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.system.FlxSound;
import openfl.display.BitmapData;
import openfl.utils.Assets as OpenFlAssets;
import flixel.graphics.FlxGraphic;
#if desktop
import Discord.DiscordClient;
#end

using StringTools;

class CategorySelect extends MusicBeatState
{
	var bg:FlxSprite;
	var extras:FlxSprite;
	var ocs:FlxSprite;
	var joke:FlxSprite;
	var ifyouknow:FlxSprite;
	var secret:FlxSprite;
	var top10:FlxSprite;
	var covers:FlxSprite;

	var shits:Array<String> = ['extra', 'ocs', 'joke', 'iykyk', 'secret', 'awesome', 'covers'];
	var sprites:FlxTypedGroup<FlxSprite> = new FlxTypedGroup<FlxSprite>();
	var xdScale:Float = 2.5;
	var curSelected = 0;
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
		bg = new FlxSprite(-80).loadGraphic(randomizeBG());
		bg.scrollFactor.set();
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		bg.color = FlxColor.LIME;
		add(bg);

		extras = new FlxSprite(-80).loadGraphic(Paths.image('categories/' + shits[0]));
		extras.scale.set(xdScale, xdScale);
		extras.visible = false;
		extras.screenCenter();
		sprites.add(extras);
		add(extras);

		ocs = new FlxSprite(-80).loadGraphic(Paths.image('categories/' + shits[1]));
		ocs.scale.set(xdScale, xdScale);
		ocs.visible = false;
		ocs.screenCenter();
		sprites.add(ocs);
		add(ocs);

		joke = new FlxSprite(-80).loadGraphic(Paths.image('categories/' + shits[2]));
		joke.scale.set(xdScale, xdScale);
		joke.visible = false;
		joke.screenCenter();
		sprites.add(joke);
		add(joke);

		ifyouknow = new FlxSprite(-80).loadGraphic(Paths.image('categories/' + shits[3]));
		ifyouknow.scale.set(xdScale, xdScale);
		ifyouknow.visible = false;
		ifyouknow.screenCenter();
		sprites.add(ifyouknow);
		add(ifyouknow);

		secret = new FlxSprite(-80).loadGraphic(Paths.image('categories/' + shits[4]));
		secret.scale.set(xdScale, xdScale);
		secret.visible = false;
		secret.screenCenter();
		sprites.add(secret);
		add(secret);

		top10 = new FlxSprite(-80).loadGraphic(Paths.image('categories/' + shits[5]));
		top10.scale.set(xdScale, xdScale);
		top10.visible = false;
		top10.screenCenter();
		sprites.add(top10);
		add(top10);

		covers = new FlxSprite(-80).loadGraphic(Paths.image('categories/' + shits[6]));
		covers.scale.set(xdScale, xdScale);
		covers.visible = false;
		covers.screenCenter();
		sprites.add(covers);
		add(covers);
	}

	override function update(elapsed:Float) {
		if (controls.LEFT_P)
			curSelected -= 1; 

		if (controls.RIGHT_P)
			curSelected += 1;

		if (curSelected == shits.length)
			curSelected = 0;
		if (curSelected == -1) //ez fix1!1!!!
			curSelected = shits.length - 1;

		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			FlxG.switchState(new PlayMenuState());
		}

		if (controls.ACCEPT) 
			acceptShit();

		extras.visible = false;
		ocs.visible = false;
		joke.visible = false;
		ifyouknow.visible = false;
		secret.visible = false;
		top10.visible = false;
		covers.visible = false;

		switch (curSelected) {
			case 0:
				extras.visible = true;
				ExtraSongState.category = 0;
			case 1:
				ocs.visible = true;
				ExtraSongState.category = 1;
			case 2:
				joke.visible = true;
				ExtraSongState.category = 2;
			case 3:
				ifyouknow.visible = true;
				ExtraSongState.category = 3;
			case 4:
				secret.visible = true;
				ExtraSongState.category = 4;
			case 5:
				top10.visible = true;
				ExtraSongState.category = 5;
			case 6:
				covers.visible = true;
				ExtraSongState.category = 6;
			default:
				trace("You aren't supposed to be here, curSelected is " + curSelected);
		}
	}

	function acceptShit() {
		var timer:Float = 1;
		var tween = FlxEase.sineIn;
		var scale:Float = 0.65;
		FlxTween.tween(bg.scale, {x: scale, y: scale}, timer, {ease: tween});

		sprites.forEach(function(spr:FlxSprite){
			if (spr.visible == true)
				FlxTween.tween(spr.scale, {x: 5, y: 5}, timer, {ease: tween});
		});

		new FlxTimer().start(scale * 0.9, function(tmr:FlxTimer) {
			FlxG.switchState(new ExtraSongState());
		});

		FlxG.sound.play(Paths.sound('confirmMenu'));
	}

	public static function randomizeBG():flixel.system.FlxAssets.FlxGraphicAsset
	{
		var chance:Int = FlxG.random.int(0, bgPaths.length - 1);
		return Paths.image(bgPaths[chance]);
	}
}
package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;

/**
 * ...
 * @author 
 */
class StateClub extends FlxState 
{
	private var _map:FlxOgmoLoader;
	private var murs:FlxTilemap;
	private var joueur:Player;
	private var groupeProjectiles:FlxTypedGroup<Projectile>;
	private var groupeVase:FlxTypedGroup<Vase>;
	private var groupePomme:FlxTypedGroup<Apple>;
	private var compteurPomme:Int = 0;
	private var textePomme:FlxText;
	
	override public function create() 
	{
		_map = new FlxOgmoLoader(AssetPaths.room_001__oel);
		murs = _map.loadTilemap(AssetPaths.tiles__png, 16, 16, "tiles");
		murs.follow();
		murs.setTileProperties(1, FlxObject.NONE);
		murs.setTileProperties(2, FlxObject.ANY);
		joueur = new Player(0, 0);
		FlxG.camera.follow(joueur, TOPDOWN, 1);
		add(murs);
		groupeVase = new FlxTypedGroup<Vase>();
		add(groupeVase);
		_map.loadEntities(placeEntities, "entities");
		add(joueur);
		groupeProjectiles = new FlxTypedGroup<Projectile>();
		joueur.groupeProjectile = groupeProjectiles;
		add(groupeProjectiles);
		groupePomme = new FlxTypedGroup<Apple>();
		textePomme = new FlxText(10, 10, 0, "Pommes: 0", 8);
		textePomme.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
		textePomme.scrollFactor.set(0, 0);
		add(groupePomme);
		add(textePomme);
		super.create();
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		if (entityName == "player")
		{
			joueur.x = x;
			joueur.y = y;
		}
		if (entityName == "vase")
		{
			groupeVase.add(new Vase(x, y));
		}
	}
}
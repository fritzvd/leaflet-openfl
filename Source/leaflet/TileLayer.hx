package leaflet;

import leaflet.LMap;
import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.Loader;
import openfl.events.Event;
import openfl.net.URLRequest;

class TileLayer extends Sprite {
    private var _url:String;
    public var _map:LMap;
    public var events:Events;

    public function new (url ) {
        super();
        events = new Events();
        events.addEventListener('added', update);

        _url = url;
    }

    public function addTo (map) {
        this._map = map;
        this._map.addLayer(this);
        events.dispatchEvent(new Event('added'));

        return this;
    }

    public function getZoom() {
        return _map.getZoom();

    }
    public function getCenter() {
        return _map.getCenter();
    }

    public function whichTiles () {
       var center = getCenter();
       
       var zoom = getZoom();
       trace(stage);
       var topleft = _map._getNewTopLeftPoint(center, zoom);
       trace(topleft);



       trace(center);
       
       //getPixelBounds, zoom,gettilesize


       var jan:Array<Dynamic> = [];
       return jan;
    }

    public function update (?e:Event) {
        var queue:Array<Dynamic> = this.whichTiles();
        
    }

    public function getTile (tile, tilePoint) {
      // tiles in queue calculated how many and where.   
    }

    public function loadTile (url) {
        var loader  =  new openfl.display.Loader();
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, jean);
        loader.load( new openfl.net.URLRequest(url));
    }

    public function addTile(data:Event) {
        var bit = cast(data.currentTarget.content, openfl.display.Bitmap);
        addChild(bit);
    }

    public function jean (data:Event) {
        trace('blurav');
    }


}

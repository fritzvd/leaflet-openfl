package leaflet;

import leaflet.LMap;
import openfl.display.Sprite;
import openfl.events.Event;

class TileLayer extends Sprite {
    private var _url:String;

    public function new (url ) {
        _url = url;
        super();
    }

    public function addTo (map) {
        this.update(_url);
        map.addLayer(this);
        return this;
    }

    public function update (url) {
        var loader  =  new openfl.display.Loader();
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, jean);
        loader.load( new openfl.net.URLRequest(url));
    }

    public function jean (data:Event) {
        // var bitdata = new openfl.display.BitmapData(3, 5);c
        var bit = cast(data.currentTarget.content, openfl.display.Bitmap);
        
        addChild(bit);
    }


}

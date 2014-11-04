package leaflet;

import leaflet.LMap;

class TileLayer {
    private var _url:String;

    public function new (url ) {
        _url = url;
    }

    public function (map) {
        map.addLayer(this);
        return this;

    }

    public function update (url) {
        var loader  =  new flash.display.Loader();
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, jean);
        loader.load( new flash.net.URLRequest(url));
    }

    public function jean (data:Event) {
        // var bitdata = new openfl.display.BitmapData(3, 5);c
        var bit = cast(data.currentTarget.content, openfl.display.Bitmap);
        
        _sprite.addChild(bit);
    }


}

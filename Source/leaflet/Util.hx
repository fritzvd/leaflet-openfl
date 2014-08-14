package leaflet;

class Util {
    
    public var lastId:Int = 0;

    static public function extend (dest:Map<String, Dynamic>, extension:Map<String, Dynamic>) {
        for (key in dest.keys()) {
            extension[key] = dest[key];
        }
        return extension;
    }

    static public function bind (fn, obj:Map<String, Dynamic>) {
        return function () {
            return fn(obj);
        }
    }

    inline public function stamp () {
        var key = '_leaflet_id';
        return function (obj:Map<String, Dynamic>) {
            if (obj[key] != null) {
                obj[key] = obj[key];
            } else  {
                 obj[key] = ++lastId;
            }
            return obj[key];
        }
    }

    

}
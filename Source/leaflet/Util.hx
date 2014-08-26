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

    static public function stamp (obj:Map<String, Dynamic>, lastId) {
        var key = '_leaflet_id';
        if (obj[key] != null) {
            obj[key] = obj[key];
        } else  {
             obj[key] = ++lastId;
        }
        return obj[key];
    }

    

}
package asgui.blit.data
{
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   class BlitDataPlistInfo extends BlitDataSpritesheetInfo
   {
       
      
      function BlitDataPlistInfo(param1:IEventDispatcher = null)
      {
         super();
      }
      
      public static function AnalysePlistArrayToList(param1:Array) : Array
      {
         var _loc3_:int = 0;
         var _loc2_:Array = [];
         var _loc4_:int = param1.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc2_.push(param1[_loc3_ + 1]);
            _loc3_ += 2;
         }
         return _loc2_;
      }
      
      public static function AnalysePlistStringToRect(param1:String) : Rectangle
      {
         while(param1.indexOf("{") != -1)
         {
            param1 = param1.replace("{","");
         }
         while(param1.indexOf("}") != -1)
         {
            param1 = param1.replace("}","");
         }
         var _loc2_:Array = param1.split(",");
         return new Rectangle(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]);
      }
      
      public static function AnalysePlistStringToPoint(param1:String) : Point
      {
         while(param1.indexOf("{") != -1)
         {
            param1 = param1.replace("{","");
         }
         while(param1.indexOf("}") != -1)
         {
            param1 = param1.replace("}","");
         }
         var _loc2_:Array = param1.split(",");
         return new Point(_loc2_[0],_loc2_[1]);
      }
      
      public static function AnalysePlistArrayToObject(param1:Array) : Object
      {
         var _loc2_:int = 0;
         var _loc3_:int = param1.length;
         var _loc4_:Object = {};
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_[param1[_loc2_]] = param1[_loc2_ + 1];
            _loc2_ += 2;
         }
         return _loc4_;
      }
      
      public static function AnalysePlistToArray(param1:XMLList) : Array
      {
         var _loc3_:int = 0;
         var _loc5_:XML = null;
         var _loc6_:Object = null;
         var _loc2_:int = param1.length();
         var _loc4_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc6_ = (_loc5_ = param1[_loc3_]).localName()) == "dict")
            {
               _loc4_.push(AnalysePlistToArray(_loc5_.children()));
            }
            else if(_loc6_ == "true")
            {
               _loc4_.push(true);
            }
            else if(_loc6_ == "false")
            {
               _loc4_.push(false);
            }
            else if(_loc6_ == "integer")
            {
               _loc4_.push(int(_loc5_.text()));
            }
            else
            {
               _loc4_.push(String(_loc5_.text()));
            }
            _loc3_++;
         }
         return _loc4_;
      }
      
      override public function LoadXml(param1:XML) : void
      {
         var _loc2_:int = 0;
         var _loc9_:Object = null;
         var _loc10_:Rectangle = null;
         var _loc11_:Point = null;
         var _loc12_:Boolean = false;
         var _loc13_:Rectangle = null;
         var _loc14_:Point = null;
         var _loc3_:Array = AnalysePlistToArray(param1.children());
         var _loc4_:Object = AnalysePlistArrayToObject(_loc3_[0]);
         var _loc5_:Array = AnalysePlistArrayToList(_loc4_["frames"]);
         var _loc6_:Object = AnalysePlistArrayToObject(_loc4_["metadata"]);
         imagePath = _loc6_["realTextureFileName"];
         var _loc7_:int = _loc5_.length;
         _loc2_ = 0;
         while(_loc2_ < _loc7_)
         {
            _loc5_[_loc2_] = AnalysePlistArrayToObject(_loc5_[_loc2_]);
            _loc2_++;
         }
         _loc7_ = _loc5_.length;
         frameRects = [];
         _loc2_ = 0;
         while(_loc2_ < _loc7_)
         {
            if((_loc9_ = _loc5_[_loc2_])["frame"])
            {
               _loc10_ = AnalysePlistStringToRect(_loc9_["frame"]);
            }
            else
            {
               _loc10_ = new Rectangle(_loc9_["x"],_loc9_["y"],_loc9_["width"],_loc9_["height"]);
            }
            if(_loc9_["offset"])
            {
               _loc11_ = AnalysePlistStringToPoint(_loc9_["offset"]);
            }
            else
            {
               _loc11_ = new Point(_loc9_["offsetX"],_loc9_["offsetY"]);
            }
            _loc12_ = false;
            if(_loc9_["rotated"])
            {
               _loc12_ = _loc9_["rotated"];
            }
            if(_loc9_["sourceColorRect"])
            {
               _loc13_ = AnalysePlistStringToRect(_loc9_["sourceColorRect"]);
            }
            if(_loc9_["sourceSize"])
            {
               _loc14_ = AnalysePlistStringToPoint(_loc9_["sourceSize"]);
            }
            else
            {
               _loc14_ = new Point(_loc9_["originalWidth"],_loc9_["originalHeight"]);
            }
            frameRects.push(new BlitDataSpritesheetFrameInfo(new Rectangle(_loc10_.x,_loc10_.y,_loc10_.width,_loc10_.height),_loc11_,_loc12_,_loc14_));
            _loc2_++;
         }
         var _loc8_:String = url.substring(0,url.lastIndexOf("/") + 1);
         LoadImgByUrl(_loc8_ + imagePath);
      }
   }
}

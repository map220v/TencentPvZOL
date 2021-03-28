package asgui.utils
{
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public final class TextureUtil
   {
      
      public static const SUB_TEXTURE:String = "SubTexture";
      
      public static const A_X:String = "x";
      
      public static const A_Y:String = "y";
      
      public static const A_WIDTH:String = "width";
      
      public static const A_HEIGHT:String = "height";
       
      
      public function TextureUtil()
      {
         super();
      }
      
      public static function PackTextures(param1:Vector.<BitmapData>, param2:Vector.<Rectangle>, param3:uint = 1, param4:Boolean = false) : BitmapData
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:BitmapData = null;
         var _loc8_:BitmapData = null;
         var _loc10_:uint = 0;
         var _loc14_:Boolean = false;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Rectangle = null;
         var _loc20_:Rectangle = null;
         var _loc21_:Rectangle = null;
         var _loc22_:int = 0;
         var _loc25_:int = 0;
         if(param1.length == 0)
         {
            return null;
         }
         _loc5_ = 1;
         while(_loc5_ < param1.length)
         {
            _loc7_ = param1[_loc5_];
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc8_ = param1[_loc6_];
               _loc6_++;
            }
            _loc5_++;
         }
         var _loc9_:uint = 0;
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            _loc7_ = param1[_loc5_];
            _loc9_ += _loc7_.width * _loc7_.height;
            _loc5_++;
         }
         var _loc11_:Vector.<BitmapData>;
         (_loc11_ = param1.concat()).sort(sortTextureList);
         _loc10_ = Math.sqrt(_loc9_);
         _loc10_ = getNearest2N(Math.max(_loc11_[0].width + param3,_loc10_));
         var _loc12_:uint = 40960;
         var _loc13_:Vector.<Rectangle>;
         (_loc13_ = new Vector.<Rectangle>()).push(new Rectangle(0,0,_loc10_,_loc12_));
         do
         {
            _loc19_ = getHighestRect(_loc13_);
            _loc22_ = _loc13_.indexOf(_loc19_);
            _loc14_ = false;
            _loc5_ = 0;
            while(_loc5_ < _loc11_.length)
            {
               _loc15_ = (_loc7_ = _loc11_[_loc5_]).width + param3;
               _loc16_ = _loc7_.height + param3;
               if(_loc19_.width >= _loc15_ && _loc19_.height >= _loc16_)
               {
                  if(!!param4 ? (_loc16_ > _loc15_ * 4 ? (_loc22_ > 0 ? _loc19_.height - _loc16_ >= _loc13_[_loc22_ - 1].height : true) : true) : true)
                  {
                     _loc14_ = true;
                     break;
                  }
               }
               _loc5_++;
            }
            if(_loc14_)
            {
               _loc25_ = param1.indexOf(_loc7_);
               param2[_loc25_] = new Rectangle(_loc19_.x,_loc19_.y,_loc7_.width,_loc7_.height);
               _loc11_.splice(_loc5_,1);
               _loc13_.splice(_loc22_ + 1,0,new Rectangle(_loc19_.x + _loc15_,_loc19_.y,_loc19_.width - _loc15_,_loc19_.height));
               _loc19_.y += _loc16_;
               _loc19_.width = _loc15_;
               _loc19_.height -= _loc16_;
            }
            else
            {
               if(_loc22_ == 0)
               {
                  _loc21_ = _loc13_[_loc22_ + 1];
               }
               else if(_loc22_ == _loc13_.length - 1)
               {
                  _loc21_ = _loc13_[_loc22_ - 1];
               }
               else
               {
                  _loc20_ = _loc13_[_loc22_ - 1];
                  _loc21_ = _loc13_[_loc22_ + 1];
                  _loc21_ = _loc20_.height <= _loc21_.height ? _loc21_ : _loc20_;
               }
               if(_loc19_.x < _loc21_.x)
               {
                  _loc21_.x = _loc19_.x;
               }
               _loc21_.width = _loc19_.width + _loc21_.width;
               _loc13_.splice(_loc22_,1);
            }
         }
         while(_loc11_.length > 0);
         
         _loc12_ = getNearest2N(_loc12_ - getLowestRect(_loc13_).height);
         var _loc23_:BitmapData = new BitmapData(_loc10_,_loc12_,true,0);
         var _loc24_:Rectangle = new Rectangle();
         _loc5_ = 0;
         while(_loc5_ < param1.length)
         {
            _loc7_ = param1[_loc5_];
            _loc24_.width = _loc7_.width;
            _loc24_.height = _loc7_.height;
            _loc19_ = param2[_loc5_];
            _loc23_.copyPixels(_loc7_,_loc24_,_loc19_.topLeft);
            _loc5_++;
         }
         return _loc23_;
      }
      
      private static function sortTextureList(param1:BitmapData, param2:BitmapData) : int
      {
         var _loc3_:uint = param1.width + param1.height;
         var _loc4_:uint = param2.width + param2.height;
         if(_loc3_ == _loc4_)
         {
            return param1.width > param2.width ? -1 : 1;
         }
         return _loc3_ > _loc4_ ? -1 : 1;
      }
      
      private static function getNearest2N(param1:uint) : uint
      {
         return !!(param1 & param1 - 1) ? uint(1 << param1.toString(2).length) : uint(param1);
      }
      
      private static function getHighestRect(param1:Vector.<Rectangle>) : Rectangle
      {
         var _loc3_:Rectangle = null;
         var _loc4_:Rectangle = null;
         var _loc2_:uint = 0;
         for each(_loc4_ in param1)
         {
            if(_loc4_.height > _loc2_)
            {
               _loc2_ = _loc4_.height;
               _loc3_ = _loc4_;
            }
         }
         return _loc3_;
      }
      
      private static function getLowestRect(param1:Vector.<Rectangle>) : Rectangle
      {
         var _loc3_:Rectangle = null;
         var _loc4_:Rectangle = null;
         var _loc2_:uint = 40960;
         for each(_loc4_ in param1)
         {
            if(_loc4_.height < _loc2_)
            {
               _loc2_ = _loc4_.height;
               _loc3_ = _loc4_;
            }
         }
         return _loc3_;
      }
   }
}

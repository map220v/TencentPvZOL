package asgui.serialization.base64
{
   import flash.utils.ByteArray;
   
   public class Base64Util
   {
      
      private static const encodeChars:Array = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9","+","/"];
      
      private static const decodeChars:Array = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,62,-1,-1,-1,63,52,53,54,55,56,57,58,59,60,61,-1,-1,-1,-1,-1,-1,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,-1,-1,-1,-1,-1,-1,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,-1,-1,-1,-1,-1];
       
      
      public function Base64Util()
      {
         super();
      }
      
      public static function encode(param1:ByteArray) : String
      {
         var _loc7_:* = 0;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = param1.length % 3;
         var _loc6_:int = param1.length - _loc5_;
         while(_loc3_ < _loc6_)
         {
            _loc7_ = param1[_loc3_++] << 16 | param1[_loc3_++] << 8 | param1[_loc3_++];
            var _loc8_:*;
            _loc2_[_loc8_ = _loc4_++] = encodeChars[_loc7_ >> 18] + encodeChars[_loc7_ >> 12 & 63] + encodeChars[_loc7_ >> 6 & 63] + encodeChars[_loc7_ & 63];
         }
         if(_loc5_ == 1)
         {
            _loc7_ = int(param1[_loc3_++]);
            _loc2_[_loc8_ = _loc4_++] = encodeChars[_loc7_ >> 2] + encodeChars[(_loc7_ & 3) << 4] + "==";
         }
         else if(_loc5_ == 2)
         {
            _loc7_ = param1[_loc3_++] << 8 | param1[_loc3_++];
            _loc2_[_loc8_ = _loc4_++] = encodeChars[_loc7_ >> 10] + encodeChars[_loc7_ >> 4 & 63] + encodeChars[(_loc7_ & 15) << 2] + "=";
         }
         return _loc2_.join("");
      }
      
      public static function decode(param1:String) : ByteArray
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:ByteArray = null;
         _loc7_ = param1.length;
         _loc6_ = 0;
         _loc8_ = new ByteArray();
         loop0:
         while(_loc6_ < _loc7_)
         {
            do
            {
               _loc2_ = decodeChars[param1.charCodeAt(_loc6_++) & 255];
            }
            while(_loc6_ < _loc7_ && _loc2_ == -1);
            
            if(_loc2_ == -1)
            {
               break;
            }
            do
            {
               _loc3_ = decodeChars[param1.charCodeAt(_loc6_++) & 255];
            }
            while(_loc6_ < _loc7_ && _loc3_ == -1);
            
            if(_loc3_ == -1)
            {
               break;
            }
            _loc8_.writeByte(_loc2_ << 2 | (_loc3_ & 48) >> 4);
            while((_loc4_ = param1.charCodeAt(_loc6_++) & 255) != 61)
            {
               _loc4_ = int(decodeChars[_loc4_]);
               if(!(_loc6_ < _loc7_ && _loc4_ == -1))
               {
                  if(_loc4_ == -1)
                  {
                     break loop0;
                  }
                  _loc8_.writeByte((_loc3_ & 15) << 4 | (_loc4_ & 60) >> 2);
                  while((_loc5_ = param1.charCodeAt(_loc6_++) & 255) != 61)
                  {
                     _loc5_ = int(decodeChars[_loc5_]);
                     if(!(_loc6_ < _loc7_ && _loc5_ == -1))
                     {
                        if(_loc5_ == -1)
                        {
                           break loop0;
                        }
                        _loc8_.writeByte((_loc4_ & 3) << 6 | _loc5_);
                        continue loop0;
                     }
                  }
                  return _loc8_;
               }
            }
            return _loc8_;
         }
         return _loc8_;
      }
   }
}

package asgui.blit.data
{
   import flash.geom.Rectangle;
   
   class BlitDataStarlingInfo extends BlitDataSpritesheetInfo
   {
       
      
      function BlitDataStarlingInfo()
      {
         super();
      }
      
      override public function LoadXml(param1:XML) : void
      {
         var _loc3_:int = 0;
         var _loc4_:XML = null;
         var _loc5_:Rectangle = null;
         imagePath = param1.@imagePath;
         var _loc2_:XMLList = param1["SubTexture"];
         var _loc6_:int = _loc2_.length();
         frameRects = [];
         _loc3_ = 0;
         while(_loc3_ < _loc6_)
         {
            _loc4_ = _loc2_[_loc3_];
            frameRects.push(new BlitDataSpritesheetFrameInfo(new Rectangle(_loc4_.@x,_loc4_.@y,_loc4_.@width,_loc4_.@height)));
            _loc3_++;
         }
         var _loc7_:String = url.substring(0,url.lastIndexOf("/") + 1);
         LoadImgByUrl(_loc7_ + imagePath);
      }
   }
}

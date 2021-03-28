package asgui.blit.data
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   class BlitDataSpritesheetFrameInfo
   {
       
      
      public var rect:Rectangle;
      
      public var offset:Point;
      
      public var rotated:Boolean;
      
      public var sourceSize:Point;
      
      function BlitDataSpritesheetFrameInfo(param1:Rectangle, param2:Point = null, param3:Boolean = false, param4:Point = null)
      {
         super();
         this.rect = param1;
         this.rotated = param3;
         if(param2)
         {
            this.offset = param2;
         }
         else
         {
            this.offset = new Point();
         }
         if(param4)
         {
            this.sourceSize = param4;
         }
         else
         {
            this.sourceSize = param1.size;
         }
      }
   }
}

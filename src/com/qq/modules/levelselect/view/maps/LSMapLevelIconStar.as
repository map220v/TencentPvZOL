package com.qq.modules.levelselect.view.maps
{
   import asgui.resources.AssetManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class LSMapLevelIconStar extends Sprite
   {
       
      
      private var bmp:Bitmap;
      
      public var enable:Boolean;
      
      public function LSMapLevelIconStar()
      {
         super();
         this.bmp = new Bitmap();
         this.addChild(this.bmp);
      }
      
      public function setEnable(param1:Boolean, param2:Boolean = false) : void
      {
         this.enable = param1;
         this.bmp.bitmapData = AssetManager.GetNewClass(!!param1 ? "LS_Icon_Star_Open" : "LS_Icon_Star_Close") as BitmapData;
      }
   }
}

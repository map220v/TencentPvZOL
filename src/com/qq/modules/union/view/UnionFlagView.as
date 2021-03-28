package com.qq.modules.union.view
{
   import PVZ.Cmd.Dto_Guild_FlagInfo;
   import asgui.core.IDisposable;
   import com.qq.constant.union.UnionConstant;
   import com.qq.utils.DMath;
   import com.qq.utils.UrlManager;
   import flash.display.Bitmap;
   import flash.display.Loader;
   import flash.display.Sprite;
   
   public class UnionFlagView extends Sprite implements IDisposable
   {
      
      private static var Flag_Width:int;
      
      private static var Flag_Height:int;
       
      
      private var _surfaceColorID:int;
      
      private var _signColorID:int;
      
      private var _signID:int;
      
      private var _surfaceID:int;
      
      private var _isSmall:Boolean;
      
      private var bmp:Bitmap;
      
      public var bg:Loader;
      
      public function UnionFlagView(param1:Boolean = true, param2:Boolean = true, param3:Boolean = false)
      {
         var _loc4_:String = null;
         super();
         this._surfaceColorID = -1;
         this._signID = -1;
         this._surfaceID = -1;
         this._isSmall = param1;
         if(param1)
         {
            Flag_Width = 28;
            Flag_Height = 28;
         }
         else
         {
            Flag_Width = 50;
            Flag_Height = 50;
         }
         this.bmp = new Bitmap();
         this.addChild(this.bmp);
         if(param2)
         {
            this.bg = new Loader();
            if(param3)
            {
               _loc4_ = UrlManager.getInstance().getUrl(UrlManager.Url_Union_Flag,"bg_occupied.png");
            }
            else
            {
               _loc4_ = UrlManager.getInstance().getUrl(UrlManager.Url_Union_Flag,"bg.png");
            }
            this.bg.x = Flag_Width * 0.5 - 66 * 0.5;
            this.bg.y = -5;
            addChildAt(this.bg,0);
         }
      }
      
      public function random() : void
      {
         var _loc1_:int = DMath.randNum(1,UnionConstant.Color_Surface_Total);
         var _loc2_:int = DMath.randNum(1,UnionConstant.Color_Sign_Total);
         var _loc3_:int = DMath.randNum(1,UnionConstant.Surface_Total);
         var _loc4_:int = DMath.randNum(1,UnionConstant.Sign_Total);
         this.changeByIndex(_loc4_,_loc2_,_loc3_,_loc1_);
      }
      
      public function change(param1:Dto_Guild_FlagInfo) : void
      {
         this.changeByIndex(param1.signId,param1.color2Id,param1.surfaceId,param1.colorId);
      }
      
      public function changeByIndex(param1:int, param2:int, param3:int, param4:int) : void
      {
         this._signID = param1;
         this._signColorID = param2;
         this._surfaceID = param3;
         this._surfaceColorID = param4;
         this.update();
      }
      
      private function update() : int
      {
         this.bmp.bitmapData = UnionFlagCacheManager.instance.getFlagBitmapData(this.getSignID(),this.getSignColorID(),this.getSurfaceID(),this.getSurfaceColorID(),this._isSmall);
         return 1;
      }
      
      public function getSurfaceColorID() : int
      {
         return this._surfaceColorID;
      }
      
      public function getSurfaceID() : int
      {
         return this._surfaceID;
      }
      
      public function getSignColorID() : int
      {
         return this._signColorID;
      }
      
      public function getSignID() : int
      {
         return this._signID;
      }
      
      public function Dispose() : void
      {
         this.bmp = null;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this.bmp == null;
      }
   }
}

package com.qq.utils.blit
{
   import asgui.blit.Blit;
   import asgui.blit.data.BlitDataManager;
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.resources.AssetManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   
   public final class QBlitUI
   {
       
      
      public function QBlitUI()
      {
         super();
      }
      
      public static function createContainer() : IBlitDisplayContainer
      {
         return Blit.factory.CreateBlitContainer();
      }
      
      public static function createClipFromClassName(param1:String) : IBlitClip
      {
         var _loc2_:IBlitClip = Blit.factory.CreateBlitClip({"smoothing":true});
         _loc2_.dataProvider = BlitDataManager.GetBlitDataByClass(AssetManager.GetClass(param1));
         _loc2_.Render();
         return _loc2_;
      }
      
      public static function createClipFromSource(param1:*) : IBlitClip
      {
         var _loc2_:IBlitClip = Blit.factory.CreateBlitClip({"smoothing":true});
         _loc2_.dataProvider = BlitDataManager.GetBlitDataByObject(param1);
         _loc2_.Render();
         return _loc2_;
      }
      
      public static function createClipFromUrl(param1:String, param2:int = 0) : IBlitClip
      {
         var _loc3_:IBlitClip = Blit.factory.CreateBlitClip();
         _loc3_.autoUpdatePosition = true;
         _loc3_.dataProvider = BlitDataManager.GetBlitDataByUrl(param1);
         _loc3_.Play(param2);
         return _loc3_;
      }
      
      public static function createClipByRect(param1:int, param2:int, param3:uint) : IBlitClip
      {
         var _loc4_:IBlitClip = Blit.factory.CreateBlitClip();
         var _loc5_:Bitmap = new Bitmap(new BitmapData(param1,param2,true,param3));
         _loc4_.dataProvider = BlitDataManager.GetBlitDataByObject(_loc5_);
         _loc4_.Render();
         return _loc4_;
      }
   }
}

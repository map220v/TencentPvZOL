package asgui.blit.display
{
   import asgui.blit.data.BlitData;
   import asgui.core.IAsguiDisplayObject;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public interface IBlitClip extends IBlitDisplayObject, IAsguiDisplayObject
   {
       
      
      function Play(param1:int = 0) : void;
      
      function GotoAndPlay(param1:Object, param2:int = 1) : void;
      
      function Stop() : void;
      
      function Render() : void;
      
      function get isPlaying() : Boolean;
      
      function get totalFrames() : int;
      
      function get currentFrame() : int;
      
      function set currentFrame(param1:int) : void;
      
      function get frameRateScale() : Number;
      
      function set frameRateScale(param1:Number) : void;
      
      function get autoUpdatePosition() : Boolean;
      
      function set autoUpdatePosition(param1:Boolean) : void;
      
      function get boundary() : Rectangle;
      
      function set dataProvider(param1:BlitData) : void;
      
      function get dataProvider() : BlitData;
      
      function get bitmapData() : BitmapData;
   }
}

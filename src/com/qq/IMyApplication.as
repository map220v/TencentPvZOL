package com.qq
{
   import asgui.containers.Canvas;
   import asgui.controls.Image;
   import asgui.simples.CanvasSimple;
   import flash.display.Sprite;
   
   public interface IMyApplication
   {
       
      
      function get bg() : Image;
      
      function get mainLayer() : CanvasSimple;
      
      function get uiLayer() : Canvas;
      
      function get topEffectLayer() : Sprite;
      
      function checkRootLayer(param1:Object) : Boolean;
   }
}

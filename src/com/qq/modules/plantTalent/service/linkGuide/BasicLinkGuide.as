package com.qq.modules.plantTalent.service.linkGuide
{
   import flash.geom.Rectangle;
   
   public class BasicLinkGuide implements ILinkGuide
   {
       
      
      protected var params:Array;
      
      public function BasicLinkGuide()
      {
         super();
      }
      
      public function setParam(param1:Array) : void
      {
         this.params = param1;
      }
      
      public function linkTo() : void
      {
      }
      
      public function dispose() : void
      {
      }
      
      protected function addGuide(param1:Rectangle, param2:String) : void
      {
      }
   }
}

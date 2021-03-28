package com.qq.modules.td.data.game.unit
{
   import com.qq.modules.td.data.game.unit.ce.TDEndlessModeTemplateCE;
   
   public class TDEndlessModeTemplate extends TDEndlessModeTemplateCE
   {
       
      
      private var _times:Array;
      
      public function TDEndlessModeTemplate()
      {
         super();
      }
      
      public function get times() : Array
      {
         if(!this._times)
         {
            if(time)
            {
               this._times = time.split(",");
            }
         }
         return this._times;
      }
   }
}

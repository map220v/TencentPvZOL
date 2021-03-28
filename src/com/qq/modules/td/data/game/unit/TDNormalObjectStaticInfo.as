package com.qq.modules.td.data.game.unit
{
   import com.qq.modules.td.data.game.ITDStaticData;
   import com.qq.modules.td.data.game.unit.ce.TDNormalObjectTemplateCE;
   
   public class TDNormalObjectStaticInfo extends TDNormalObjectTemplateCE implements ITDStaticData
   {
       
      
      public var InitHideBones:Array;
      
      public function TDNormalObjectStaticInfo()
      {
         super();
         this.InitHideBones = [];
      }
      
      override public function load(param1:Object) : void
      {
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         super.load(param1);
         var _loc2_:String = param1.params;
         if(_loc2_ != null)
         {
            _loc3_ = splitStr(_loc2_,"|");
            for each(_loc4_ in _loc3_)
            {
               _loc5_ = splitStr(_loc4_,":");
               setParam(_loc5_[0],_loc5_[1]);
            }
         }
         this.InitHideBones = splitStr(initHideBones,"|");
         _resFileName = String(param1.resName);
      }
   }
}

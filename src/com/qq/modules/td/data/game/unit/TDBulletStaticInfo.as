package com.qq.modules.td.data.game.unit
{
   import com.qq.modules.td.data.game.ITDStaticData;
   import com.qq.modules.td.data.game.unit.ce.TDBulletTemplateCE;
   
   public class TDBulletStaticInfo extends TDBulletTemplateCE implements ITDStaticData
   {
       
      
      public var hitEffectIDList:Array;
      
      private var _isSort:Number = 0;
      
      public function TDBulletStaticInfo()
      {
         super();
      }
      
      override public function load(param1:Object) : void
      {
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         super.load(param1);
         this.hitEffectIDList = splitStr(param1.hitEffectIDs,"|");
         _resFileName = String(param1.resName);
         var _loc2_:String = !!param1.hasOwnProperty("params") ? param1.params : null;
         if(_loc2_ != null && _loc2_.length > 0)
         {
            _loc3_ = splitStr(_loc2_,"|");
            for each(_loc4_ in _loc3_)
            {
               _loc5_ = splitStr(_loc4_,":");
               setParam(_loc5_[0],_loc5_[1]);
            }
         }
      }
      
      public function get isSort() : Number
      {
         return this._isSort;
      }
   }
}

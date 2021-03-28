package com.qq.modules.qzoneShare.model.templates.ce
{
   import PVZ.Cmd.Dto_IdNum;
   
   public class QZoneShareTemplate extends QZoneShareTemplateCE
   {
       
      
      private var _rewards:Vector.<Dto_IdNum>;
      
      public function QZoneShareTemplate()
      {
         super();
      }
      
      public function get rewards() : Vector.<Dto_IdNum>
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:Dto_IdNum = null;
         var _loc4_:String = null;
         if(!this._rewards)
         {
            this._rewards = new Vector.<Dto_IdNum>();
            if(reward)
            {
               _loc1_ = reward.split("|");
               for each(_loc4_ in _loc1_)
               {
                  _loc2_ = _loc4_.split(":");
                  _loc3_ = new Dto_IdNum();
                  _loc3_.id = _loc2_[0];
                  _loc3_.num = _loc2_[1];
                  this._rewards.push(_loc3_);
               }
            }
         }
         return this._rewards;
      }
   }
}

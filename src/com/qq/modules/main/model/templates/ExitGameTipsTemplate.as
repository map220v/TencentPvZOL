package com.qq.modules.main.model.templates
{
   import com.qq.modules.main.model.templates.ce.ExitGameTipsTemplateCE;
   import com.qq.utils.DateUtils;
   
   public class ExitGameTipsTemplate extends ExitGameTipsTemplateCE
   {
       
      
      private var _timeType:uint;
      
      private var _timeArr:Array;
      
      public function ExitGameTipsTemplate()
      {
         super();
      }
      
      public function get timeType() : uint
      {
         if(this._timeType == 0 && time != "")
         {
            this._timeType = int(time.substr(0,1));
         }
         return this._timeType;
      }
      
      public function get timeArr() : Array
      {
         if(!this._timeArr && time != "")
         {
            this._timeArr = time.substring(2,time.length).split("|");
         }
         return this._timeArr;
      }
      
      public function checkIsInTime() : Boolean
      {
         var _loc1_:Array = null;
         var _loc3_:Date = null;
         var _loc4_:Date = null;
         var _loc5_:Date = null;
         if(this.timeType == 0)
         {
            return true;
         }
         var _loc2_:int = 0;
         if(this.timeType == 1)
         {
            _loc2_ = 0;
            while(_loc2_ < this.timeArr.length)
            {
               _loc1_ = String(this.timeArr[_loc2_]).split(",");
               if(_loc1_.indexOf(DateUtils.getInstance().getServerDate().getDay().toString()) != -1)
               {
                  return true;
               }
               _loc2_++;
            }
         }
         else if(this.timeType == 2)
         {
            _loc2_ = 0;
            while(_loc2_ < this.timeArr.length)
            {
               _loc1_ = String(this.timeArr[_loc2_]).split(",");
               _loc3_ = DateUtils.getInstance().getServerDate();
               _loc4_ = DateUtils.getInstance().getDateFromArr([_loc1_[0],_loc1_[1]]);
               _loc5_ = DateUtils.getInstance().getDateFromArr([_loc1_[2],_loc1_[3]]);
               if(DateUtils.getInstance().getTimeOrder(_loc3_,_loc4_,_loc5_) == 0)
               {
                  return true;
               }
               _loc2_++;
            }
         }
         return false;
      }
   }
}

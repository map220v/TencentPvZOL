package com.qq.modules.quest.model
{
   import PVZ.Cmd.Dto_DailyActivity;
   import com.qq.constant.quest.QuestConstant;
   import com.qq.modules.quest.QuestDataFactory;
   import com.qq.modules.quest.model.templates.ce.DailyActInfoTemplateCE;
   import com.qq.utils.DateUtils;
   
   public class DailyActInfo
   {
       
      
      public var activityID:int;
      
      private var _isShow:Boolean;
      
      public var isClick:Boolean;
      
      public var info:DailyActInfoTemplateCE;
      
      public var dto_activityInfo:Dto_DailyActivity;
      
      public function DailyActInfo(param1:Dto_DailyActivity)
      {
         super();
         this.reset(param1);
      }
      
      public function reset(param1:Dto_DailyActivity) : void
      {
         this.dto_activityInfo = param1;
         this.activityID = param1.activityId;
         this.info = QuestDataFactory.getInstance().getDailyActInfoByID(this.activityID);
         this.isClick = false;
      }
      
      public function get isShow() : Boolean
      {
         if(this.isClick && (this.info.tipType == 1 || this.info.tipType == 3))
         {
            return false;
         }
         return this._isShow;
      }
      
      public function isNeedShow() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc2_:Number = DateUtils.getInstance().getServerTime();
         switch(this.info.tipType)
         {
            case 1:
               if(_loc2_ >= this.dto_activityInfo.beginTime && _loc2_ <= this.dto_activityInfo.endTime)
               {
                  _loc1_ = true;
               }
               break;
            case 2:
            case 3:
               if(_loc2_ >= this.dto_activityInfo.beginTime)
               {
                  _loc1_ = true;
               }
         }
         if(this.dto_activityInfo.endTime != 0 && _loc2_ > this.dto_activityInfo.endTime)
         {
            QuestConstant.needUpdateActData = true;
         }
         return _loc1_;
      }
      
      public function checkNeedShow() : Boolean
      {
         var _loc1_:Boolean = this.isNeedShow();
         var _loc2_:Boolean = false;
         if(this.isShow != _loc1_)
         {
            _loc2_ = true;
            this._isShow = _loc1_;
         }
         return _loc2_;
      }
   }
}

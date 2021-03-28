package com.qq.modules.entryIcon.policy
{
   import com.qq.modules.entryIcon.EntryIconConst;
   import com.qq.modules.entryIcon.command.EntryIconCmd;
   import com.qq.modules.entryIcon.model.EntryIconVO;
   import com.qq.utils.DateUtils;
   import flash.net.SharedObject;
   
   public class LoginPolicy extends BasePolicy
   {
      
      private static const KEY_LAST_LOGIN_TIME:String = "PVZ_LAST_LOGIN_TIME";
      
      private static const ACTIVITY_ICON_DATA:String = "ACTIVITY_ICON_DATA";
      
      private static const SYSTEM_ICON_DATA:String = "SYSTEM_ICON_DATA";
      
      private static const SPLIT_SIGN:String = ",";
       
      
      private var m_shareObj:SharedObject;
      
      private var m_lastLoginDate:Date;
      
      private var m_vecActivity:Vector.<int>;
      
      private var m_vecSystem:Vector.<int>;
      
      public function LoginPolicy()
      {
         super(PolicyType.TYPE_FIRST_LOGIN);
         this.m_shareObj = SharedObject.getLocal("PVZ_ENTRY_ICON");
         var _loc1_:Number = this.readNumber(KEY_LAST_LOGIN_TIME);
         this.m_lastLoginDate = new Date();
         this.m_lastLoginDate.setTime(_loc1_ * 1000);
         this.writeData(KEY_LAST_LOGIN_TIME,DateUtils.getInstance().getServerTime());
         this.m_vecActivity = new Vector.<int>();
         this.m_vecSystem = new Vector.<int>();
         if(this.checkSameDay() == false)
         {
            this.writeData(ACTIVITY_ICON_DATA,"");
            this.writeData(SYSTEM_ICON_DATA,"");
         }
         else
         {
            this.updateData(this.m_vecActivity,this.readString(ACTIVITY_ICON_DATA));
            this.updateData(this.m_vecSystem,this.readString(SYSTEM_ICON_DATA));
         }
      }
      
      private function checkSameDay() : Boolean
      {
         var _loc1_:Date = DateUtils.getInstance().getServerDate();
         return _loc1_.month == this.m_lastLoginDate.month && _loc1_.date == this.m_lastLoginDate.date;
      }
      
      private function readString(param1:String) : String
      {
         var _loc2_:String = "";
         if(this.checkKey(param1))
         {
            _loc2_ = this.m_shareObj.data[param1];
         }
         return _loc2_;
      }
      
      private function checkKey(param1:String) : Boolean
      {
         return this.m_shareObj.data.hasOwnProperty(param1);
      }
      
      private function readNumber(param1:String) : Number
      {
         var _loc2_:Number = 0;
         if(this.checkKey(param1))
         {
            _loc2_ = this.m_shareObj.data[param1];
         }
         return _loc2_;
      }
      
      private function getIconData(param1:Vector.<int>) : String
      {
         return param1.join(SPLIT_SIGN);
      }
      
      private function writeData(param1:String, param2:Object) : void
      {
         this.m_shareObj.data[param1] = param2;
         this.m_shareObj.flush();
      }
      
      private function updateData(param1:Vector.<int>, param2:String) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         param1.length = 0;
         if(param2.length > 0)
         {
            _loc3_ = param2.split(",");
            for each(_loc4_ in _loc3_)
            {
               if(_loc4_ > 0 && param1.indexOf(_loc4_) == -1)
               {
                  param1.push(_loc4_);
               }
            }
         }
      }
      
      public function hideIconEffect(param1:int, param2:int) : void
      {
         var _loc3_:Vector.<int> = null;
         var _loc4_:String = null;
         switch(param2)
         {
            case EntryIconConst.TYPE_ACTIVITY_ICON:
               _loc3_ = this.m_vecActivity;
               _loc4_ = ACTIVITY_ICON_DATA;
               break;
            case EntryIconConst.TYPE_SYSTEM_ICON:
               _loc3_ = this.m_vecSystem;
               _loc4_ = SYSTEM_ICON_DATA;
         }
         if(_loc3_.indexOf(param1) < 0)
         {
            _loc3_.push(param1);
            this.writeData(_loc4_,this.getIconData(_loc3_));
         }
      }
      
      override public function excute(param1:EntryIconVO) : void
      {
         var _loc2_:Vector.<int> = null;
         var _loc3_:Function = null;
         switch(param1.type)
         {
            case EntryIconConst.TYPE_ACTIVITY_ICON:
               _loc2_ = this.m_vecActivity;
               _loc3_ = EntryIconCmd.changeActivityEffect;
               break;
            case EntryIconConst.TYPE_SYSTEM_ICON:
               _loc2_ = this.m_vecSystem;
               _loc3_ = EntryIconCmd.changeSystemEffect;
         }
         _loc3_.call(null,param1.id,_loc2_.indexOf(param1.id) < 0);
      }
   }
}
